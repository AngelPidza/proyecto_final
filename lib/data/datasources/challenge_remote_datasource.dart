// lib/data/datasources/challenge_remote_datasource.dart
import 'package:proyecto_final/core/utils/api_helper.dart';
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
//     // Para pruebas, podemos retornar datos mock
//     return [
//       ChallengeDTO(
//         id: '1',
//         title: 'Reciclaje Semanal',
//         description: 'Separa tus residuos correctamente',
//         impact: 'Alto',
//         difficulty: 'Fácil',
//         steps: [
//           'Separa plásticos, papel y vidrio',
//           'Limpia los materiales',
//           'Llévalos al punto de reciclaje',
//           'Registra tu progreso en la app'
//         ],
//       ),
//       ChallengeDTO(
//         id: '2',
//         title: 'Ahorro de Agua',
//         description: 'Reduce tu consumo de agua',
//         impact: 'Alto',
//         difficulty: 'Medio',
//         steps: [
//           'Cierra la llave mientras te cepillas',
//           'Repara fugas',
//           'Recolecta agua de lluvia',
//           'Riega las plantas temprano'
//         ],
//       ),
//       ChallengeDTO(
//         id: '3',
//         title: 'Transporte Sostenible',
//         description: 'Usa medios de transporte eco-friendly',
//         impact: 'Alto',
//         difficulty: 'Medio',
//         steps: [
//           'Usa bicicleta para distancias cortas',
//           'Comparte coche',
//           'Utiliza transporte público',
//           'Camina cuando sea posible'
//         ],
//       ),
//     ];
//   }
// }
class ChallengeRemoteDataSourceImpl implements ChallengeRemoteDataSource {
  final ApiHelper apiHelper;

  ChallengeRemoteDataSourceImpl(this.apiHelper);

  @override
  Future<List<ChallengeDTO>> getFeaturedChallenges() async {
    try {
      // Implementación de conexión a MongoDB.
      await apiHelper.openConnection();

      final collection = apiHelper.getCollection('challenges');
      final results = await collection.find().toList();

      // Implementación de desconexión a MongoDB.
      await apiHelper.closeConnection();

      return results.map((json) => ChallengeDTO.fromJson(json)).toList();
    } catch (e) {
      throw ServerException();
    }
  }
}
