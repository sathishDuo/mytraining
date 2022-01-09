import 'package:flutter/material.dart';
import 'package:mytraining/model/banner_data_model.dart';

class HomeBanner extends StatefulWidget {
  final BannerDataModel? bList;
  HomeBanner({this.bList});

  @override
  _HomeBannerState createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  var _kWidth;
  @override
  Widget build(BuildContext context) {
    _kWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(widget.bList!.bannerImage))),
          width: _kWidth,
        ),
        Container(
          padding: EdgeInsets.all(8),
          color: Colors.black54,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                widget.bList!.title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    widget.bList!.location,
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    widget.bList!.date,
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.bList!.dPrice,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.redAccent),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        widget.bList!.price,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.redAccent),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "View Details",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.arrow_forward, size: 14, color: Colors.white),
                    ],
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
