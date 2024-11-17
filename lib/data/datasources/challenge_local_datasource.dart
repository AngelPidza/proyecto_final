import 'dart:convert';

import 'package:proyecto_final/core/errors/exceptions.dart';
import 'package:proyecto_final/data/models/challenge_dto.dart';
import 'package:http/http.dart' as http;

abstract class ChallengeLocalDataSource {
  Future<List<ChallengeDTO>> getFeaturedChallenges();
}

class ChallengeLocalDataSourceImpl implements ChallengeLocalDataSource {
  final http.Client client;

  ChallengeLocalDataSourceImpl(this.client);

  @override
  Future<List<ChallengeDTO>> getFeaturedChallenges() async {
    final response = await client.get(
      Uri.parse('https://api.ecoaction.com/challenges/featured'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => ChallengeDTO.fromJson(json)).toList();
    } else {
      throw ServerException();
    }
  }
}
