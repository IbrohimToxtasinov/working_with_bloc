import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit_part1/bloc/get_single_company/get_single_company_state.dart';
import 'package:flutter_bloc_cubit_part1/data/models/my_response.dart';
import 'package:flutter_bloc_cubit_part1/data/repositories/companies_repository.dart';


class CompanyCubit extends Cubit<CompanyState> {
  CompanyCubit(this.companyRepository) : super(InitialCompanyState());

  final CompanyRepository companyRepository;

  fetchSingleCompany({required int id}) async {
    //loading
    emit(LoadCompanyInProgress());
    MyResponse myResponse = await companyRepository.getSingleAlbumById(id: id);
    if (myResponse.error.isEmpty) {
      //success
      emit(LoadCompanyInSuccess(companyModel: myResponse.data));
    } else {
      //error
      emit(LoadCompanyInFailure(errorText: myResponse.error));
    }
  }
}