import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:frogging/database/sql_client.dart';

/// initializing our SQL Client
final mysqlClient = MySQLClient();

/*

Handler:- handle the request
IP:- Default as 127.0.0.1 OR localhost
PORT:- Default 8080

 */

// function to run our HTTP server
Future<HttpServer> run(Handler handler, InternetAddress ip, int port) {
  return serve(handler.use(databaseHandler()), ip, port);
}

// handling the request for our database by reading it's context
Middleware databaseHandler() {
  return (handler) {
    return handler.use(
      provider<MySQLClient>(
        (context) => mysqlClient,
      ),
    );
  };
}
