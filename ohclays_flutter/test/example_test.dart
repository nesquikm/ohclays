import 'package:ohclays_client/ohclays_client.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:test/test.dart';

void main() {
  late Client client;

  setUp(() {
    client = Client('http://$localhost:8080/');
  });

  tearDown(() {
    client.close();
  });

  group('Test', () {
    test('test endpoint', () async {
      final result = await client.example.hello('J0hn');
      expect(result, 'Hello J0hn');
    });
  });
}
