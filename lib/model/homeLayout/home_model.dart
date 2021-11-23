// class HomeModel{
//   late bool status;
//   late DataModel data;
//
//   HomeModel.fromJson(Map<String,dynamic> json){
//     status = json['status'];
//     data = DataModel.fromJson(json['data']) ;
//   }
// }
// class DataModel {
//
//    List<BannersModel> banners = [];
//    List<ProductsModel> products = [];
//
//    DataModel.fromJson(Map<String , dynamic> json){
//
//     json['banners'].forEach((element)
//     {
//       banners.add(element);
//     });
//     json['products'].forEach((element){
//       products.add(element);
//     });
//   }
// }
//
//
// class BannersModel
// {
//   late int id ;
//   late String image;
//
//   BannersModel.fromJson(Map<String ,dynamic> json)
//   {
//     id = json['id'];
//     image = json['image'];
//   }
// }
//
// class ProductsModel
// {
//   late int id;
//   late dynamic price;
//   late dynamic old_price;
//   late dynamic discount;
//   late String image;
//   late String name;
//   late bool in_favorites;
//   late bool in_cart;
//
//   ProductsModel.fromJson(Map<String , dynamic> json)
//   {
//     id = json['id'];
//     price = json['price'];
//     old_price = json['old_price'];
//     discount = json['discount'];
//     image = json['image'];
//     name = json['name'];
//     in_favorites = json['in_favorites'];
//     in_cart = json['in_cart'];
//   }
// }
class HomeModel {
  late bool status;
  late Null message;
  late Data data;

  HomeModel.fromJson(Map<String, dynamic> json)
  {
    status = json['status'];
    message = json['message'];
    data = (json['data'] != null ? new Data.fromJson(json['data']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  late List<Banners> banners;
  late List<Products> products;
  late String ad;

  Data.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = <Banners>[];
      json['banners'].forEach((v) {
        banners.add(new Banners.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
    ad = json['ad'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.banners != null) {
      data['banners'] = this.banners.map((v) => v.toJson()).toList();
    }
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    data['ad'] = this.ad;
    return data;
  }
}

class Banners {
    late  int id;
    late  String image;
    late  Null category;
    late Null product;


  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    category = json['category'];
    product = json['product'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['category'] = this.category;
    data['product'] = this.product;
    return data;
  }
}

class Products {
  late int id;
  late int price;
  late int oldPrice;
  late int discount;
  late String image;
  late String name;
  late String description;
  late List<String> images;
  late bool inFavorites;
  late bool inCart;


  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    images = json['images'].cast<String>();
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['old_price'] = this.oldPrice;
    data['discount'] = this.discount;
    data['image'] = this.image;
    data['name'] = this.name;
    data['description'] = this.description;
    data['images'] = this.images;
    data['in_favorites'] = this.inFavorites;
    data['in_cart'] = this.inCart;
    return data;
  }
}
