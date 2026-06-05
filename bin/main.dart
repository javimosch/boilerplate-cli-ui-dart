#!/usr/bin/env dart

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_static/shelf_static.dart';
import 'dart:io';
import 'dart:convert';

void main(List<String> args) {
  final cli = CLI();
  cli.run(args);
}

class CLI {
  void run(List<String> args) {
    if (args.isEmpty) {
      printHelp();
      return;
    }

    final command = args[0];

    switch (command) {
      case 'start':
        startServer(args.skip(1).toList());
        break;
      case 'version':
        printVersion();
        break;
      case 'help':
        printHelp();
        break;
      default:
        print('Unknown command: $command');
        printHelp();
        exit(1);
    }
  }

  void startServer(List<String> args) async {
    int port = 8080;
    
    for (var i = 0; i < args.length; i++) {
      if (args[i] == '-p' || args[i] == '--port') {
        if (i + 1 < args.length) {
          port = int.tryParse(args[i + 1]) ?? 8080;
        }
      }
    }

    print('Server starting on http://localhost:$port/');
    print('UI available at http://localhost:$port/');
    print('API available at http://localhost:$port/api/status');
    print('Press Ctrl+C to stop');
    
    await runServer(port);
  }

  Future<void> runServer(int port) async {
    // Get the path to the web directory
    // When running with `dart run`, Platform.script points to the .dart file
    // When running compiled binary, Platform.script points to the binary
    final scriptPath = Platform.resolvedExecutable;
    final scriptDir = Directory(scriptPath).parent;
    final webDir = Directory('${scriptDir.path}/web');
    
    // Create a handler for static files
    var staticHandler = createStaticHandler(webDir.path, defaultDocument: 'index.html');
    
    // Simple middleware to handle API routes
    var handler = (Request request) async {
      final path = request.url.path;
      
      if (path == 'api/status') {
        final data = {
          'status': 'running',
          'port': port,
          'uptime': '0s',
          'version': '1.0.0'
        };
        return Response.ok(
          json.encode(data),
          headers: {
            'content-type': 'application/json',
            'connection': 'close',
          },
        );
      }
      
      if (path == 'api/health') {
        final data = {
          'status': 'healthy',
          'version': '1.0.0'
        };
        return Response.ok(
          json.encode(data),
          headers: {
            'content-type': 'application/json',
            'connection': 'close',
          },
        );
      }
      
      return await staticHandler(request);
    };
    
    // Start the server
    var server = await serve(handler, InternetAddress.anyIPv4, port);
    
    print('Server started successfully');
    
    // Handle shutdown
    ProcessSignal.sigint.watch().listen((_) {
      print('Shutting down server...');
      server.close();
      exit(0);
    });
  }

  void printVersion() {
    print('boilerplate-cli-ui-dart v1.0.0');
  }

  void printHelp() {
    print('''
boilerplate-cli-ui-dart - Dart CLI with embedded web UI

Usage:
  boilerplate-cli-ui-dart <command> [options]

Commands:
  start       Start HTTP server with web UI
  version     Show version information
  help        Show this help message

Start Options:
  -p, --port PORT  Port for HTTP server (default 8080)

API Endpoints:
  GET /            Web UI
  GET /api/status  Server status (JSON)
  GET /api/health  Health check (JSON)
''');
  }
}