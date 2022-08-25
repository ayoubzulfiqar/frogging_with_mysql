import 'package:dart_frog/dart_frog.dart';
import 'package:frogging/source/data_source.dart';

// we will create a request to read our dataSource
Future<Response> onRequest(RequestContext context) async {
  // reading the context of our dataSource
  final dataRepository = context.read<DataSource>();
  // based on that we will await and fetch the fields from our database
  final users = await dataRepository.fetchFields();
  // than we will return the response as JSON
  return Response.json(body: users);
}
