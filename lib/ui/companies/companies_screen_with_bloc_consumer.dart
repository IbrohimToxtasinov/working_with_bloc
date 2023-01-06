import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit_part1/bloc/company/company_cubit.dart';
import 'package:flutter_bloc_cubit_part1/bloc/company/company_state.dart';
import 'package:flutter_bloc_cubit_part1/ui/companies/companies_screen_with_bloc_builder.dart';
import 'package:flutter_bloc_cubit_part1/utils/my_utils.dart';

class CompaniesScreenWithBlocConsumer extends StatelessWidget {
  const CompaniesScreenWithBlocConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //2 BlocProvider.of<AlbumCubit>(context).fetchAllAlbums();
    return Scaffold(
        appBar: AppBar(
          actions: [
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
        body: BlocConsumer<CompanyCubit, CompanyState>(
          builder: (context, state) {
            if (state is InitialCompanyState) {
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



// import 'package:car_shop/screens/info_page.dart';
// import 'package:car_shop/view_model/company_view_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:provider/provider.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   void initState() {
//     Future.microtask(
//         () => context.read<CompanyViewModel>().fetchCompaniesData());
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Companies"),
//       ),
//       body: Container(
//         height: MediaQuery.of(context).size.height * 0.9,
//         width: double.infinity,
//         margin: const EdgeInsets.all(15),
//         child: Consumer<CompanyViewModel>(
//             builder: (context, companiesViewModel, child) {
//           return companiesViewModel.isLoading
//               ? const Center(child: CircularProgressIndicator())
//               : (companiesViewModel.companies == null
//                   ? const Text("Hozircha malumot yo'q")
//                   : GridView.builder(
//                       shrinkWrap: true,
//                       itemCount: companiesViewModel.companies!.data.length,
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2),
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: const EdgeInsets.only(bottom: 20),
//                           child: InkWell(
//                             onTap: () {
//                               Navigator.push(context, MaterialPageRoute(builder: (_) => InfoPage(id: companiesViewModel.companies!.data[index].id, companyName: companiesViewModel.companies!.data[index].carModel,)));
//                             },
//                             child: Container(
//                               margin:
//                                   const EdgeInsets.only(left: 15, right: 15),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 border:
//                                     Border.all(width: 1, color: Colors.grey),
//                               ),
//                               child: Center(
//                                   child: Image(
//                                 image: NetworkImage(companiesViewModel
//                                     .companies!.data[index].logo),
//                                 width: 150,
//                               )),
//                             ),
//                           ),
//                         );
//                       },
//                     ));
//         }),
//       ),
//     );
//   }
// }
