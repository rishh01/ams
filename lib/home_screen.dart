import 'package:flutter/material.dart';
import 'package:presencepro/colour.dart';
import 'package:presencepro/reusable_text.dart';
import 'package:presencepro/size_config.dart';
import 'font_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: HeaderClipper(),
            child: Container(
              color: Colors.deepPurple.shade300,
              height: 27*h,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(4*w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5*h),
                ReusableText(
                  text: 'Dashboard',
                  style: fontStyle(24, AppConst.white, FontWeight.w600),
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5 * w,
                    mainAxisSpacing: 5 * w,
                    children: [
                      buildContainer(context, 'Generate QR', AppConst.appTheme, Icons.qr_code_2),
                      buildContainer(context, 'Attendance', AppConst.appTheme, Icons.mark_chat_read),
                      buildContainer(context, 'Report', AppConst.appTheme, Icons.bar_chart_outlined),
                      buildContainer(context, 'Events', AppConst.appTheme, Icons.event_available_outlined),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildContainer(BuildContext context, String text, Color color, IconData iconData) {
  return Container(
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: AppConst.grey,
          blurRadius: 7,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 38,
          color: Colors.black,
        ),
        SizedBox(height: 1*h),
        ReusableText(
          text: text,
          style: fontStyle(16, AppConst.fontGrey, FontWeight.w300),
        ),
      ],
    ),
  );
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);
    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2, size.height - 50);
    var secondControlPoint = Offset(size.width * 3 / 4, size.height - 100);
    var secondEndPoint = Offset(size.width, size.height - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
