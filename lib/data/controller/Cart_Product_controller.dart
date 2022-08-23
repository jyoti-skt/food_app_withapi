

import 'package:demo_vehiclebook_app/data/repositry/Cart_product_repositry.dart';
import 'package:demo_vehiclebook_app/models/cart_model.dart';
import 'package:demo_vehiclebook_app/models/products_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;
  //0.1.2...

  void addItem(ProductModel product,int quantity){
     var totalquantity =0;
    if(_items.containsKey(product.id!)){
      _items.update(product.id!, (value) {
        totalquantity = value.quantity!+quantity;
        return CartModel(
          id:value.id,
          name:value.name,
          price:value.price,
          img:value.img,
          quantity:value.quantity!+quantity,
          isExist:true,
          time:DateTime.now().toString(),
          product: product
        );
      });
      if(totalquantity <=0){
        _items.remove(product.id);
      }

    }
    else{

     if(quantity>0){
       _items.putIfAbsent(product.id!, (){
         // print('adding item to the cart ' + product.id!.toString() +"quantity of " +quantity.toString());
         // _items.forEach((key, value) {
         //   print("quantity is " +value.quantity.toString());
         // });
         return CartModel(
           id:product.id,
           name:product.name,
           price:product.price,
           img:product.img,
           quantity:quantity,
           isExist:true,
           time:DateTime.now().toString(),
           product: product,
         );
       }
       );
     } else{
       Get.snackbar("Item count", "you should atlteast add the item in your Cart",
       );
     }
    }
    update();










  }

  bool existInCart(ProductModel product){
    if(_items.containsKey(product.id)){
      return true;
    }return false;
  }

  int getQuantity(ProductModel product){
    var quantity= 0;
    if(_items.containsKey(product.id)){
      _items.forEach((key, value) {
        if(key == product.id){
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems{
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

  int get totalAmount{
    var total = 0;

    _items.forEach((key, value) {
    total += value.quantity!*value.price!;

    });
    return total;
  }

  List<CartModel> get getItems{
   return _items.entries.map((e) {
     return e.value;
    }).toList();
  }


}