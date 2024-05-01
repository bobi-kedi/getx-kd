import 'package:flutter/material.dart';
import 'package:kelasdigital/configs/kd_styles/app_styles.dart';

class OptionItem extends StatelessWidget {
  final int value;
  final bool isSelected;
  final int selectedIndex;
  final String title;
  final String? description;
  final Function(int?)? onChanged;
  const OptionItem({
    super.key,
    required this.value,
    required this.isSelected,
    required this.selectedIndex,
    required this.title,
    required this.onChanged,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: () {
          onChanged!(value);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: (isSelected)
                  ? KdColor.primary70
                  : KdColor.neutral70.withOpacity(0.7),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Radio(
                    fillColor: MaterialStateColor.resolveWith(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.selected)) {
                          return KdColor.primary70;
                        }
                        return KdColor.neutral70.withOpacity(0.7);
                      },
                    ),
                    value: value,
                    groupValue: selectedIndex,
                    onChanged: onChanged,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: KdTextStyles.body1Regular.copyWith(
                        color: KdColor.neutral90,
                      ),
                    ),
                    if (description != null)
                      Text(
                        '$description',
                        style: KdTextStyles.body2Regular.copyWith(
                          color: KdColor.neutral70,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
