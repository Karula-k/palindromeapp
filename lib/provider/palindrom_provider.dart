import 'package:flutter/cupertino.dart';
import 'package:palindromeapp/resources/login_service/palindrom.dart';

class PalindromProvider extends ChangeNotifier {
  String _massage = "";
  String get massage => _massage;

  String palindromCheck(String text) {
    try {
      if (palindrom(text)) {
        return _massage = "isPalindrome";
      } else {
        return _massage = "not palindrome";
      }
    } catch (e) {
      return _massage = "Error happens";
    }
  }
}
