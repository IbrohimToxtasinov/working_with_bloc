import 'package:dio/dio.dart';
import 'package:flutter_bloc_cubit_part1/data/models/get_all_company/companies_model.dart';
import 'package:flutter_bloc_cubit_part1/data/models/get_single_company/company_model.dart';
import 'package:flutter_bloc_cubit_part1/data/models/my_response.dart';
import 'package:flutter_bloc_cubit_part1/data/services/api_client.dart';

class ApiService extends ApiClient {
  Future<MyResponse> getAllCompanies() async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio.get("${dio.options.baseUrl}/companies");
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        myResponse.data = ((response.data)["data"] as List?)
                ?.map((e) => Data.fromJson(e))
                .toList() ??
            [];
      }
    } catch (error) {
      myResponse.error = error.toString();
    }
    return myResponse;
  }

  Future<MyResponse> getSingleCompany({required int id}) async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio
          .get("https://easyenglishuzb.free.mockoapp.net/companies/$id");
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        myResponse.data = CompanyModel.fromJson(response.data);
      }
    } catch (error) {
      myResponse.error = error.toString();
    }
    return myResponse;
  }
}
