import 'package:flutter/material.dart';
import 'package:ticket_shop/utils/theme_utils.dart';

GestureDetector buildTSCard(String name, AssetImage assetImage, Function onPressed, {height: 200}) {
  return GestureDetector(
    onTap: onPressed(),
    child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            Container(
              height: height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: assetImage,
                      fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(blurRadius: 2, color: Colors.grey)]
              ),
            ),
            Center(
              child: Text(
                  name,
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Abeganshi',
                      color: Colors.white
                  )
              ),
            )
          ],
        )
    ),
  );
}