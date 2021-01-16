import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int price, size, id;
  final Color color;
  Product({
    this.id,
    this.image,
    this.title,
    this.price,
    this.description,
    this.size,
    this.color,
  });
}

List<Product> products = [
  Product(
      id: 1,
      title: "Iphone 11 Pro Max",
      price: 12500000,
      size: 128,
      description:
          ("Chipset: Apple A13 Bionic RAM: 4GB Memori internal: 64GB/256GB/512GB Ukuran HP: 144 x 71.4 x 8.1 mm Berat HP: 188 gram Ukuran layar: Super Retina XDR OLED, 5.8 inci, 1125 x 2436 pixels Kamera depan: 12 MP, f/2.2, 23mm (wide) dan SL 3D,  Kamera belakang: 12 MP, f/1.8, 26mm (wide), 12 MP, f/2.0, 52mm (telephoto), 12 MP, f/2.4, 13mm (ultrawide) Baterai: Non-removable Li-Ion 3046mAh, fast charging 18W"),
      image: "assets/images/bag_1.png",
      color: Color(0xFF3D82AE)),
  Product(
      id: 2,
      title: "Iphone X",
      price: 18500000,
      size: 128,
      description:
          ("Chipset: Apple A13 Bionic RAM: 4GB Memori internal: 64GB/256GB/512GB Ukuran HP: 144 x 71.4 x 8.1 mm Berat HP: 188 gram Ukuran layar: Super Retina XDR OLED, 5.8 inci, 1125 x 2436 pixels Kamera depan: 12 MP, f/2.2, 23mm (wide) dan SL 3D,  Kamera belakang: 12 MP, f/1.8, 26mm (wide), 12 MP, f/2.0, 52mm (telephoto), 12 MP, f/2.4, 13mm (ultrawide) Baterai: Non-removable Li-Ion 3046mAh, fast charging 18W"),
      image: "assets/images/bag_2.png",
      color: Color(0xFFD3A984)),
  Product(
      id: 3,
      title: "Iphone 7 Plus",
      price: 6900000,
      size: 128,
      description:
          ("Chipset: Apple A13 Bionic RAM: 4GB Memori internal: 64GB/256GB/512GB Ukuran HP: 144 x 71.4 x 8.1 mm Berat HP: 188 gram Ukuran layar: Super Retina XDR OLED, 5.8 inci, 1125 x 2436 pixels Kamera depan: 12 MP, f/2.2, 23mm (wide) dan SL 3D,  Kamera belakang: 12 MP, f/1.8, 26mm (wide), 12 MP, f/2.0, 52mm (telephoto), 12 MP, f/2.4, 13mm (ultrawide) Baterai: Non-removable Li-Ion 3046mAh, fast charging 18W"),
      image: "assets/images/bag_3.png",
      color: Color(0xFF989493)),
  Product(
      id: 4,
      title: "Iphone SE",
      price: 8900000,
      size: 128,
      description:
          ("Chipset: Apple A13 Bionic RAM: 4GB Memori internal: 64GB/256GB/512GB Ukuran HP: 144 x 71.4 x 8.1 mm Berat HP: 188 gram Ukuran layar: Super Retina XDR OLED, 5.8 inci, 1125 x 2436 pixels Kamera depan: 12 MP, f/2.2, 23mm (wide) dan SL 3D,  Kamera belakang: 12 MP, f/1.8, 26mm (wide), 12 MP, f/2.0, 52mm (telephoto), 12 MP, f/2.4, 13mm (ultrawide) Baterai: Non-removable Li-Ion 3046mAh, fast charging 18W"),
      image: "assets/images/bag_4.png",
      color: Color(0xFFE6B398)),
  Product(
      id: 5,
      title: "Iphone 6 Plus",
      price: 4900000,
      size: 128,
      description:
          ("Chipset: Apple A13 Bionic RAM: 4GB Memori internal: 64GB/256GB/512GB Ukuran HP: 144 x 71.4 x 8.1 mm Berat HP: 188 gram Ukuran layar: Super Retina XDR OLED, 5.8 inci, 1125 x 2436 pixels Kamera depan: 12 MP, f/2.2, 23mm (wide) dan SL 3D,  Kamera belakang: 12 MP, f/1.8, 26mm (wide), 12 MP, f/2.0, 52mm (telephoto), 12 MP, f/2.4, 13mm (ultrawide) Baterai: Non-removable Li-Ion 3046mAh, fast charging 18W"),
      image: "assets/images/bag_5.png",
      color: Color(0xFFFB7883)),
  Product(
    id: 6,
    title: "Iphone 6",
    price: 3900000,
    size: 128,
    description:
        ("Chipset: Apple A13 Bionic RAM: 4GB Memori internal: 64GB/256GB/512GB Ukuran HP: 144 x 71.4 x 8.1 mm Berat HP: 188 gram Ukuran layar: Super Retina XDR OLED, 5.8 inci, 1125 x 2436 pixels Kamera depan: 12 MP, f/2.2, 23mm (wide) dan SL 3D,  Kamera belakang: 12 MP, f/1.8, 26mm (wide), 12 MP, f/2.0, 52mm (telephoto), 12 MP, f/2.4, 13mm (ultrawide) Baterai: Non-removable Li-Ion 3046mAh, fast charging 18W"),
    image: "assets/images/bag_6.png",
    color: Color(0xFFAEAEAE),
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
