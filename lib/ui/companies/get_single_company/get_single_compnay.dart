import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit_part1/bloc/get_single_company/get_single_company_cubit.dart';
import 'package:flutter_bloc_cubit_part1/bloc/get_single_company/get_single_company_event.dart';
import 'package:flutter_bloc_cubit_part1/bloc/get_single_company/get_single_company_state.dart';
import 'package:flutter_bloc_cubit_part1/data/repositories/companies_repository.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  int _currentPage = 0;
  final PageController _controller = PageController();

  _onChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CompanyCubit>(
      create: (context) => CompanyCubit(context.read<CompanyRepository>())
        ..add(FetchSingleCompany(id: widget.id)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Deatiled Page"),
        ),
        body:
            BlocBuilder<CompanyCubit, CompanyState>(builder: (context, state) {
          if (state is InitialCompanyState) {
            return const Center(
              child: Text("Hali data yo'q"),
            );
          } else if (state is LoadCompanyInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadCompanyInSuccess) {
            return Column(
              children: [
                SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      PageView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: _controller,
                        itemCount: state.companyModel.carPics.length,
                        onPageChanged: _onChanged,
                        itemBuilder: (context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        state.companyModel.carPics[index]),
                                    fit: BoxFit.cover)),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(
                      state.companyModel.carPics.length, (int index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 10,
                      width: (index == _currentPage) ? 15 : 10,
                      margin: const EdgeInsets.only(top: 15, left: 5, right: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: (index == _currentPage)
                              ? Colors.blue
                              : Colors.blue.withOpacity(0.5)),
                    );
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 20, top: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.network(
                          state.companyModel.logo,
                          width: 150,
                          height: 75,
                        ),
                        Column(
                          children: [
                            Text(
                              "Avarage Price :${state.companyModel.averagePrice}\$",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "Established Year : ${state.companyModel.establishedYear}",
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16),
                            ),
                          ],
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Text(
                    state.companyModel.description,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ],
            );
          } else if (state is LoadCompanyInFailure) {
            return Center(
              child: Text(
                state.errorText,
              ),
            );
          }
          return const SizedBox();
        }),
      ),
    );
  }
}
