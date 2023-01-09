import 'package:flutter_bloc_cubit_part1/data/models/my_response.dart';
import 'package:flutter_bloc_cubit_part1/data/services/api_service.dart';

class CompanyRepository {
  CompanyRepository({required this.apiService});

  final ApiService apiService;

  Future<MyResponse> getAllCompanies() => apiService.getAllCompanies();

  Future<MyResponse> getSingleAlbumById({required int id}) => apiService.getSingleCompany(id: id);
}
