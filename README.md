# boilerplate-cli-ui-dart

Dart CLI with embedded web UI. Single binary, no runtime dependencies.
|| V + Vue 3 | [boilerplate-cli-ui-v](https://github.com/javimosch/boilerplate-cli-ui-v) | ~1.2MB | ~5MB |
|| Crystal + Vue 3 | [boilerplate-cli-ui-crystal](https://github.com/javimosch/boilerplate-cli-ui-crystal) | ~3.1MB | ~50MB |
Part of [SuperCLI](https://github.com/javimosch/supercli) - build CLI/UI plugins fast for 2026.
| Stack | Repo | Binary | SDK Size |
|-------|------|--------|----------|
| Go + inline HTML | [boilerplate-cli-ui-go](https://github.com/javimosch/boilerplate-cli-ui-go) | ~5MB | ~150MB |
| Go + Vue 3 CDN | [boilerplate-cli-ui-go-v2-vue](https://github.com/javimosch/boilerplate-cli-ui-go-v2-vue) | ~5MB | ~150MB |
| Go + React 18 CDN | [boilerplate-cli-ui-go-v2-react](https://github.com/javimosch/boilerplate-cli-ui-go-v2-react) | ~5MB | ~150MB |
| Deno + vanilla JS | [boilerplate-cli-ui-deno](https://github.com/javimosch/boilerplate-cli-ui-deno) | ~76MB | ~100MB |
| Node.js + vanilla JS | [boilerplate-cli-ui-node](https://github.com/javimosch/boilerplate-cli-ui-node) | ~123MB | ~500MB+ |
| Python + React CDN | [boilerplate-cli-ui-python](https://github.com/javimosch/boilerplate-cli-ui-python) | ~10MB | ~300MB |
| Rust + vanilla JS | [boilerplate-cli-ui-rust](https://github.com/javimosch/boilerplate-cli-ui-rust) | ~1.1MB | ~800MB |
| .NET 8 + Vue 3 | [boilerplate-cli-ui-dotnet](https://github.com/javimosch/boilerplate-cli-ui-dotnet) | ~89MB | ~600MB |
| C++ + Vue 3 | [boilerplate-cli-ui-cpp](https://github.com/javimosch/boilerplate-cli-ui-cpp) | ~493KB | ~2GB+ |
| Nim + Vue 3 | [boilerplate-cli-ui-nim](https://github.com/javimosch/boilerplate-cli-ui-nim) | ~364KB | ~50MB |
| Zig + Vue 3 | [boilerplate-cli-ui-zig](https://github.com/javimosch/boilerplate-cli-ui-zig) | ~190KB | ~50MB |
| **Dart + Vue 3** | **boilerplate-cli-ui-dart** | **~6.4MB** |
## Architecture
```
boilerplate-cli-ui-dart/
├── bin/
│   └── main.dart          # CLI + HTTP server (shelf)
├── web/                   # Frontend (served at runtime)
│   ├── index.html
│   ├── css/
│   └── js/
├── pubspec.yaml
├── build.sh
└── README.md
## Key Feature: Runtime File Serving
Frontend files are **served from disk** at runtime:
```dart
final webDir = Directory('${scriptDir.path}/web');
var staticHandler = createStaticHandler(webDir.path, defaultDocument: 'index.html');
**Benefits:**
- Single binary output (no runtime dependencies)
- Separate HTML/CSS/JS files (proper syntax highlighting)
- No build step for frontend (CDN-based Vue + Tailwind + Lucide)
- Fast development iteration (no recompile for UI changes)
## Build
```bash
chmod +x build.sh
./build.sh
Or manually:
dart compile exe bin/main.dart -o boilerplate-cli-ui-dart
Output: `boilerplate-cli-ui-dart` (~6.4MB)
## Usage
# Start server (foreground)
./boilerplate-cli-ui-dart start
# Start on custom port
./boilerplate-cli-ui-dart start -p 3000
# Show version
./boilerplate-cli-ui-dart version
# Show help
./boilerplate-cli-ui-dart help
## API Endpoints
| Endpoint | Description |
|----------|-------------|
| `GET /` | Web UI |
| `GET /api/status` | Server status (JSON) |
| `GET /api/health` | Health check (JSON) |
## Frontend Stack
- **Vue 3** (CDN) - Reactive UI with hashbang routing
- **Tailwind CSS** (CDN) - Utility-first styling
- **Lucide Icons** (CDN) - Icon library
## Comparison with Go Versions
| Aspect | Go | Dart |
|--------|-----|------|
| Binary size | ~5MB | ~150MB | ~6.4MB | ~400MB |
| Compile time | Fast | Fast |
| Memory safety | GC | Type system |
| Web framework | net/http | shelf |
| File serving | go:embed | Runtime static handler |
## Development
### Edit Frontend
1. Edit files in `web/`
2. Run `dart run bin/main.dart start` (no recompile needed)
3. Refresh browser
### Add API Endpoint
if (path == 'api/my-endpoint') {
  final data = {'result': 'success'};
  return Response.ok(json.encode(data));
}
## License
MIT
