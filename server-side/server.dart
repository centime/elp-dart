import 'dart:io';
import 'package:json/json.dart' as json;


const num PORT = 8080;
List<String> todos = ['naze','deuze'];


_sendNotFound(HttpResponse response) {
  response.statusCode = HttpStatus.NOT_FOUND;
  response.close();
}

startServer(num port, String basePath) {
  HttpServer.bind('127.0.0.1', port).then((server) {
    server.listen((HttpRequest request) {


      final String reqPath = request.uri.path.toString() == '/' ? '/todo2.html' : request.uri.path.toString();
      
      if ( reqPath == '/api/' ){
        print('api');
        request.response.write(json.stringify(todos));
        request.response.close();

      }else{

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

      };
    });
  });
}

main() {
  File script = new File(Platform.script.toFilePath());
  
  print('Starting serving ${script.parent.path} on localhost:${PORT}'); 
  startServer(PORT, script.parent.path);
}