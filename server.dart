import 'dart:io';

_sendNotFound(HttpResponse response) {
  response.statusCode = HttpStatus.NOT_FOUND;
  response.close();
}

startServer(num port, String basePath) {
  HttpServer.bind('127.0.0.1', port).then((server) {
    server.listen((HttpRequest request) {
      final String reqPath = request.uri.path.toString() == '/' ? '/index.html' : request.uri.path.toString();
      final File file = new File('${basePath}/build${reqPath}');
      print(file);
      file.exists().then((bool found) {
        if (found) {
          file.openRead()
              .pipe(request.response)
              .catchError((e) { });
        } else {
          _sendNotFound(request.response);
        }
      });
    });
  });
}

main() {
  num port = 8080;
  File script = new File(Platform.script.toFilePath());
  
  print('Starting serving ${script.parent.path} on localhost:${port}'); 
  startServer(port, script.parent.path);
}