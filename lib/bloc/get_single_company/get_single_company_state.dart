import 'package:flutter_bloc_cubit_part1/data/models/get_single_company/company_model.dart';

abstract class CompanyState {}

class InitialCompanyState extends CompanyState {}

class LoadCompanyInProgress extends CompanyState {}

class LoadCompanyInSuccess extends CompanyState {
  LoadCompanyInSuccess({required this.companyModel});

  final CompanyModel companyModel;
}

class LoadCompanyInFailure extends CompanyState {
  LoadCompanyInFailure({required this.errorText});

  final String errorText;
}