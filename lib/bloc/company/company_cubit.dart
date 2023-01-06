import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit_part1/bloc/company/company_state.dart';
import 'package:flutter_bloc_cubit_part1/data/models/my_response.dart';
import 'package:flutter_bloc_cubit_part1/data/repositories/companies_repository.dart';


class CompanyCubit extends Cubit<CompanyState> {
  CompanyCubit(this.companyRepository) : super(InitialCompanyState()) {
    // 1  fetchAllAlbums();
  }

  final CompanyRepository companyRepository;

  fetchAllAlbums() async {
    //loading
    emit(LoadCompaniesInProgress());
    MyResponse myResponse = await companyRepository.getAllCompanies();
    if (myResponse.error.isEmpty) {
      //success
      emit(LoadCompaniesInSuccess(albums: myResponse.data));
    } else {
      //error
      emit(LoadCompaniesInFailure(errorText: myResponse.error));
    }
  }
}