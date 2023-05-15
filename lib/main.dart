import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // highlightColor: Color(0XFFAFB8AE),
        // splashColor: Color(0XFFAFB8AE),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  Color headerColor = const Color(0XFF2D431C);
  Color bodyColor = const Color(0XFFAFB8AE);
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.menu,
                      color: headerColor,
                      size: 40,
                    ),
                    const Expanded(child: SizedBox()),
                    Icon(
                      Icons.search_rounded,
                      color: headerColor,
                      size: 40,
                    )
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                Text('Find the perfect plant for your home',
                    style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                          color: headerColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    )),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: const Image(
                    image: AssetImage('assets/filter1.png'),
                    height: 50,
                    width: 50,
                  ),
                ),
                TabBar(
                  controller: _tabController,
                  unselectedLabelColor: bodyColor,
                  labelColor: headerColor,
                  overlayColor:
                      MaterialStateProperty.all<Color>(Color(0XFFC3E3B3)),
                  labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                  indicatorColor: Colors.transparent,
                  labelPadding: EdgeInsets.zero,
                  splashBorderRadius: BorderRadius.circular(50),
                  tabs: const [
                    Tab(
                      text: 'Top Picks',
                    ),
                    Tab(
                      text: 'Indoors',
                    ),
                    Tab(
                      text: 'Outdoors',
                    ),
                    Tab(
                      text: 'Sale',
                    )
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      TopPicksView(
                        bodyColor: bodyColor,
                        headerColor: headerColor,
                      ),
                      IndoorView(),
                      OutdoorView(),
                      SaleView(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TopPicksView extends StatelessWidget {
  TopPicksView({Key? key, required this.bodyColor, required this.headerColor})
      : super(key: key);
  Color bodyColor;
  Color headerColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          HousePlant(
              even: false,
              headerColor: headerColor,
              bodyColor: bodyColor,
              image: 'assets/plant1.png',
              amount: '\$24.79',
              title: 'Rubber plant',
              bodyText: 'Easy to care of. Grows well in any environment.'),
          HousePlant(
              even: true,
              headerColor: headerColor,
              bodyColor: bodyColor,
              image: 'assets/plant2.png',
              amount: '\$22.89',
              title: 'Harworthia',
              bodyText:
                  'Perfect for beginners. Grows best in light environment.'),
        ],
      ),
    );
  }
}

class HousePlant extends StatelessWidget {
  const HousePlant({
    super.key,
    required this.headerColor,
    required this.bodyColor,
    required this.amount,
    required this.title,
    required this.bodyText,
    required this.image,
    required this.even,
  });

  final Color headerColor;
  final Color bodyColor;
  final String image;
  final String bodyText;
  final String title;
  final String amount;
  final bool even;

  @override
  Widget build(BuildContext context) {
    return even
        ? Row(
            children: [
              PlantImage(image: image),
              PlantDetails(
                title: title,
                headerColor: headerColor,
                bodyText: bodyText,
                bodyColor: bodyColor,
                price: amount,
              ),
            ],
          )
        : Row(
            children: [
              PlantDetails(
                title: title,
                headerColor: headerColor,
                bodyText: bodyText,
                bodyColor: bodyColor,
                price: amount,
              ),
              PlantImage(image: image),
            ],
          );
  }
}

class PlantImage extends StatelessWidget {
  const PlantImage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Image(
          image: AssetImage(image),
        ),
      ),
    );
  }
}

class PlantDetails extends StatelessWidget {
  const PlantDetails({
    super.key,
    required this.title,
    required this.headerColor,
    required this.bodyText,
    required this.bodyColor,
    required this.price,
  });

  final String title;
  final Color headerColor;
  final String bodyText;
  final Color bodyColor;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.height * .3,
        alignment: Alignment.bottomCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: GoogleFonts.ubuntu(
                textStyle: TextStyle(
                    color: headerColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              bodyText,
              style: TextStyle(color: bodyColor, fontSize: 15, height: 1.5),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  price,
                  style: GoogleFonts.ubuntu(
                    textStyle: TextStyle(
                        color: headerColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                const Icon(Icons.add_circle_outline)
              ],
            )
          ],
        ),
      ),
    );
  }
}

class IndoorView extends StatelessWidget {
  const IndoorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class OutdoorView extends StatelessWidget {
  const OutdoorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SaleView extends StatelessWidget {
  const SaleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class CstmTab extends StatelessWidget {
  CstmTab({
    super.key,
    required this.bodyColor,
    required this.text,
  });

  final Color bodyColor;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color: bodyColor, borderRadius: BorderRadius.circular(50)),
        )
      ],
    );
  }
}
