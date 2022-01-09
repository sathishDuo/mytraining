import 'package:flutter/material.dart';
import 'package:mytraining/helper/getcolor.dart';
import 'package:mytraining/helper/mycolors.dart';
import 'package:mytraining/model/sort_data_model.dart';

class HomeFilter extends StatefulWidget {
  @override
  _HomeFilterState createState() => _HomeFilterState();
}

class _HomeFilterState extends State<HomeFilter> {
  int isSelected = 0;
  List<SortDataModel> _ksortBy = [];

  _isSelected(int index) {
    setState(() {
      isSelected = index;
    });
    if (index == 0) {
      _ksortBy = sortbyLocation;
    } else if (index == 1) {
      _ksortBy = sortbyTrainingName;
    } else if (index == 2) {
      _ksortBy = sortbyTrainer;
    }
  }

  @override
  void initState() {
    _ksortBy = sortbyLocation;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 16),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Sort and Filters",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close))
              ],
            ),
          ),
          Container(
            color: Colors.grey,
            height: 1,
          ),
          Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    height: 50,
                    color: Colors.grey[200],
                    child: Center(
                      child: Text(
                        "Sort by",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                    ),
                  )),
              Expanded(
                  flex: 3,
                  child: Container(
                    margin: EdgeInsets.only(left: 8, right: 8, top: 8),
                    height: 50,
                    color: Colors.white,
                    child: Center(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  )),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: sortbyList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              _isSelected(index);
                            },
                            child: Container(
                              color: isSelected ==
                                      index //set condition like this. voila! if isSelected and list index matches it will colored as white else orange.
                                  ? Colors.white
                                  : Colors.grey[200],
                              height: 50,
                              child: Row(
                                children: [
                                  Container(
                                    color: isSelected == index
                                        ? Colors.redAccent
                                        : Colors.grey[200],
                                    width: 5,
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Text(sortbyList[index].sortbyName,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600))
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  flex: 2),
              Expanded(
                  child: Container(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _ksortBy.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 50,
                            //child: Text(_ksortBy[index].sortbyName),
                            child: CheckboxListTile(
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                activeColor: Colors.redAccent,
                                title: Text(_ksortBy[index].sortbyName,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight:
                                            _ksortBy[index].isCheck == true
                                                ? FontWeight.w600
                                                : FontWeight.w500)),
                                value: _ksortBy[index].isCheck,
                                onChanged: (value) {
                                  setState(() {
                                    _ksortBy[index].isCheck = value;
                                  });
                                }),
                          );
                        }),
                  ),
                  flex: 3),
            ],
          )
        ],
      ),
    );
  }
}
