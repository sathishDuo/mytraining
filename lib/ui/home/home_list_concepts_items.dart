import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:mytraining/model/concept_data_model.dart';

class HomeListConceptsItems extends StatefulWidget {
  final ConceptDataModel? conceptList;

  HomeListConceptsItems({this.conceptList});

  @override
  _HomeListConceptsStateItems createState() => _HomeListConceptsStateItems();
}

class _HomeListConceptsStateItems extends State<HomeListConceptsItems> {
  var _kHeight;
  var _kWidth;

  @override
  Widget build(BuildContext context) {
    _kHeight = MediaQuery.of(context).size.height;
    _kWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(8),
      color: Colors.white,
      width: _kWidth,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.conceptList!.date,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.conceptList!.time,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    widget.conceptList!.location,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              )),
          Container(
            margin: EdgeInsets.only(left: 8, right: 8, top: 5),
            child: DottedLine(
              direction: Axis.vertical,
              lineLength: 180,
              lineThickness: 1.0,
              dashLength: 4.0,
              dashColor: Colors.grey,
            ),
          ),
          Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.conceptList!.state,
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.conceptList!.titleHeader,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 14,
                        backgroundImage: AssetImage("images/profile.jpeg"),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.conceptList!.title,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.conceptList!.name,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                      alignment: Alignment.centerRight,
                      height: 50,
                      child: MaterialButton(
                        elevation: 0,
                        color: Colors.redAccent,
                        onPressed: () {},
                        child: Text(
                          "Enrol Now",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                ],
              ))
        ],
      ),
    );
  }
}
