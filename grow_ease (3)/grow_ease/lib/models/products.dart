import 'package:uuid/uuid.dart';

class Products {
  String p_id;         // Unique ID for the product
  String p_name;       // Plant name
  String p_img;        // URL for plant image
  double p_price;      // Price of the plant
  String p_benefits;   // Plant benefits
  String sunlight;     // Sunlight requirements
  String watering;     // Watering frequency
  String soil;         // Ideal soil type
  String tips;         // Additional care tips

  Products(
    this.p_img,
    this.p_name,
    this.p_price,
    this.p_benefits,
    this.sunlight,
    this.watering,
    this.soil,
    this.tips,
  ) : p_id = const Uuid().v4(); // Generate a unique ID for the plant
}