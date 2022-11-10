import 'package:crypto_mob_app/utils/utils.dart';
import 'package:crypto_mob_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TradingTile extends StatelessWidget {
  const TradingTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
            childCount: 3,
                (context, index){
              return Column(
                children: [
                  Container(
                    width: width,
                    height: 100,
                    decoration: containerRounded(),
                    child: Row(
                      children: [
                        ImageOfTrading(),
                        TradingContent(),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                ],
              );
            }),
      ),
    );
  }
}

class TradingContent extends StatelessWidget {
  const TradingContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        padding: EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Lorem ipsum', style: TextStyle(color: kMainColor, fontSize: 20),),
            SizedBox(height: 5,),
            Container(
              height: 30,
              child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. A arcu cursus vitae congue mauris rhoncus aenean. At auctor urna nunc id. Faucibus in ornare quam viverra. Nec feugiat in fermentum posuere urna nec tincidunt praesent. Ac orci phasellus egestas tellus rutrum tellus. Consequat interdum varius sit amet mattis vulputate.',
                maxLines: 5, style: TextStyle(fontSize: 10.5, height: 1.3),),
            ),
            SizedBox(height: 5,),
            Align(
              alignment: Alignment.bottomRight,
                child: Text('Read more ->', style: TextStyle(color: kMainColor, fontSize: 10))),
          ],
        ),
      ),
    );
  }
}



class ImageOfTrading extends StatelessWidget {
  const ImageOfTrading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(Assets.img3),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

