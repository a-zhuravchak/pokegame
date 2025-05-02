extension StringTrimUtils on String {
  String get byTrimmingLeftSlash {
    if (isEmpty) return this;
    var tmp = this;
    while (tmp.startsWith('/')) {
      tmp = tmp.substring(1);
    }
    return tmp;
  }

  String get byRemovingFirstPathComponent {
    final index = indexOf('/', 1);
    if (index == -1) {
      return '';
    }
    return substring(index);
  }
}
