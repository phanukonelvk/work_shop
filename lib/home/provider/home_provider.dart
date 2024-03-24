import 'package:flutter/material.dart';
import 'package:work_shop/app_connect/app_api_path.dart';
import 'package:work_shop/home/api_service/app_api_service.dart';
import 'package:work_shop/home/model/home_detail_model.dart';
import 'package:work_shop/home/model/home_model.dart';


class HomeProvider extends ChangeNotifier {
  final ApiService? _apiService;

  HomeProvider({
    ApiService? apiService,
  }) : _apiService = apiService;

  KPVModel? _data;
  bool _isLoading = false;
  String? _errorMessage;

  KPVModel? get data => _data;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  KPVDetailModel? _listDetail;

  KPVDetailModel? get listDetail => _listDetail;

  Future<void> fetchData() async {
    try {
      final response = await _apiService!.dio
          .get(ApiPath.home); 
      _data = KPVModel.fromJson(response.data);
      _errorMessage = null;
    } catch (error) {
      print('Error fetching data: $error');
      _errorMessage = 'Something went wrong'; 
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchDataDetail({String? id}) async {
    try {
      final response = await _apiService!.dio
          .get('${ApiPath.home}/$id'); 
      _listDetail = KPVDetailModel.fromJson(response.data);
      _errorMessage = null;
    } catch (error) {
      print('Error fetching data: $error');
      _errorMessage = 'Something went wrong'; 
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /*
  Future<void> fetchPosts() async {
    try {
      final response = await _apiService!.dio.get('/posts');
      if (response.statusCode == 200) {
        _data = (response.data as List)
            .map((json) => PostModel.fromJson(json))
            .toList();
        notifyListeners();
      } else {
        print('Error fetching posts: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching posts: $error');
    }
  }
  */
}
