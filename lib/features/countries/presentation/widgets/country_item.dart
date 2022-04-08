import 'package:flutter/material.dart';

class CountryItem extends StatelessWidget {
  const CountryItem({
    Key? key,
    required this.commonName,
    required this.officialName,
    required this.hasCheckbox,
    this.onChanged,
    this.checkboxValue,
  }) : super(key: key);
  final String officialName;
  final String commonName;
  final bool hasCheckbox;
  final void Function(bool?)? onChanged;
  final bool? checkboxValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.grey)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'official: ' + officialName,
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                'common: ' + commonName,
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
          if (hasCheckbox)
            Checkbox(
              onChanged: onChanged,
              value: checkboxValue,
            ),
        ],
      ),
    );
  }
}
