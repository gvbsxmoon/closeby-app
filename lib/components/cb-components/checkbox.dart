import "package:closeby/utils/colors.dart";
import "package:closeby/utils/fonts.dart";
import "package:flutter/material.dart";

class CBCheckbox extends StatefulWidget {
  const CBCheckbox({
    super.key,
    required this.checked,
    required this.label,
    required this.onChanged,
  });

  @override
  State<CBCheckbox> createState() => _CBCheckboxState();

  final bool checked;
  final String label;
  final Function() onChanged;
}

class _CBCheckboxState extends State<CBCheckbox> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onChanged,
      child: Row(
        children: [
          Container(
            width: 18,
            height: 18,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                  color: widget.checked
                      ? AppColor.rebeccaPurple
                      : AppColor.lightGrey,
                  width: 2),
              color: AppColor.offWhite,
            ),
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 50),
                  width: widget.checked ? 20 : 0,
                  height: widget.checked ? 20 : 0,
                  decoration: BoxDecoration(
                    color: AppColor.rebeccaPurple,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                SizedBox(
                  width: 6,
                  height: 6,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColor.offWhite,
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            widget.label,
            style: AppFonts.figtree(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: AppColor.secondaryBlack),
          )
        ],
      ),
    );
  }
}
