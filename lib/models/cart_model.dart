import 'package:demo_vehiclebook_app/models/products_model.dart';

class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  bool? isExist;
  String? time;
  ProductModel? product;


  CartModel(
      {this.id,
        this.name,
        //this.description,
        this.price,
        //this.stars,
         this.img,
        this.quantity,
        this.isExist,
        this.time,
        this.product,
        // this.location,
        // this.createdAt,
        // this.updatedAt,
        // this.typeId
      });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
   // description = json['description'];
    price = json['price'];
   // stars = json['stars'];
    img = json['img'];
    quantity = json['quantity'];
    time =  json['time'];
    isExist = json['isExist'];
    product = ProductModel.fromJson(json['product']);

    // location = json['location'];
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
    // typeId = json['type_id'];
  }

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['id'] = this.id;
//   data['name'] = this.name;
//   data['description'] = this.description;
//   data['price'] = this.price;
//   data['stars'] = this.stars;
//   data['img'] = this.img;
//   data['location'] = this.location;
//   data['created_at'] = this.createdAt;
//   data['updated_at'] = this.updatedAt;
//   data['type_id'] = this.typeId;
//   return data;
// }
}