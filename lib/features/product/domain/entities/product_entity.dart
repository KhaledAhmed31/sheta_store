class ProductEntity {
  final String? id;
  final String? title;
  final String? description;
  final int? price;
  final int? priceAfterDiscount;
  final List<String>? images;
  final int? sold;
  final double? ratingAverage;
  final String? categoryId;
  final int? ratingsQuantity ;
  final int? quantity;
  final String? imageCover;
  ProductEntity(  {this.imageCover, 
this.quantity,
    this.ratingsQuantity,
    this.categoryId,
    this.priceAfterDiscount,
    this.sold,
    this.ratingAverage,
    this.id,
    this.title,
    this.description,
    this.price,
    this.images,
  });
}
