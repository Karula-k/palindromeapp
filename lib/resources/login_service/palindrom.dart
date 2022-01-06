bool palindrom(String text) {
  text = text.toLowerCase();
  text = text.replaceAll(' ', '');
  if (text.length <= 1) {
    return true;
  } else if (text[0] == text[text.length - 1]) {
    return palindrom(text.substring(1, text.length - 1));
  } else {
    return false;
  }
}
