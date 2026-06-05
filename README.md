# boilerplate-cli-ui-dart

Dart CLI with embedded web UI. Single binary via `dart compile exe`.

## Features

- **Single binary**: No runtime dependencies after compilation
- **Embedded UI**: Vue 3 frontend served from CDN
- **JSON API**: Agent-friendly endpoints at `/api/*`
- **Agent-first**: Structured output, semantic errors
- **Cross-platform**: Compiles to Linux, macOS, Windows, ARM

## Quick Start

### Development

```bash
# Install dependencies
dart pub get

# Run server
dart run bin/main.dart start

# Run with custom port
dart run bin/main.dart start -p 3000
```

### Build

```bash
# Build native binary
./build.sh

# Run binary
./boilerplate-cli-ui-dart start
```

## Usage

```bash
# Start HTTP server
boilerplate-cli-ui-dart start

# Start on custom port
boilerplate-cli-ui-dart start -p 3000

# Show version
boilerplate-cli-ui-dart version

# Show help
boilerplate-cli-ui-dart help
```

## API Endpoints

### GET /api/status

Server status and information.

```json
{
  "status": "running",
  "port": 8080,
  "uptime": "0s",
  "version": "1.0.0"
}
```

### GET /api/health

Health check endpoint.

```json
{
  "status": "healthy",
  "version": "1.0.0"
}
```

## Project Structure

```
boilerplate-cli-ui-dart/
├── bin/
│   └── main.dart          # CLI entry point and HTTP server
├── web/                  # Frontend files (served at runtime)
│   ├── index.html
│   ├── css/
│   └── js/
├── pubspec.yaml
├── build.sh
└── README.md
```

## Tech Stack

- **Language**: Dart 3.5+
- **HTTP Server**: shelf
- **Frontend**: Vue 3 (CDN)
- **Styling**: Tailwind CSS (CDN)
- **Icons**: Lucide (CDN)

## Binary Size

- **Linux x86_64**: ~6.4MB
- **macOS x86_64**: ~6.4MB
- **macOS ARM64**: ~6.4MB
- **Windows x86_64**: ~6.4MB

## Other Versions

| Stack | Repo | Binary |
|-------|------|--------|
| Go + inline HTML | [boilerplate-cli-ui-go](https://github.com/javimosch/boilerplate-cli-ui-go) | ~5MB |
| Go + Vue 3 CDN | [boilerplate-cli-ui-go-v2-vue](https://github.com/javimosch/boilerplate-cli-ui-go-v2-vue) | ~5MB |
| Go + React 18 CDN | [boilerplate-cli-ui-go-v2-react](https://github.com/javimosch/boilerplate-cli-ui-go-v2-react) | ~5MB |
| Deno + vanilla JS | [boilerplate-cli-ui-deno](https://github.com/javimosch/boilerplate-cli-ui-deno) | ~76MB |
| Node.js + vanilla JS | [boilerplate-cli-ui-node](https://github.com/javimosch/boilerplate-cli-ui-node) | ~123MB |
| Python + React CDN | [boilerplate-cli-ui-python](https://github.com/javimosch/boilerplate-cli-ui-python) | ~10MB |
| Rust + vanilla JS | [boilerplate-cli-ui-rust](https://github.com/javimosch/boilerplate-cli-ui-rust) | ~1.1MB |
| .NET 8 + Vue 3 | [boilerplate-cli-ui-dotnet](https://github.com/javimosch/boilerplate-cli-ui-dotnet) | ~89MB |
| C++ + Vue 3 | [boilerplate-cli-ui-cpp](https://github.com/javimosch/boilerplate-cli-ui-cpp) | ~493KB |
| Nim + Vue 3 | [boilerplate-cli-ui-nim](https://github.com/javimosch/boilerplate-cli-ui-nim) | ~364KB |
| Zig + Vue 3 | [boilerplate-cli-ui-zig](https://github.com/javimosch/boilerplate-cli-ui-zig) | ~190KB |
| Dart + Vue 3 | [boilerplate-cli-ui-dart](https://github.com/javimosch/boilerplate-cli-ui-dart) | ~6.4MB |

## License

MIT