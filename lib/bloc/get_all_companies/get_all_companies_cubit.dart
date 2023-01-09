import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit_part1/bloc/get_all_companies/get_all_companies_event.dart';
import 'package:flutter_bloc_cubit_part1/bloc/get_all_companies/get_all_companies_state.dart';
import 'package:flutter_bloc_cubit_part1/data/models/my_response.dart';
import 'package:flutter_bloc_cubit_part1/data/repositories/companies_repository.dart';

class CompaniesCubit extends Bloc<CompaniesEvent, CompaniesState> {
  CompaniesCubit(this.companyRepository) : super(InitialCompaniesState()) {
    on<FetchAllAlbums>(_fetchAllAlbums);
  }

  final CompanyRepository companyRepository;

  _fetchAllAlbums(FetchAllAlbums event, Emitter<CompaniesState> emit) async {
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