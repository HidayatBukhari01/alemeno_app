import 'package:alemeno_app/model/lab_test_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeViewModel with ChangeNotifier {
  List<LabTestModel> labTestsLists = [
    LabTestModel(
        id: "1",
        name: "Thyroid Profile",
        description: "Includes 3 tests",
        reportTime: "24",
        price: 1000,
        oldPrice: 1400),
    LabTestModel(
        id: "2",
        name: "Thyroid Profile 2",
        description: "Includes 4 tests",
        reportTime: "24",
        price: 1000,
        oldPrice: 1400),
    LabTestModel(
        id: "3",
        name: "Iron Study Test",
        description: "Includes 4 tests",
        reportTime: "24",
        price: 600,
        oldPrice: 1000),
    LabTestModel(
        id: "4",
        name: "Iron Study Test 2",
        description: "Includes 4 tests",
        reportTime: "24",
        price: 700,
        oldPrice: 1100),
  ];
  List<LabTestModel> cartItemsList = [];
  double cartTotal = 0;
  double mrpTotal = 0;
  double discount = 0;
  String selectedDate = "";
  String selectedTime = "";
  DateTime focusedDay = DateTime.now();
  bool hardCopy = false;
  void setHardCopy(value) {
    hardCopy = value;
    notifyListeners();
  }

  void addTestToCart(LabTestModel selectedTest) {
    if (cartItemsList.contains(selectedTest)) {
      return;
    }
    cartItemsList.add(selectedTest);
    cartTotal += selectedTest.price;
    discount += (selectedTest.oldPrice - selectedTest.price);
    mrpTotal += selectedTest.oldPrice;
    notifyListeners();
  }

  void removeTestFromCart(LabTestModel selectedTest) {
    cartItemsList.remove(selectedTest);
    cartTotal -= selectedTest.price;
    discount -= (selectedTest.oldPrice - selectedTest.price);
    mrpTotal -= selectedTest.oldPrice;
    notifyListeners();
  }

  void setSelectedDate(DateTime date, DateTime day) {
    selectedDate = DateFormat("dd/MM/yyyy").format(date);
    focusedDay = date;
    notifyListeners();
  }

  void setSelectedTime(String time) {
    if (selectedTime == time) {
      return;
    }
    selectedTime = time;
    notifyListeners();
  }

  void clearDateTime() {
    selectedDate = "";
    selectedTime = "";
    notifyListeners();
  }

  void scheduleTest(BuildContext context) {
    cartItemsList = [];
    cartTotal = 0;
    mrpTotal = 0;
    discount = 0;
    selectedDate = "";
    selectedTime = "";
    notifyListeners();
  }
}
