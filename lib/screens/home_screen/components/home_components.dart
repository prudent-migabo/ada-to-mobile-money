import 'package:crypto_mob_app/repositories/repositories.dart';
import 'package:crypto_mob_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:crypto_mob_app/screens/home_screen/components/components.dart';
import 'package:crypto_mob_app/utils/utils.dart';
import 'package:provider/provider.dart';

class HomeComponents extends StatefulWidget {
  const HomeComponents({Key? key}) : super(key: key);

  @override
  State<HomeComponents> createState() => _HomeComponentsState();
}

class _HomeComponentsState extends State<HomeComponents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Stack(
        children: [
          CustomScrollView(
            slivers: <Widget>[
              Header(),
              SliverToBoxAdapter(
                child: SizedBox(height: 20,),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                sliver: SliverToBoxAdapter(
                  child: Text("Today's News", style: bold.copyWith(color: kMainColor, fontSize: 25),),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 20,),
              ),
              NewsTile(),
              SliverToBoxAdapter(
                child: SizedBox(height: 30,),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                sliver: SliverToBoxAdapter(
                  child: Text('Trending', style: bold.copyWith(color: kMainColor, fontSize: 25),),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 20,),
              ),
              TradingTile(),
            ],
          ),
          ExchangePositionned(),
        ],
      ),

    );
  }
}

