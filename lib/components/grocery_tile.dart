import 'package:flutter/material.dart';
import 'package:fooderlich_scroll/models/grocery_item.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class GroceryTile extends StatelessWidget {
  GroceryTile({
    super.key,
    required this.item,
    this.onComplete,
  }) : textDecoration =
            item.isComplete ? TextDecoration.lineThrough : TextDecoration.none;
  final GroceryItem item;
  final Function(bool?)? onComplete;
  final TextDecoration textDecoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      // TODO: change this widget
      height: 100.0,
      // TODO: replace the color
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //TODO: ADD ROW TO GROUP(NAME, DATE, IMPORTANCE)
          Row(
            children: [
              Container(
                width: 5.0,
                color: item.color,
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: GoogleFonts.lato(
                        color: Colors.black,
                        decoration: textDecoration,
                        fontSize: 21,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  buildDate(),
                  const SizedBox(
                    height: 4,
                  ),
                  buildImportance()
                ],
              ),
            ],
          ),

          //TODO: ADD ROW TO GROUP(QUANTITY , checkbox);
          Row(
            children: [
              Text(
                item.quantity.toString(),
                style: GoogleFonts.lato(
                  decoration: textDecoration,
                  fontSize: 21.0,
                ),
              ),
              buildCheckBox()
            ],
          )
        ],
      ),
    );
  }

  // TODO:  Add buildImportance()
  Widget buildImportance() {
    if (item.importance == Importance.low) {
      return Text(
        'Low',
        style: GoogleFonts.lato(
          decoration: textDecoration,
        ),
      );
    } else if (item.importance == Importance.medium) {
      return Text(
        'Medium',
        style: GoogleFonts.lato(
            fontWeight: FontWeight.w800, decoration: textDecoration),
      );
    } else if (item.importance == Importance.high) {
      return Text(
        'High',
        style: GoogleFonts.lato(
            color: Colors.red,
            fontWeight: FontWeight.w900,
            decoration: textDecoration),
      );
    } else {
      throw Exception('this importnce type does not exist');
    }
  }

  // TODO: Add buildDate()
  Widget buildDate() {
    final dateFormatter = DateFormat('MMMMM dd h:mm a');
    final dateString = dateFormatter.format(item.date);
    return Text(
      dateString,
      style: TextStyle(decoration: textDecoration),
    );
  }

  // TODO: Add buildCheckBox()
  Widget buildCheckBox() {
    return Checkbox(
      value: item.isComplete,
      onChanged: onComplete,
    );
  }
}
