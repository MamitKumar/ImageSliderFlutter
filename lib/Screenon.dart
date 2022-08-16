import 'package:flutter/material.dart';
import 'Detail.dart';
import 'dart:math';

void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

var CARatio = 12.0 / 16.0;
var widgetAspectRatio = CARatio * 1.2;

class _MyAppState extends State<MyApp> {
  var currentPage = images.length - 1.0;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page!;
      });
    });

    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
            Color(0xFF1b1e44),
            Color(0xFF2d3447),
          ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              tileMode: TileMode.clamp)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 12.0, right: 12.0, top: 30.0, bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 15, left: 17, right: 22, bottom: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Mr's.Oana Group",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    const Icon(
                      Icons.add_link,
                      size: 30,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 17, top: 5),
                    child: Wrap(
                      spacing: 14,
                      runSpacing: 1,
                      children: const [
                        Chip(
                          label: Text("Tranding"),
                          shadowColor: Colors.red,
                          backgroundColor: Colors.cyanAccent,
                        ),
                        Chip(
                          label: Text("Like"),
                          shadowColor: Colors.amber,
                          backgroundColor: Colors.amberAccent,
                        ),
                        Chip(
                          label: Text("2k+ Connection"),
                          backgroundColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Stack(
                children: <Widget>[
                  CardScrollWidget(currentPage),
                  Positioned.fill(
                    child: PageView.builder(
                      itemCount: images.length,
                      controller: controller,
                      reverse: true,
                      itemBuilder: (context, index) {
                        return Container();
                      },
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 17, right: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Flutter Mafia",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    const Icon(
                      Icons.add_link,
                      size: 30,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 17, top: 5),
                    child: Wrap(
                      spacing: 14,
                      runSpacing: 1,
                      children: [
                        const Chip(
                          label: Text("Mafia Group"),
                          shadowColor: Colors.red,
                          backgroundColor: Colors.cyanAccent,
                        ),
                        const Chip(
                          label: const Text("Aniket"),
                          shadowColor: Colors.pink,
                          backgroundColor: Colors.amberAccent,
                        ),
                        const Chip(
                          label: Text("2500 Ui "),
                          backgroundColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;

  CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * CARatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = [];

        for (var i = 0; i < images.length; i++) {
          var delta = i - currentPage;
          bool isOnRight = delta > 0;

          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isOnRight ? 15 : 1),
                  0.0);

          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                  const BoxShadow(
                      color: Colors.black12,
                      offset: const Offset(3.0, 6.0),
                      blurRadius: 10.0)
                ]),
                child: AspectRatio(
                  aspectRatio: CARatio,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(images[i], fit: BoxFit.cover),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Text(title[i],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.0,
                                      fontFamily: "SF-Pro-Text-Regular")),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 12.0, bottom: 12.0),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 22.0, vertical: 6.0),
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: const Text("Read Later",
                                    style: const TextStyle(color: Colors.white)),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}
