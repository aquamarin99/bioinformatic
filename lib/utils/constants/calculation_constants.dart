import 'package:flutter/material.dart';

class TCalculation {
  static const double miliMolarConversionFactor = 1e-3;
  static const double microMolarConversionFactor = 1e-6;
  static const double nanoMolarConversionFactor = 1e-9;
}

// Powder Compound
class CompoundAsPowder {
  String name;
  double scOrmw;
  double concentration;
  String tableFormat1;
  String tableFormat2;

  CompoundAsPowder({
    required this.name,
    required this.scOrmw,
    required this.concentration,
    required this.tableFormat1,
    required this.tableFormat2,
  });
  String displayInfo() {
    return 'CompoundAsPowder{name: $name, concentration: $concentration, scOrmw: $scOrmw}';
  }
}

// Stock Solution
class CompoundAsSolution {
  String name;
  double scOrmw;
  double concentration;
  String tableFormat1;
  String tableFormat2;

  CompoundAsSolution(
      {required this.name,
      required this.scOrmw,
      required this.concentration,
      required this.tableFormat1,
      required this.tableFormat2});
  String displayInfo() {
    return 'CompoundAsSolution{name: $name, concentration: $concentration, scOrmw: $scOrmw}';
  }
}

// Combined List
class CompoundBase {
  String name;
  double concentration;
  String tableFormat1;
  String tableFormat2;
  // Powder Compound için constructor
  CompoundBase.powder({
    required this.name,
    required this.concentration,
    required this.tableFormat1,
    required this.tableFormat2,
  });

  // Stock Solution için constructor
  CompoundBase.solution({
    required this.name,
    required this.concentration,
    required this.tableFormat1,
    required this.tableFormat2,
  });
  String displayInfo() {
    return 'CompoundBase{name: $name, concentration: $concentration, tableFormat1: $tableFormat1, tableFormat2 $tableFormat2}';
  }
}

// Concentration Converter
double calculateConcentration(
    String selectedInputUnit, double powderConcentration) {
  double powderConcentrationCalculated = powderConcentration;

  switch (selectedInputUnit) {
    case 'M':
      // Herhangi bir ek işlem yapmanıza gerek olmadığı için herhangi bir şey yapmanıza gerek yok.
      break;
    case 'mM':
      powderConcentrationCalculated *= TCalculation.miliMolarConversionFactor;
      break;
    case 'µM':
      powderConcentrationCalculated *= TCalculation.microMolarConversionFactor;
      break;
    case 'nM':
      powderConcentrationCalculated *= TCalculation.nanoMolarConversionFactor;
      break;
  }

  // İhtiyaç duyulursa concentration değerini döndürebilirsiniz.
  return powderConcentrationCalculated;
}
