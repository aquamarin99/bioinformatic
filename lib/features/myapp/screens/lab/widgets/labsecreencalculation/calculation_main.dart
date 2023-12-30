import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/features/myapp/screens/lab/widgets/labsecreencalculation/buildwidgets/calculation_buffer_comname_iconbutton.dart';
import 'package:t_store/features/myapp/screens/lab/widgets/labsecreencalculation/buildwidgets/calculation_buffer_textformfield_dropdown.dart';
import 'package:t_store/features/myapp/screens/lab/widgets/labsecreencalculation/buildwidgets/calculation_datatable_buttons.dart';
import 'package:t_store/features/myapp/screens/lab/widgets/labsecreencalculation/buildwidgets/calculation_buffer_maintitle.dart';
import 'package:t_store/utils/constants/calculation_constants.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class BufferCalculation extends StatefulWidget {
  const BufferCalculation({super.key});

  @override
  State<BufferCalculation> createState() => _BufferCalculationState();
}

final width = THelperFunctions.screenWidth();

class _BufferCalculationState extends State<BufferCalculation> {
  /// ----------Controllers-----------\\\
  // Powder için kullanılacak controller'lar
  final TextEditingController _powderNameController = TextEditingController();
  final TextEditingController _powderMwController = TextEditingController();
  final TextEditingController _powderFcController = TextEditingController();

  // Solution için kullanılacak controller'lar
  final TextEditingController _solutionNameController = TextEditingController();
  final TextEditingController _solutionScController = TextEditingController();
  final TextEditingController _solutionFcController = TextEditingController();

  // Buffer Name & Final Volume Controller
  final TextEditingController _finalVolumeController = TextEditingController();
  final TextEditingController _bufferNameController = TextEditingController();

  ///------------Lists------------\\\
  final List<String> concentrationUnits = ['M', 'mM', 'µM', 'nM'];

  List<CompoundAsPowder> powderCompoundList = [];
  //------- Tabloya veri eklenmesi
  List<CompoundAsSolution> solutionCompoundList = [];
  List<CompoundBase> combinedList = [];

  ///--------Units Parameters-------\\\
  //---Birinci kontainer Seçilen birim değişkenleri
  String selectedInputUnit1 = 'g/mol';
  String selectedInputUnit2 = 'mM';
  //---İkinci kontainer Seçilen birim değişkenleri
  String selectedInputUnit3 = 'mM';
  String selectedInputUnit4 = 'mM';

  /// ---------------------------Functions----------------------------\\\
  /// Test

  // Tablonun ve Listelerin Sıfırlanma işlemi
  void onPressedRemove() {
    // Sıfırlama işlemi
    setState(() {
      powderCompoundList.clear();
      solutionCompoundList.clear();
      _powderNameController.clear();
      _powderMwController.clear();
      _powderFcController.clear();
      _solutionFcController.clear();
      _solutionScController.clear();
      _solutionNameController.clear();
    });
  }

// Calculation Function
  void onPressedCalculate() {
    // Sıfırlama işlemi
    setState(() {});
  }

  // Powder'ı listeye ekler
  void _addToPowderList(String selectedInputUnit, String forTableConFormat1,
      String forTableConFormat2) {
    String tableFormat1 = forTableConFormat1;
    String tableFormat2 = forTableConFormat2;
    String powderName = _powderNameController.text;
    double powderMw = double.parse(_powderMwController.text);
    double powderConcentration = calculateConcentration(
        selectedInputUnit, double.parse(_powderFcController.text));
    //double.parse(_powderFcController.text);

    CompoundAsPowder powder = CompoundAsPowder(
      name: powderName,
      scOrmw: powderMw,
      concentration: powderConcentration,
      tableFormat1: tableFormat1,
      tableFormat2: tableFormat2,
    );

    setState(() {
      powderCompoundList.add(powder);
      _powderNameController.clear();
      _powderMwController.clear();
      _powderFcController.clear();
    });
  }

  // Solution'ı listeye ekler
  void _addToSolutionList(String selectedInputUnit1, String selectedInputUnit2,
      String forTableConFormat1, String forTableConFormat2) {
    String tableFormat1 = forTableConFormat1;
    String tableFormat2 = forTableConFormat2;
    String solutionName = _solutionNameController.text;
    double solutionSc = calculateConcentration(
        selectedInputUnit1, double.parse(_solutionScController.text));
    double solutionFc = calculateConcentration(
        selectedInputUnit2, double.parse(_solutionFcController.text));

    CompoundAsSolution solution = CompoundAsSolution(
      name: solutionName,
      scOrmw: solutionSc,
      concentration: solutionFc,
      tableFormat1: tableFormat1,
      tableFormat2: tableFormat2,
    );

    setState(() {
      solutionCompoundList.add(solution);
      _solutionNameController.clear();
      _solutionScController.clear();
      _solutionFcController.clear();
    });
  }

