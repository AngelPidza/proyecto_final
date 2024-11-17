// lib/data/datasources/challenge_remote_datasource.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/errors/exceptions.dart';
import '../models/challenge_dto.dart';

abstract class ChallengeRemoteDataSource {
  Future<List<ChallengeDTO>> getFeaturedChallenges();
}

// class ChallengeRemoteDataSourceImpl implements ChallengeRemoteDataSource {
//   final http.Client client;

//   ChallengeRemoteDataSourceImpl(this.client);

//   @override
//   Future<List<ChallengeDTO>> getFeaturedChallenges() async {
//     try {
//       final response = await client.get(
//         Uri.parse('https://api.ecoaction.com/challenges/featured'),
//       );
//       if (response.statusCode == 200) {
//         final List<dynamic> jsonList = json.decode(response.body);
//         return jsonList.map((json) => ChallengeDTO.fromJson(json)).toList();
//       } else {
//         throw ServerException('Failed to load challenges');
//       }
//     } catch (e) {
//       throw ServerException(e.toString());
//     }
//   }
// }

class ChallengeRemoteDataSourceImpl implements ChallengeRemoteDataSource {
  final http.Client client;

  ChallengeRemoteDataSourceImpl(this.client);

  @override
  Future<List<ChallengeDTO>> getFeaturedChallenges() async {
    // Para pruebas, podemos retornar datos mock
    return [
      ChallengeDTO(
        id: '1',
        title: 'Reciclaje Semanal',
        description: 'Separa tus residuos correctamente',
        impact: 'Alto',
        difficulty: 'Fácil',
        steps: [
          'Separa plásticos, papel y vidrio',
          'Limpia los materiales',
          'Llévalos al punto de reciclaje',
          'Registra tu progreso en la app'
        ],
      ),
      ChallengeDTO(
        id: '2',
        title: 'Ahorro de Agua',
        description: 'Reduce tu consumo de agua',
        impact: 'Alto',
        difficulty: 'Medio',
        steps: [
          'Cierra la llave mientras te cepillas',
          'Repara fugas',
          'Recolecta agua de lluvia',
          'Riega las plantas temprano'
        ],
      ),
      ChallengeDTO(
        id: '3',
        title: 'Transporte Sostenible',
        description: 'Usa medios de transporte eco-friendly',
        impact: 'Alto',
        difficulty: 'Medio',
        steps: [
          'Usa bicicleta para distancias cortas',
          'Comparte coche',
          'Utiliza transporte público',
          'Camina cuando sea posible'
        ],
      ),
    ];
  }
}
