import 'package:flutter/material.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class MyDropDownButton extends StatefulWidget {
  final List<String> unitValues;
  final String initialSelectedValue;
  final Function(String) onSelectionChanged; // Yeni eklenen parametre

  const MyDropDownButton({
    super.key,
    required this.unitValues,
    required this.initialSelectedValue,
    required this.onSelectionChanged,
  });

  @override
  State<MyDropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<MyDropDownButton> {
  final width = THelperFunctions.screenWidth();
  late String onUnitChanged; // Default seçili birim

  @override
  void initState() {
    super.initState();
    onUnitChanged = widget.initialSelectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButton<String>(
          value: onUnitChanged,
          isExpanded: true,
          icon: const Icon(Icons.arrow_drop_down),
          style: const TextStyle(color: Colors.purple),
          borderRadius: BorderRadius.circular(10),
          padding: const EdgeInsets.only(top: 8, bottom: 8.0),
          alignment: Alignment.centerLeft,
          isDense: true,
          onChanged: (String? newValue) {
            setState(() {
              onUnitChanged = newValue!;
              // Yeni seçilen değeri dışarıya iletiyoruz
              widget.onSelectionChanged(newValue);
            });
          },
          items: widget.unitValues.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
