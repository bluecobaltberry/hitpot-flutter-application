import 'dart:convert';
import 'package:http/http.dart' as http;

const url =
    'https://seshro3p93.execute-api.ap-northeast-2.amazonaws.com/dev/items';

Future<List<dynamic>> getAllItems() async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load items');
  }
}

Future<void> addItem({
  required String projectType,
  required String potId,
  required String username,
  required int userage,
  required String projectName,
  required String level,
  required String region,
  required String onoffline,
  required String period,
  required String ageRange,
  required String memNum,
  required String members,
  required String likeNum,
}) async {
  final response = await http.put(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'ProjectType': projectType,
      'PotId': potId,
      'username': username,
      'userage': userage,
      'projectName': projectName,
      'level': level,
      'region': region,
      'onoffline': onoffline,
      'period': period,
      'ageRange': ageRange,
      'memNum': memNum,
      'members': members,
      'likeNum': likeNum,
    }),
  );

  if (response.statusCode == 200) {
    print('Item added successfully');
  } else {
    print('Failed to add item');
  }
}

Future<Map<String, dynamic>> getItem({
  required String projectType,
  required String potId,
}) async {
  final response = await http.get(Uri.parse('$url/$projectType/$potId'));

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load items');
  }
}

Future<void> deleteItem({
  required String projectType,
  required String potId,
}) async {
  final response = await http.delete(Uri.parse('$url/$projectType/$potId'));

  if (response.statusCode == 200) {
    print('Item deleted successfully');
  } else {
    print('Failed to delete item');
  }
}

Future<void> updateItem({
  required String projectType,
  required String potId,
  required String username,
  required int userage,
  required String projectName,
  required String level,
  required String region,
  required String onoffline,
  required String period,
  required String ageRange,
  required String memNum,
  required String members,
  required String likeNum,
}) async {
  final response = await http.patch(
    Uri.parse('$url/$projectType/$potId'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'username': username,
      'userage': userage,
      'projectName': projectName,
      'level': level,
      'region': region,
      'onoffline': onoffline,
      'period': period,
      'ageRange': ageRange,
      'memNum': memNum,
      'members': members,
      'likeNum': likeNum,
    }),
  );

  if (response.statusCode == 200) {
    print('Item updated successfully');
  } else {
    print('Failed to update item');
  }
}
