import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:homemade_food_app/features/profile/data/repo/profile_repo.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utilities/api_service.dart';
import '../models/profile_model.dart';

class ProfileRepoImp extends ProfileRepo {
  final ApiService apiService;

  ProfileRepoImp(this.apiService);

  @override
  Future<Either<Failure, ProfileModel>> fetchUserData({required String token, required int? id})async {
    try {
      final data = await apiService.get(
          endPoint: '/api/auth/profile/$id/',
          token: token
      );

      final profileModel = ProfileModel.fromJson(data);

      return right(profileModel);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}