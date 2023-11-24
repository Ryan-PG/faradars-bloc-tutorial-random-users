import 'package:dio/dio.dart';

import '../models/user.dart';

class RemoteDataSource {
  static Future<List<User>?> getUsersList({
    required int numberOfUsers,
  }) async {
    List<User> usersList = [];

    // API Call
    final dio = Dio();
    try {
      final result = await dio.get(
        "https://randomuser.me/api/?results=$numberOfUsers",
      );

      if (result.statusCode == 200) {
        // Success
        final dataMap = result.data["results"] as List<dynamic>;

        for (var item in dataMap) {
          usersList.add(User.fromJson(item));
        }
      } else {
        // Fail
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }

    // Update usersList

    return usersList;
  }
}
