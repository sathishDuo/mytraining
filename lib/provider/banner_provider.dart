import 'package:flutter/material.dart';
import 'package:mytraining/model/banner_data_model.dart';

class BannerProvider with ChangeNotifier {
  
  List<BannerDataModel> _bannerList = [];

  setBannerList() {
    _bannerList.add(BannerDataModel(
        title: "Safe Scrum Master",
        location: "West Des Moines, IA",
        bannerImage: "images/banner_1.jpeg",
        price: "900",
        dPrice: "850",
        date: "10 Jan - 11 Jan"));
    _bannerList.add(BannerDataModel(
        title: "Safe Master",
        location: "Iowa City, Iowa",
        bannerImage: "images/banner_2.jpeg",
        price: "1200",
        dPrice: "1100",
        date: "12 Jan - 13 Jan"));

    _bannerList.add(BannerDataModel(
        title: "Scrum Master",
        location: "Cedar Falls, IA",
        bannerImage: "images/banner_3.jpeg",
        price: "700",
        dPrice: "650",
        date: "14 Jan - 15 Jan"));
    notifyListeners();
  }

  List<BannerDataModel> get getBannerList {
    return _bannerList;
  }
}
