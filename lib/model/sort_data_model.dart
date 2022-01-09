class SortDataModel {
  var sortbyName;
  bool? isCheck;

  SortDataModel({this.sortbyName, this.isCheck});
}

List<SortDataModel> sortbyList = [
  SortDataModel(sortbyName: "Location"),
  SortDataModel(sortbyName: "Training Name"),
  SortDataModel(sortbyName: "Trainer"),
];

List<SortDataModel> sortbyLocation = [
  SortDataModel(sortbyName: "West Des Moines", isCheck: false),
  SortDataModel(sortbyName: "Chicago, IL", isCheck: false),
  SortDataModel(sortbyName: "Phoneix, AZ", isCheck: false),
  SortDataModel(sortbyName: "Dallas, Tx", isCheck: false),
  SortDataModel(sortbyName: "San Diego, CA", isCheck: false),
];

List<SortDataModel> sortbyTrainingName = [
  SortDataModel(sortbyName: "Cloud ",isCheck: false),
  SortDataModel(sortbyName: "Blockchain",isCheck: false),
  SortDataModel(sortbyName: "Chatbots",isCheck: false),
  SortDataModel(sortbyName: "Custom App",isCheck: false),
];

List<SortDataModel> sortbyTrainer = [
  SortDataModel(sortbyName: "Ken",isCheck: false),
  SortDataModel(sortbyName: "Paul",isCheck: false),
  SortDataModel(sortbyName: "Danny",isCheck: false),
  SortDataModel(sortbyName: "Rick",isCheck: false),
];
