import 'package:flutter/cupertino.dart';
import 'package:palindromeapp/model/user.dart';
import 'package:palindromeapp/resources/api/api_user.dart';
import 'package:palindromeapp/resources/enum/enum_check.dart';

class ApiUserProvider extends ChangeNotifier {
  final ApiService apiService;
  ApiUserProvider({required this.apiService}) {
    fetchList();
  }
  List<UserData> _list = [];
  List<UserData> get list => _list;
  ResultState _state = ResultState.noData;
  ResultState get state => _state;
  String _massage = "";
  String get massage => _massage;

  void update() {
    fetchList();
  }

  void nextPage(int number) {
    _fetchUpdate(number);
  }

  Future<dynamic> fetchList() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final listHeader = await apiService.userlist(1, 8);
      if (listHeader.data.isNotEmpty) {
        _state = ResultState.hasData;
        notifyListeners();
        return _list = listHeader.data;
      } else {
        _state = ResultState.noData;
        notifyListeners();
        return _massage = "No Data";
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _massage = "Error, try check your internet connection";
    }
  }

  Future<dynamic> _fetchUpdate(int number) async {
    try {
      notifyListeners();
      final listHeader = await apiService.userlist(2 + number, 8);
      if (listHeader.data.isNotEmpty) {
        _state = ResultState.hasData;
        notifyListeners();
        return _list.addAll(listHeader.data);
      } else {
        _state = ResultState.endCheck;
        notifyListeners();
        return _list;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _massage = "Error, try check your internet connection";
    }
  }
}
