
import 'dart:math';
import 'package:projectdojo/equity/datacutrectangle.dart';
import 'package:flutter/material.dart';
import 'package:projectdojo/equity/body.dart';
import 'package:projectdojo/equity/coverphoto.dart';
import 'package:projectdojo/equity/cutrectangle.dart';
import 'package:projectdojo/equity/buttonback.dart';
import 'backgroundsliver.dart';

class HomeSliverChallenge extends StatefulWidget {
  const HomeSliverChallenge({Key key}) : super(key: key);

  @override
  _HomeSliverChallengeState createState() => _HomeSliverChallengeState();
}

class _HomeSliverChallengeState extends State<HomeSliverChallenge> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
                delegate: _AppBarNetflix(
                    minExtended: kToolbarHeight,
                    maxExtended: size.height * 0.35,
                    size: size)),
            SliverToBoxAdapter(
              child: Body(size: size),
            )
          ],
        ),
      ),
    );
  }
}

class _AppBarNetflix extends SliverPersistentHeaderDelegate {
  const _AppBarNetflix({this.maxExtended, this.minExtended, this.size});
  final double maxExtended;
  final double minExtended;
  final Size size;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final percent = shrinkOffset / maxExtended;
    //validates angle at which the card returns
    final uploadlimit = 13 / 100;
    //returns the value of the card
    final valueback = (1 - percent - 0.77).clamp(0, uploadlimit);
    final fixrotation = pow(percent, 1.5);
    final card = _CoverCard(
        size: size,
        percent: percent,
        uploadlimit: uploadlimit,
        valueback: valueback);

    final bottomsliverbar = _CustomBottomSliverBar(
        size: size, fixrotation: fixrotation, percent: percent);
    return Container(
      child: Stack(
        children: [
          BackgroundSliver(),
          if (percent > uploadlimit) ...[
            card,
            bottomsliverbar
          ] else ...[
            bottomsliverbar,
            card
          ],
          ButtonBack(size: size,percent: percent)
        ],
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => maxExtended;

  @override
  // TODO: implement minExtent
  double get minExtent => minExtended;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

class _CoverCard extends StatelessWidget {
  final Size size;
  final double percent;
  final double uploadlimit;
  final num valueback;
  final double angleForCard = 6.5;
  const _CoverCard(
      {Key key, this.size, this.percent, this.uploadlimit, this.valueback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: size.height * 0.15,
      left: size.width / 24,
      child: Transform(
        alignment: Alignment.topRight,
        transform: Matrix4.identity()
          ..rotateZ(percent > uploadlimit
              ? (valueback * angleForCard)
              : percent * angleForCard),
        child: CoverPhoto(size: size),
      ),
    );
  }
}

class _CustomBottomSliverBar extends StatelessWidget {
  final Size size;
  final num fixrotation;
  final double percent;
  const _CustomBottomSliverBar(
      {Key key, this.size, this.fixrotation, this.percent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
     
    return Positioned(
      bottom: 0,
      left: -size.width * fixrotation.clamp(0, 0.35),
      right: 0,
      child: 
       _CustomBottomSliver(size: size,percent: percent, ), );
  }
}

class _CustomBottomSliver extends StatelessWidget {
  const _CustomBottomSliver({
    Key key,
    @required this.size, this.percent,
    
  }) : super(key: key);

  final Size size;
 
  final double percent;

  @override
  Widget build(BuildContext context) {
    final Color color =Theme.of(context).scaffoldBackgroundColor;
    return Container(
       height: size.height * 0.12,
      child: Stack(
       fit: StackFit.expand,
       children: [
         CustomPaint(
           painter: CutRectangle(color),
         ),
         DataCutRectangle(size: size,percent: percent,)
      // _CustomBottomSliver(size: size,percent: percent,),
       ] ),
    );
  }
}

 
