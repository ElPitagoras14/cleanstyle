import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    super.key,
    required this.options,
    this.onChanged,
    this.selectedValue, // Valor inicial
  });

  final List<DropdownMenuEntry<dynamic>> options;
  final ValueChanged<dynamic>? onChanged;
  final dynamic selectedValue;

  @override
  CustomDropdownState createState() => CustomDropdownState();
}

class CustomDropdownState extends State<CustomDropdown> {
  late dynamic _selectedOption;

  @override
  void initState() {
    super.initState();
    _selectedOption = widget.selectedValue ?? widget.options.isNotEmpty
        ? widget.options[0].value
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<dynamic>(
      value: _selectedOption,
      isExpanded: true,
      items: widget.options.map((entry) {
        return DropdownMenuItem<dynamic>(
          value: entry.value,
          child: Text(entry.label),
        );
      }).toList(),
      onChanged: (dynamic value) {
        setState(() {
          _selectedOption = value;
        });

        if (widget.onChanged != null) {
          widget.onChanged!(value); // Llama al onChanged si está presente
        }
      },
    );
  }
}
