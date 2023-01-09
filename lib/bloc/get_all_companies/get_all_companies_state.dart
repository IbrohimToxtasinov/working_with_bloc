import 'package:flutter_bloc_cubit_part1/data/models/get_all_company/companies_model.dart';

abstract class CompaniesState {}

class InitialCompaniesState extends CompaniesState {}

class LoadCompaniesInProgress extends CompaniesState {}

class LoadCompaniesInSuccess extends CompaniesState {
  LoadCompaniesInSuccess({required this.data});

  final List<Data> data;
}

class LoadCompaniesInFailure extends CompaniesState {
  LoadCompaniesInFailure({required this.errorText});

  final String errorText;
}
