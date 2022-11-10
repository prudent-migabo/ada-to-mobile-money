import 'package:flutter/material.dart';
import 'package:crypto_mob_app/widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../utils/utils.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({
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
                    height: 150,
                    decoration: containerRounded(),
                    child: Row(
                      children: [
                        ImageOfNews(),
                        NewsContent(),
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

class NewsContent extends StatelessWidget {
  const NewsContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Lorem ipsum', style: TextStyle(color: kMainColor, fontSize: 20),),
            SizedBox(height: 10,),
            Container(
              height: 60,
              child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. A arcu cursus vitae congue mauris rhoncus aenean. At auctor urna nunc id. Faucibus in ornare quam viverra. Nec feugiat in fermentum posuere urna nec tincidunt praesent. Ac orci phasellus egestas tellus rutrum tellus. Consequat interdum varius sit amet mattis vulputate.',
                maxLines: 5, style: TextStyle(fontSize: 10.5, height: 1.5)),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Read more ->', style: TextStyle(color: kMainColor, fontSize: 11),),
                Text('5mins', style: TextStyle(color: Colors.grey[300], fontSize: 12, fontStyle: FontStyle.italic),),
                Icon(FontAwesomeIcons.thumbsUp, color: kMainColor, size: 16,),
                Icon(FontAwesomeIcons.comment, color: kMainColor, size: 16,),

              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ImageOfNews extends StatelessWidget {
  const ImageOfNews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
          image: DecorationImage(
            image: AssetImage(Assets.img),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}