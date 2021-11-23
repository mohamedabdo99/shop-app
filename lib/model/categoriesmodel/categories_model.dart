class CategoriesModel {
 late bool status;
 late Null message;
 late CategoriesDataModel data;

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = (json['data'] != null ? new CategoriesDataModel.fromJson(json['data']) : null)!;
  }

}

class CategoriesDataModel {
   int? currentPage;
   List<DataCategories>? data;
   String? firstPageUrl;
   int? from;
   int? lastPage;
   String? lastPageUrl;
   Null? nextPageUrl;
   String? path;
   int? perPage;
   Null? prevPageUrl;
   int? to;
   int? total;


   CategoriesDataModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <DataCategories>[];
      json['data'].forEach((v) {
        data!.add(new DataCategories.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

}

class DataCategories {
  int? id;
  String? name;
  String? image;


  DataCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

}
