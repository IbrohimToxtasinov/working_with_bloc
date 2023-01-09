import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit_part1/bloc/get_all_companies/get_all_companies_cubit.dart';
import 'package:flutter_bloc_cubit_part1/bloc/get_all_companies/get_all_companies_state.dart';
import 'package:flutter_bloc_cubit_part1/data/repositories/companies_repository.dart';
import 'package:flutter_bloc_cubit_part1/data/services/api_service.dart';

class CompaniesScreenWithBloBuilder extends StatelessWidget {
  const CompaniesScreenWithBloBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CompaniesCubit(CompanyRepository(apiService: ApiService())),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Companies with Bloc Builder"),
        ),
        body: BlocBuilder<CompaniesCubit, CompaniesState>(
            builder: (context, state) {
          if (state is InitialCompaniesState) {
            return const Center(
              child: Text("hozircha data yo'q"),
            );
          } else if (state is LoadCompaniesInProgress) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadCompaniesInSuccess) {
            return Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.only(left: 15, right: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 1, color: Colors.grey),
                          ),
                          child: Center(
                              child: Image(
                            image: NetworkImage(state.data[index].logo),
                            width: 150,
                          )),
                        ),
                      ),
                    );
                  },
                ),
            );
          } else if (state is LoadCompaniesInFailure) {
            return Center(
              child: Text(
                state.errorText,
                style: const TextStyle(fontSize: 24, color: Colors.red),
              ),
            );
          }
          return const Text("Errorga kirdi");
        }),
      ),
    );
  }
}