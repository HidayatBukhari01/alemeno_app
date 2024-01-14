class LabTestModel {
  final String id;
  final String name;
  final String description;
  final String reportTime;
  final int price;
  final int oldPrice;

  LabTestModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.reportTime,
      required this.price,
      required this.oldPrice});

  factory LabTestModel.fromJson(Map<String, dynamic> json) {
    return LabTestModel(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      reportTime: json['reportTime'],
      price: json['price'],
      oldPrice: json['oldPrice'],
    );
  }
}
