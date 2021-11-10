extension Search on String {
  int diffIndexOf(String substring) {
    late final String haystack;
    late final String needle;

    if (length >= substring.length) {
      haystack = this;
      needle = substring;
    } else {
      haystack = substring;
      needle = this;
    }

    return haystack.split('').asMap().entries.toList().indexWhere((entry){
      return entry.value != needle.charAt(entry.key);
    });
  }

  String? charAt(int position) {
    late final String? char;

    try {
      char = this[position];
    } catch (_){
      char = null;
    }

    return char;
  }
}
