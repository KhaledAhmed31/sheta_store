class BannerEntitie {
  final String image;
  final int discount;
  final String category;
  final bool textOnLeft;
  final bool isDark;

  BannerEntitie( {
    this.isDark=false,
    required this.image,
    required this.discount,
    required this.category,
    this.textOnLeft = true,
  });
}
