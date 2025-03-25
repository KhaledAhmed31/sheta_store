class ProductRequest {
  int? page;
  String? sort;
  int? price;
  int? limit;
  String? keyWord;
  String? categoryId;
  ProductRequest({
    this.page,
    this.sort,
    this.price,
    this.limit,
    this.keyWord,
    this.categoryId,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{
    if (page != null) 'page': page,
    if (sort != null) 'sort': sort,
    if (price != null) 'price': price,
    if (limit != null) 'limit': limit,
    if (keyWord != null) 'keyWord': keyWord,
    if (categoryId != null) 'category[in]': categoryId,
  };
}
