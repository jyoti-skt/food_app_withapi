import 'package:demo_vehiclebook_app/Utils/colors.dart';
import 'package:demo_vehiclebook_app/data/controller/Cart_Product_controller.dart';
import 'package:demo_vehiclebook_app/data/repositry/popular_product_repositry.dart';
import 'package:get/get.dart';

import '../../models/cart_model.dart';
import '../../models/products_model.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularproductList = [];
  List<dynamic> get popularproductList => _popularproductList;

  bool _isLoaded= false;
  bool  get isLoaded => _isLoaded;

  int _quantity=0;
  int get quantity =>_quantity;
  int _inCartItems=0;
  int get inCartItem => _inCartItems+_quantity;
  late CartController _cart;

  Future<void> getPopularProductList()async {
    Response response = await popularProductRepo.getPopularProductList();
    if(response.statusCode == 200){
      print('print got result');
      _popularproductList=[];
      _popularproductList.addAll(Product.fromJson(response.body).products);
     // print(_popularproductList);
      _isLoaded = true;
      update();
    }else{

    }

  }

  void setQuantity(bool isIncrement) {
    if(isIncrement){
    //  print('increment value' + _quantity.toString());
      _quantity = checkQuantity(_quantity+1);
      print("number of Items "+quantity.toString());

    }else{
     // print('decrement value' + _quantity.toString());
  _quantity = checkQuantity(_quantity-1);
  print("decrement "+_quantity.toString());

    }
    update();

}

int checkQuantity (int quantity){
    if((_inCartItems+quantity) <0){
      Get.snackbar("Item count", "yopu can't reduce more!!",
      );

      return 0;

    } if(_inCartItems >0){
      _quantity =-_inCartItems;
      return _quantity;

    }
    else if((_inCartItems+quantity) >20){
      Get.snackbar("Item count", "yopu can't increase more!!",);
      return  20;

    }else{
      return quantity;
    }
}

void initProduct(ProductModel product,CartController cart){
    _quantity = 0;
    _inCartItems=0;
    _cart = cart;
    var exist = false;
    exist =_cart.existInCart(product);
    // if exist
  //get from storage _inCartItem=3;
  print("exist or not " +exist.toString());
  if(exist){
    _inCartItems =_cart.getQuantity(product);
  }
  print("the quantity in the cart is " + _inCartItems.toString());
}

void addItems(ProductModel product){
    //if(quantity>0){
      _cart.addItem(product, _quantity);

      _quantity= 0;
      _inCartItems = _cart.getQuantity(product);

      _cart.items.forEach((key, value) {
print("the  id is "+value.id.toString() + "quantiyty is "+value.quantity.toString());
      });

      update();
    //}
    // else{
    //   Get.snackbar("Item count", "you should atlteast add the item in your Cart",
    //   );
    //
    // }
  }

  int get totalItems {
    return _cart.totalItems;
}

List<CartModel> get getItems {
    return _cart.getItems;
}


}