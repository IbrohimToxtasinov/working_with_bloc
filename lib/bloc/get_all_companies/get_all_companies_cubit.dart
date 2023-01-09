import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit_part1/bloc/get_all_companies/get_all_companies_state.dart';
import 'package:flutter_bloc_cubit_part1/data/models/my_response.dart';
import 'package:flutter_bloc_cubit_part1/data/repositories/companies_repository.dart';


class CompaniesCubit extends Cubit<CompaniesState> {
  CompaniesCubit(this.companyRepository) : super(InitialCompaniesState()) {
    fetchAllCompanies();
  }

  final CompanyRepository companyRepository;

  fetchAllCompanies() async {
    //loading
    emit(LoadCompaniesInProgress());
    MyResponse myResponse = await companyRepository.getAllCompanies();
    if (myResponse.error.isEmpty) {
      //success
      emit(LoadCompaniesInSuccess(data: myResponse.data));
    } else {
      //error
      emit(LoadCompaniesInFailure(errorText: myResponse.error));
    }
  }
}