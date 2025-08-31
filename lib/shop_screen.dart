import 'package:flutter/material.dart';
import 'package:rest_api/methods/api_get_methods.dart';
import 'package:rest_api/models/shop_model/shop_model.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SHOP API HIT"), centerTitle: true),
      body: FutureBuilder<ShopModel>(
        future: getShopAPI(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (!snapshot.hasData) {
            return const Center(child: Text("No posts found"));
          } else {
            final shopItems = snapshot.data!.data!;
            return ListView.builder(
              itemCount: shopItems.length,
              itemBuilder: (context, index) {
                final shopItem = shopItems[index];
                return Column(
                  children: [
                    Text(shopItem.title!),
                    SizedBox(
                      width: double.infinity,
                      height: 125,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: shopItem.images!.length,
                        itemBuilder: (context, position) {
                          return SizedBox(
                            height: 200,
                            width: 200,
                            child: Image(
                              image: NetworkImage(
                                shopItem.images![position].url!,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 50),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
