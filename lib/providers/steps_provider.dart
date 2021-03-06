import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Step with ChangeNotifier {
  String title;
  String name;
  String image;
  List details;
  String breathing;
  List benefits;

  Step({
    required this.title,
    required this.name,
    required this.image,
    required this.details,
    required this.breathing,
    required this.benefits,
  });
}

class Steps with ChangeNotifier {
  List<Step> _steps = [];
  List<dynamic> _fromJson = [];
  int _currentId = 0;
  int _repetition = 1;
  int _cycles = 12;
  int _repCouter = 0;
  int _stepTime = 1;
  bool _isAutoSlide = false;
  bool _displayDetails = false;
  bool _displayBreathing = false;
  bool _displayBenefits = false;

  List<Step> get steps => _steps;
  int get currentId => _currentId;
  int get repetition => _repetition;
  int get stepTime => _stepTime;
  bool get isAutoSlide => _isAutoSlide;
  bool get displayDetails => _displayDetails;
  bool get displayBreathing => _displayBreathing;
  bool get displayBenefits => _displayBenefits;
  // Fetch data from Json fille and create a data object
  Future<void> get fetchData async {
    if (_steps.isEmpty) {
      final respond = await rootBundle.loadString('assets/data/details.json');
      final decoded = json.decode(respond);
      _fromJson = decoded['items'];
      print("Fetching data from JSON file ...");
      createList();
    }
  }

  void createList() {
    print("Create Step list from JSON...");
    for (var element in _fromJson) {
      _steps.add(_createStep(element));
    }
  }

  Step _createStep(dynamic list) {
    Step newStep = Step(
      name: list['name'],
      title: list['title'],
      image: list['image'],
      details: list['details'],
      breathing: list['breathing'],
      benefits: list['benefits'],
    );
    return newStep;
  }

  void incrementId() {
    if (_currentId == (steps.length - 1)) {
      _currentId = 0;
    } else {
      _currentId++;
    }
    initDelayTimer();
    notifyListeners();
  }

  void decrementId() {
    if (_currentId == 0) {
      _currentId = 0;
    } else {
      _currentId--;
    }
    notifyListeners();
  }

  void setCycles() {
    _cycles = _repetition * 2 * steps.length;
  }

  void initDelayTimer() {
    final Timer _delayTimer;
    _delayTimer = Timer(
      Duration(seconds: (_stepTime)),
      () {
        if (_stepTime != 0) {
          if (_isAutoSlide && _currentId < steps.length - 1) {
            incrementId();
          } else {
            toggleAutoSlide(false);
          }
        }
      },
    );
    notifyListeners();
  }

  void toggleAutoSlide(bool status) {
    _isAutoSlide = status;
    if (status) {
      initDelayTimer();
      incrementId();
    }
    notifyListeners();
  }

  void toggleDisplayDetails() {
    _displayDetails = !_displayDetails;
    notifyListeners();
  }

  void toggleDisplayBreathing() {
    _displayBreathing = !_displayBreathing;
    notifyListeners();
  }

  void toggleDisplayBenefits() {
    _displayBenefits = !_displayBenefits;
    notifyListeners();
  }

  Step getStepById() {
    return steps.elementAt(_currentId);
  }

  String getImageById(int id) {
    return steps.elementAt(id).image.toString();
  }
}
