class ProductEntity {
  final String? id;
  final String? title;
  final String? description;
  final int? price;
  final int? priceAfterDiscount;
  final List<String>? images;
  final int? sold;
  final double? ratingAverage;

  ProductEntity( {this.priceAfterDiscount,
    this.sold,
    this.ratingAverage,
    this.id,
    this.title,
    this.description,
    this.price,
    this.images,
  });
}
