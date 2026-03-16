class CartModel {
  String p_img;
  String id;
  String productName;
  double productAmount;
  String productbenefits;
  int productQty;
 

  CartModel({required this.p_img,required this.id,
   required this.productName, 
   required this.productAmount,
   required this.productbenefits,
    this.productQty=1});
}
