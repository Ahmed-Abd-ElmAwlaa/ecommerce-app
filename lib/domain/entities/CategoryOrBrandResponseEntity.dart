class CategoryOrBrandResponseEntity {
  CategoryOrBrandResponseEntity({
      this.results, 
      this.data,});

  int? results;
  List<CategoryOrBrandEntity>? data;


}

class CategoryOrBrandEntity {
  CategoryOrBrandEntity({
      this.id, 
      this.name, 
      this.slug, 
      this.image,
  });

  String? id;
  String? name;
  String? slug;
  String? image;



}

class Metadata {
  Metadata({
      this.currentPage, 
      this.numberOfPages, 
      this.limit,});

  Metadata.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }
  int? currentPage;
  int? numberOfPages;
  int? limit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['numberOfPages'] = numberOfPages;
    map['limit'] = limit;
    return map;
  }

}