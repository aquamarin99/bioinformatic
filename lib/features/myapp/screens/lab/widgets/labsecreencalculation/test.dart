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
  final TextEditingController _compoundNameController1 =
      TextEditingController();
  final TextEditingController _compoundMwController1 = TextEditingController();
  final TextEditingController _compoundFcController1 = TextEditingController();
  final TextEditingController _compoundNameController2 =
      TextEditingController();
  final TextEditingController _compoundScController2 = TextEditingController();
  final TextEditingController _compoundFcController2 = TextEditingController();
  final TextEditingController _volumeController = TextEditingController();
  //final TextEditingController _bufferNameController = TextEditingController();
  // Tabloya veri eklenmesi
  List<Map<String, String>> componentData = [];
  List<double> calculationFcList = [];
  List<double> calculationMwList = [];
  // Tablonun Sıfırlanma işlemi
  void onPressedRemove() {
    // Sıfırlama işlemi
    setState(() {
      componentData.clear();
    });
  }

// Calculation Function
  void onPressedCalculate() {
    // Sıfırlama işlemi
    setState(() {
      componentData.clear();
    });
  }

  //void addValueToList(Double value) {
  //  calculationFcList.add(value);
  //}
  double calculateMw() {
    for (int i = 0; i < calculationFcList.length; i++) {
      // Konsantrasyonu Molar cinsine çevirme
      double convertingToMolar = calculationFcList[i];
      double molecularWeight = double.parse(_compoundMwController1.text);
      // Maddenin miktarını bulma
      double n = convertingToMolar * double.parse(_volumeController.text);

      // Kütle miktarını bulma
      double finalMass = molecularWeight * n;
      print("Final Mass $i: $finalMass");
      // İsterseniz finalMass değerini bir listeye ekleyebilirsiniz.
    }
    return 0.0; // veya başka bir değer döndürebilirsiniz, bu duruma özel olarak düzenleyebilirsiniz.
  }

  //Sized for PC
  final double maxWidth = 600;
  //---Birinci kontainer Seçilen birim değişkenleri
  String selectedValue1 = 'g/mol';
  String selectedValue2 = 'mM';
  String selectedValue3 = 'mM';
  String selectedValue4 = 'mM';
  //---İkinci kontainer Seçilen birim değişkenleri

  @override
  Widget build(BuildContext context) {
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
                compoundNameController: _compoundNameController1,
                labelText: 'Compound Name',
                onPressed: () {
                  String enteredComNameValue = _compoundNameController1.text;
                  String enteredComMwValue = _compoundMwController1.text;
                  String enteredComFcValue = _compoundFcController1.text;

                  // Check if all three fields are filled
                  if (enteredComNameValue.isNotEmpty &&
                      enteredComMwValue.isNotEmpty &&
                      enteredComFcValue.isNotEmpty) {
                    setState(() {
                      // Örneğin, seçilen birime göre başka bir işlem yapabilirsiniz
                      if (selectedValue1 == 'M') {
                        // M birimine göre özel bir işlem yap
                        calculationFcList
                            .add(double.parse(_compoundFcController1.text));
                      } else if (selectedValue1 == 'mM') {
                        // mM birimine göre özel bir işlem yap
                        calculationFcList.add(
                            double.parse(_compoundFcController1.text) *
                                TCalculation.miliMolarConversionFactor);
                      } else if (selectedValue2 == 'µM') {
                        // µM birimine göre özel bir işlem yap
                        calculationFcList.add(
                            double.parse(_compoundFcController1.text) *
                                TCalculation.microMolarConversionFactor);
                      } else if (selectedValue2 == 'nM') {
                        // nM birimine göre özel bir işlem yap
                        calculationFcList.add(
                            double.parse(_compoundFcController1.text) *
                                TCalculation.nanoMolarConversionFactor);
                      }
                      // Add the entered values to the Data Table
                      componentData.add({
                        'Component Name': enteredComNameValue,
                        'Component MW': '$enteredComMwValue $selectedValue1',
                        'Final Concentration':
                            '$enteredComFcValue $selectedValue2',
                      });
                    });

                    // Clear the TextFormFields after adding the values
                    _compoundNameController1.clear();
                    _compoundMwController1.clear();
                    _compoundFcController1.clear();
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
                controller: _compoundMwController1,
                unitValues: const [
                  'g/mol',
                ],
                labelText: 'Molecular Weight',
                initialSelectedValue: 'g/mol',
                onSelectionChanged: (selectedValue) {
                  setState(() {
                    // Seçilen birimi güncelle
                    selectedValue1 = selectedValue;
                  });
                },
              ),
              const SizedBox(
                height: TSizes.iconXs,
              ),

              ///--Final Concentration & DropDownButton,
              CreateBufferTextFormFieldDropdown(
                controller: _compoundFcController1,
                unitValues: const [
                  'M',
                  'mM',
                  'µM',
                  'nM',
                ],
                labelText: 'Final Concentration',
                initialSelectedValue: 'mM',
                onSelectionChanged: (selectedValue) {
                  setState(() {
                    // Seçilen birimi güncelle
                    selectedValue2 = selectedValue;

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
                compoundNameController: _compoundNameController2,
                labelText: 'Stock Solution Name',
                onPressed: () {
                  String enteredComNameValue = _compoundNameController2.text;
                  String enteredComMwValue = _compoundScController2.text;
                  String enteredComFcValue = _compoundFcController2.text;

                  // Check if all three fields are filled
                  if (enteredComNameValue.isNotEmpty &&
                      enteredComMwValue.isNotEmpty &&
                      enteredComFcValue.isNotEmpty) {
                    setState(() {
                      // Add the entered values to the list
                      componentData.add({
                        'Component Name': enteredComNameValue,
                        'Component MW': '$enteredComMwValue $selectedValue3',
                        'Final Concentration':
                            '$enteredComFcValue $selectedValue4',
                      });
                    });

                    // Clear the TextFormFields after adding the values
                    _compoundNameController2.clear();
                    _compoundScController2.clear();
                    _compoundFcController2.clear();
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
                controller: _compoundScController2,
                unitValues: const [
                  'M',
                  'mM',
                  'µM',
                  'nM',
                ],
                labelText: 'Stock Concentration',
                initialSelectedValue: 'mM',
                onSelectionChanged: (selectedValue) {
                  setState(() {
                    // Seçilen birimi güncelle
                    selectedValue3 = selectedValue;
                  });
                },
              ),
              const SizedBox(
                height: TSizes.iconXs,
              ),
              CreateBufferTextFormFieldDropdown(
                controller: _compoundFcController2,
                unitValues: const [
                  'M',
                  'mM',
                  'µM',
                  'nM',
                ],
                labelText: 'Final Concentration',
                initialSelectedValue: 'mM',
                onSelectionChanged: (selectedValue) {
                  setState(() {
                    // Seçilen birimi güncelle
                    selectedValue4 = selectedValue;
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
                controller: _volumeController,
                unitValues: const [
                  'M',
                  'mM',
                  'µM',
                  'nM',
                ],
                labelText: 'Final Volume of the Buffer',
                initialSelectedValue: 'mM',
                onSelectionChanged: (String) {},
              ),
              const SizedBox(
                height: TSizes.sm,
              ),
              CreateBufferTextFormFieldDropdown(
                controller: _volumeController,
                dropDownButton: false,
                unitValues: const [
                  'M',
                  'mM',
                  'µM',
                  'nM',
                ],
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
                onPressedCalculate: calculateMw,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDataTable() {
    final dark = THelperFunctions.isDarkMode(context);
    return DataTable(
      columnSpacing: 20,
      headingRowHeight: 36,
      columns: [
        DataColumn(
          label: SizedBox(
            child: Text(
              'C. Name',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(color: dark ? TColors.white : TColors.black),
            ),
          ),
        ),
        DataColumn(
          label: Text(
            'Mw/Conc',
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .apply(color: dark ? TColors.white : TColors.black),
          ),
        ),
        DataColumn(
          label: Text(
            'Final Conc.',
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .apply(color: dark ? TColors.white : TColors.black),
          ),
        ),
        DataColumn(
          label: Text(
            'Remove',
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .apply(color: dark ? TColors.white : TColors.black),
          ),
        ),
      ],
      rows: componentData.map((data) {
        return DataRow(
          cells: [
            DataCell(
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${data['Component Name']} ',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .apply(color: dark ? TColors.grey : TColors.darkerGrey),
                  )),
            ),
            DataCell(
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${data['Component MW']} ',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: dark ? TColors.grey : TColors.darkerGrey),
                ),
              ),
            ),
            DataCell(
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${data['Final Concentration']} ',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: dark ? TColors.grey : TColors.darkerGrey),
                ),
              ),
            ),
            DataCell(
              IconButton(
                icon: const Icon(Icons.delete, color: TColors.darkGrey),
                onPressed: () {
                  setState(() {
                    // Remove the data from the list
                    componentData.remove(data);
                  });
                },
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
