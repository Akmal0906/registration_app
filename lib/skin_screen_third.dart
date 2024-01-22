import 'package:flutter/material.dart';

class SkinScreenThird extends StatelessWidget {
  const SkinScreenThird({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          ClipPath(
            clipper: CustomClippath(),
            child: Container(
              color: Colors.teal.shade700,
              height: 250,
              width: double.infinity,
            ),
          ),
          const Image(
            image: AssetImage('assets/images/car4.jpg'),
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 10,
          ),
          RichText(
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
              text: const TextSpan(children: [
                TextSpan(
                    text:
                        "Siz bu ilova orqali tez ro'yxatdan o'tishingiz mumkin.Shuningdek uzun navbatda turishlarni unitsangiz bo'ladi.😊",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'fonts_italic'))
              ])),
        ],
      ),
    );
  }
}

class CustomClippath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();
    path.lineTo(0, h);
    path.quadraticBezierTo(w / 4, h - 130, (w / 4) * 2, h - 100);
    path.quadraticBezierTo(w * 0.75, h - 50, w, h - 120);

    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}
