import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mytraining/provider/banner_provider.dart';
import 'package:mytraining/provider/concept_proivder.dart';
import 'package:mytraining/ui/home/home_banner.dart';
import 'package:mytraining/ui/home/home_filter.dart';
import 'package:mytraining/ui/home/home_list_concepts_items.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _kHeight;
  var _kWidth;
  //
  List<Color> gradient = [];
  List<double> stops = [];
  PageController? controller;
  int? bannerIndex;

  @override
  void initState() {
    controller = new PageController();
    _setContainerColor();
    _setData();
    super.initState();
  }

  _setData() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      context.read<BannerProvider>().setBannerList();
      context.read<ConceptProvider>().setConceptList();
    });
  }

  _setContainerColor() {
    final Color background = Colors.redAccent;
    final Color fill = Colors.white;
    gradient = [
      background,
      background,
      fill,
      fill,
    ];
    final double fillPercent = 45;
    final double fillStop = (100 - fillPercent) / 100;
    stops = [0.0, fillStop, fillStop, 1.0];
  }

  @override
  Widget build(BuildContext context) {
    _kHeight = MediaQuery.of(context).size.height;
    _kWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Trainings",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600)),
        elevation: 0,
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.menu, color: Colors.white))
        ],
      ),
      body: Container(
        color: Colors.grey[200],
        child: CustomScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          slivers: [
            SliverToBoxAdapter(
                child: Container(
              height: _kHeight / 2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: gradient,
                  stops: stops,
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter,
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      width: _kWidth,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 16, bottom: 16),
                            child: Text("Highlights",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ],
                      ),
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                controller!.previousPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeIn);
                              },
                              icon: Icon(
                                Icons.navigate_before,
                                color: Colors.white,
                                size: 32,
                              )),
                          Expanded(
                            flex: 2,
                            child: Consumer<BannerProvider>(
                                builder: (context, data, int) {
                              var bList = data.getBannerList;

                              return PageView.builder(
                                  physics: AlwaysScrollableScrollPhysics(),
                                  controller: controller,
                                  itemCount: bList.length,
                                  onPageChanged: (index) {
                                    setState(() {
                                      bannerIndex = index;
                                    });
                                  },
                                  itemBuilder: (context, index) {
                                    return HomeBanner(bList: bList[index]);
                                  });
                            }),
                          ),
                          IconButton(
                              onPressed: () {
                                controller!.nextPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeIn);
                              },
                              icon: Icon(
                                Icons.navigate_next,
                                color: Colors.white,
                                size: 32,
                              ))
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                        width: _kWidth,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10, left: 10),
                              height: 36,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4))),
                              child: TextButton.icon(
                                  onPressed: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return HomeFilter();
                                        });
                                  },
                                  icon: Icon(Icons.sort, color: Colors.grey),
                                  label: Text(
                                    "Filter",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  )),
                            ),
                          ],
                        )),
                  ),
                  // HomeListConcepts(),
                ],
              ),
            )),
            Container(
              child: Consumer<ConceptProvider>(builder: (context, data, int) {
                var cList = data.getConceptList;
                return SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                  return HomeListConceptsItems(conceptList: cList[index]);
                }, childCount: cList.length));
              }),
            ),
          ],
        ),
      ),
    );
  }
}