  //Sized for PC
  final double maxWidth = 600;

  @override
  Widget build(BuildContext context) {
    // combinedList'i her widget yeniden çizildiğinde güncelle
    combinedList = [
      ...powderCompoundList.map((e) => CompoundBase.powder(
          name: e.name,
          concentration: e.concentration,
          tableFormat1: e.tableFormat1,
          tableFormat2: e.tableFormat2)),
      ...solutionCompoundList.map((e) => CompoundBase.solution(
            name: e.name,
            concentration: e.concentration,
            tableFormat1: e.tableFormat1,
            tableFormat2: e.tableFormat2,
          ))
    ];

    return Column(
      children: [
        ///- Main Title
        CreateBufferTitle(
          title: 'Create Buffer',
          style: Theme.of(context).textTheme.titleSmall!,
        ),
        const SizedBox(
          height: TSizes.sm,
        ),
        const Divider(
          thickness: 4,
        ),
        TRoundedContainer(
          padding: const EdgeInsets.only(top: TSizes.iconXs),
          showBorder: true,
          borderColor: Colors.green,
          backgroundColor: null,
          child: Column(
            children: [
              ///---First Container Widgets---

              ///--Compound Name & IconBotton
              CreateBufferComNameIconButton(
                compoundNameController: _powderNameController,
                labelText: 'Compound Name',
                onPressed: () {
                  String enteredComNameValue = _powderNameController.text;
                  String enteredComMwValue = _powderMwController.text;
                  String enteredComFcValue = _powderFcController.text;

                  // Check if all three fields are filled
                  if (enteredComNameValue.isNotEmpty &&
                      enteredComMwValue.isNotEmpty &&
                      enteredComFcValue.isNotEmpty) {
                    setState(() {
                      _addToPowderList(
                          selectedInputUnit2,
                          '$enteredComMwValue $selectedInputUnit1',
                          '$enteredComFcValue $selectedInputUnit2');
                    });
                  } else {
                    // Show a toast message if any of the fields is empty
                    Fluttertoast.showToast(
                      msg: 'Please fill all the fields',
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  }
                },
              ),
              const SizedBox(
                height: TSizes.iconXs,
              ),

              ///-- Molecular Weight & DropDownButton
              CreateBufferTextFormFieldDropdown(
                controller: _powderMwController,
                unitValues: const [
                  'g/mol',
                ],
                labelText: 'Molecular Weight',
                initialSelectedValue: 'g/mol',
                onSelectionChanged: (selectedValue) {
                  setState(() {
                    // Seçilen birimi güncelle
                    selectedInputUnit1 = selectedValue;
                  });
                },
              ),
              const SizedBox(
                height: TSizes.iconXs,
              ),

              ///--Final Concentration & DropDownButton,
              CreateBufferTextFormFieldDropdown(
                controller: _powderFcController,
                unitValues: concentrationUnits,
                labelText: 'Final Concentration',
                initialSelectedValue: 'mM',
                onSelectionChanged: (selectedValue) {
                  setState(() {
                    // Seçilen birimi güncelle
                    selectedInputUnit2 = selectedValue;

                    // Diğer birimler için gerekli işlemleri ekleyebilirsiniz.
                  });
                },
              ),

              const SizedBox(
                height: TSizes.iconXs,
              ),
            ],
          ),
        ),

        const SizedBox(
          height: TSizes.iconXs,
        ),

        ///---Second Container Widgets---
        TRoundedContainer(
          padding: const EdgeInsets.only(top: TSizes.spaceBtwItems),
          showBorder: true,
          borderColor: Colors.green,
          backgroundColor: null,
          child: Column(
            children: [
              CreateBufferComNameIconButton(
                compoundNameController: _solutionNameController,
                labelText: 'Stock Solution Name',
                onPressed: () {
                  String enteredComNameValue = _solutionNameController.text;
                  String enteredComScValue = _solutionScController.text;
                  String enteredComFcValue = _solutionFcController.text;

                  // Check if all three fields are filled
                  if (enteredComNameValue.isNotEmpty &&
                      enteredComScValue.isNotEmpty &&
                      enteredComFcValue.isNotEmpty) {
                    setState(() {
                      _addToSolutionList(
                          selectedInputUnit3,
                          selectedInputUnit4,
                          '$enteredComScValue $selectedInputUnit3',
                          '$enteredComFcValue $selectedInputUnit4');
                    });
                  } else {
                    // Show a toast message if any of the fields is empty
                    Fluttertoast.showToast(
                      msg: 'Please fill all the fields',
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  }
                },
              ),
              const SizedBox(
                height: TSizes.iconXs,
              ),

              ///-- Stock Concentration & DropDownButton
              CreateBufferTextFormFieldDropdown(
                controller: _solutionScController,
                unitValues: concentrationUnits,
                labelText: 'Stock Concentration',
                initialSelectedValue: 'mM',
                onSelectionChanged: (selectedValue) {
                  setState(() {
                    // Seçilen birimi güncelle
                    selectedInputUnit3 = selectedValue;
                  });
                },
              ),
              const SizedBox(
                height: TSizes.iconXs,
              ),
              CreateBufferTextFormFieldDropdown(
                controller: _solutionFcController,
                unitValues: concentrationUnits,
                labelText: 'Final Concentration',
                initialSelectedValue: 'mM',
                onSelectionChanged: (selectedValue) {
                  setState(() {
                    // Seçilen birimi güncelle
                    selectedInputUnit4 = selectedValue;
                  });
                },
              ),

              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 4,
        ),
        const SizedBox(
          height: TSizes.sm,
        ),
        TRoundedContainer(
          padding: const EdgeInsets.only(top: TSizes.spaceBtwItems),
          showBorder: true,
          borderColor: Colors.green,
          backgroundColor: null,
          child: Column(
            children: [
              SizedBox(
                width: (width * 9 / 10) - 30,
                child: Align(
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: _buildDataTable(),
                  ),
                ),
              ),
              const SizedBox(
                height: TSizes.sm,
              ),
              CreateBufferTextFormFieldDropdown(
                controller: _finalVolumeController,
                unitValues: concentrationUnits,
                labelText: 'Final Volume of the Buffer',
                initialSelectedValue: 'mM',
                onSelectionChanged: (String) {},
              ),
              const SizedBox(
                height: TSizes.sm,
              ),
              CreateBufferTextFormFieldDropdown(
                controller: _bufferNameController,
                dropDownButton: false,
                unitValues: concentrationUnits,
                labelText: 'Buffer Name',
                initialSelectedValue: 'mM',
                onSelectionChanged: (String) {},
              ),
              const SizedBox(
                height: TSizes.sm,
              ),

              ///-- Calculation Buttons--
              CalculationDataTableButton(
                fontSize: 14,
                onPressedRemove: onPressedRemove,
                onPressedCalculate: () {},
              ),
              SizedBox(
                width: 550,
                height: 1000,
                child: Column(
                  children: [
                    Text(
                        'Powder List: ${powderCompoundList.map((e) => e.displayInfo()).toList()}',
                        style: TextStyle(color: Colors.purple)),
                    Text(
                        'Solution List: ${solutionCompoundList.map((e) => e.displayInfo()).toList()}',
                        style: TextStyle(color: Colors.green)),
                    Text(
                        'CompoundBase List: ${combinedList.map((e) => e.displayInfo()).toList()}',
                        style: TextStyle(color: Colors.red)),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDataTable() {
    final dark = THelperFunctions.isDarkMode(context);
    return DataTable(
      columnSpacing: 40,
      headingRowHeight: 36,
      columns: [
        _dataColumn(dark, 'C. Name'),
        _dataColumn(dark, 'Mw/Stock Conc.'),
        _dataColumn(dark, 'Final Conc.'),
        _dataColumn(dark, 'Remove'),
      ],
      rows: combinedList.asMap().entries.map((entry) {
        final int i = entry.key;
        final CompoundBase compound = entry.value;

        return DataRow(
          cells: [
            _dataCell(dark, compound.name),
            _dataCell(dark, compound.tableFormat1),
            _dataCell(dark, compound.tableFormat2),
            DataCell(
              IconButton(
                icon: const Icon(Icons.delete, color: TColors.darkGrey),
                onPressed: () {
                  setState(() {
                    // Remove the data from the combined list
                    combinedList.removeAt(i);

                    // Aynı öğeyi powderCompoundList'ten de sil
                    if (i < powderCompoundList.length) {
                      powderCompoundList.removeAt(i);
                    }

                    // Aynı öğeyi solutionCompoundList'ten de sil
                    else {
                      int adjustedIndex = i - powderCompoundList.length;
                      if (adjustedIndex < solutionCompoundList.length) {
                        solutionCompoundList.removeAt(adjustedIndex);
                      }
                    }
                  });
                },
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

  DataCell _dataCell(bool dark, String name) {
    return DataCell(
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          name,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: dark ? TColors.grey : TColors.darkerGrey),
        ),
      ),
    );
  }

  DataColumn _dataColumn(bool dark, String title) {
    return DataColumn(
      label: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleSmall!
            .apply(color: dark ? TColors.white : TColors.black),
      ),
    );
  }
}
