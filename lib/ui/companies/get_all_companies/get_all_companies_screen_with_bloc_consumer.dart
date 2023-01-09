import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit_part1/bloc/get_all_companies/get_all_companies_cubit.dart';
import 'package:flutter_bloc_cubit_part1/bloc/get_all_companies/get_all_companies_event.dart';
import 'package:flutter_bloc_cubit_part1/bloc/get_all_companies/get_all_companies_state.dart';
import 'package:flutter_bloc_cubit_part1/ui/companies/get_all_companies/get_all_companies_screen_with_bloc_builder.dart';
import 'package:flutter_bloc_cubit_part1/ui/companies/get_single_company/get_single_compnay.dart';
import 'package:flutter_bloc_cubit_part1/utils/my_utils.dart';

class CompaniesScreenWithBlocConsumer extends StatelessWidget {
  const CompaniesScreenWithBlocConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //2 BlocProvider.of<AlbumCubit>(context).fetchAllAlbums();
    return Scaffold(
        appBar: AppBar(
          actions: [
            
            IconButton(
                onPressed: () {
                  BlocProvider.of<CompaniesCubit>(context).add(FetchAllAlbums());
                },
                icon: const Icon(Icons.upload)),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) =>
                            const CompaniesScreenWithBloBuilder())));
              },
              child: Icon(Icons.arrow_forward),
            ),
            const SizedBox(width: 20),
          ],
          title: const Text("Companies with Bloc Consumer"),
        ),
        body: BlocConsumer<CompaniesCubit, CompaniesState>(
          builder: (context, state) {
            if (state is InitialCompaniesState) {
              return const Center(
                child: Text("Hali data yo'q"),
              );
            } else if (state is LoadCompaniesInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LoadCompaniesInSuccess) {
              return GridView.builder(
                shrinkWrap: true,
                itemCount: state.data.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                InfoPage(id: state.data[index].id),
                          ),
                        );
                      },
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
              );
            } else if (state is LoadCompaniesInFailure) {
              return Center(
                child: Text(
                  state.errorText,
                ),
              );
            }
            return const SizedBox();
          },
          listener: (context, state) {
            if (state is LoadCompaniesInProgress) {
              MyUtils.getMyToast(message: "Loading in progress...");
            }
            if (state is LoadCompaniesInSuccess) {
              MyUtils.getMyToast(
                  message: "${state.data.length.toString()} ta ma'lumot keldi");
            }
            if (state is LoadCompaniesInFailure) {
              MyUtils.getMyToast(message: "Xatolik yuz berdi!");
            }
          },
        ));
  }
}
