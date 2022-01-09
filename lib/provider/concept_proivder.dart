import 'package:flutter/material.dart';
import 'package:mytraining/model/concept_data_model.dart';

class ConceptProvider with ChangeNotifier {
  List<ConceptDataModel> _conceptList = [];
  setConceptList() {
    _conceptList.add(ConceptDataModel(
      titleHeader: "Safe Scrum Master (4.6)",
      title: "Keynote Speaker",
      name: "Helen Gribble",
      titleImage: "",
      location: "Convention Hall, Greater Des Moines",
      date: "Jan 10 - 13, 2022",
      time: "08:30 am - 12:30 pm",
      state: "Filling Fast!",
    ));

    _conceptList.add(ConceptDataModel(
      titleHeader: "Safe Master (4.6)",
      title: "Keynote Speaker",
      name: "Rick",
      titleImage: "",
      location: "Convention Hall, Greater Des Moines",
      date: "Feb 10 - 13, 2022",
      time: "11:30 am - 2:30 pm",
      state: "Early Bird!",
    ));

    _conceptList.add(ConceptDataModel(
      titleHeader: "Scrum Master (4.6)",
      title: "Keynote Speaker",
      name: "Ken Paul",
      titleImage: "",
      location: "Convention Hall, Greater Des Moines",
      date: "Mar 10 - 13, 2022",
      time: "04:30 pm - 07:30 pm",
      state: "Filling Fast!",
    ));

    _conceptList.add(ConceptDataModel(
      titleHeader: "Safe Scrum Master (4.6)",
      title: "Keynote Speaker",
      name: "Gribble Dan",
      titleImage: "",
      location: "Convention Hall, Greater Des Moines",
      date: "Apr 10 - 13, 2022",
      time: "10:30 am - 01:30 pm",
      state: "Early Bird!",
    ));

    _conceptList.add(ConceptDataModel(
      titleHeader: "Safe Scrum Master (4.6)",
      title: "Keynote Speaker",
      name: "Rick Vincent",
      titleImage: "",
      location: "Convention Hall, Greater Des Moines",
      date: "Jun 10 - 13, 2022",
      time: "07:30 am - 10:00 pm",
      state: "Filling Fast!",
    ));
    notifyListeners();
  }

  List<ConceptDataModel> get getConceptList {
    return _conceptList;
  }
}
