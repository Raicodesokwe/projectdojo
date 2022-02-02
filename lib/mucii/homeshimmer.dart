import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.greenAccent.withOpacity(0.3),
      highlightColor: Colors.greenAccent.withOpacity(0.1),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 5.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 16.0, left: 5),
                  height: size.height * 0.23,
                  width: size.width * 0.5 - 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32.0),
                      color: Colors.greenAccent.withOpacity(0.5)),
                ),
                Container(
                  padding: EdgeInsets.only(top: 16.0, left: 5),
                  height: size.height * 0.23,
                  width: size.width * 0.5 - 20,
                  decoration: BoxDecoration(
                    color: Colors.greenAccent.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 400.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.greenAccent.withOpacity(0.5)),
                ))
          ],
        ),
      ),
    );
  }
}
