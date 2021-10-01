class Country {
  const Country({
    required this.iso2,
    required this.title,
    required this.phoneCode,
    this.phoneMask,
  });

  final String iso2;
  final String title;
  final String phoneCode;
  final String? phoneMask;
}
