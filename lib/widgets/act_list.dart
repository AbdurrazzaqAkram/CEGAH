import 'package:flutter/material.dart';

Widget actItem(String bg, String title, String desc) {
  return Padding(
    padding: const EdgeInsets.only(top: 15.0, right: 8.0, left: 8.0),
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(bg),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Color(0x60212121), BlendMode.darken)
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 35.0,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              desc,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}