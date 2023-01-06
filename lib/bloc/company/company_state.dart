import 'package:flutter_bloc_cubit_part1/data/models/companies_model.dart';

abstract class CompanyState {}

class InitialCompanyState extends CompanyState {}

class LoadCompaniesInProgress extends CompanyState {}

class LoadCompaniesInSuccess extends CompanyState {
  LoadCompaniesInSuccess({required this.albums});

  final List<Data> albums;
}

class LoadCompaniesInFailure extends CompanyState {
  LoadCompaniesInFailure({required this.errorText});

  final String errorText;
}



