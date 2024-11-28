import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import '../components/grocery_tile.dart';
import '../models/models.dart';

class GroceryItemScreen extends StatefulWidget {
  final Function(GroceryItem) onCreate;
  final Function(GroceryItem) onUpdate;
  final GroceryItem? originalItem;
  final bool isUpdating;

  const GroceryItemScreen({
    Key? key,
    //required this.isUpdating,
    required this.onCreate,
    required this.onUpdate,
    this.originalItem,
  })  : isUpdating = (originalItem != null),
        super(key: key);

  @override
  State<GroceryItemScreen> createState() => _GroceryItemScreenState();
}

class _GroceryItemScreenState extends State<GroceryItemScreen> {
//TODO: Add Grocery item screen state properties
  final _nameController = TextEditingController();
  String _name = '';
  Importance _importance = Importance.low;
  DateTime _dueDate = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay.now();
  Color _currentColor = Colors.green;
  int _currentSliderValue = 0;

  //TODO: Add initState
  initState() {
    super.initState();
    final originalItem = widget.originalItem;
    if (originalItem != null) {
      _nameController.text = originalItem.name;
      _name = originalItem.name;
      _currentSliderValue = originalItem.quantity;
      _importance = originalItem.importance;
      _currentColor = originalItem.color;
      final date = originalItem.date;
      _timeOfDay = TimeOfDay(
        hour: date.hour,
        minute: date.minute,
      );
      _dueDate = date;

      _nameController.addListener(() {
        setState(() {
          _name = _nameController.text;
        });
      });
    }
  }

  //TODO: add dispose
  dispose() {
    _nameController.dispose();
    super.dispose();
  }

  // TimeOfDay _timeofDay = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    //TODO: Add GroceryItemScreen scaffold

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              //add callback handler
            },
            icon: Icon(Icons.check),
          ),
        ],
        elevation: 0.0,
        title: Text(
          'Grocery Item',
          style: GoogleFonts.lato(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            //TODO: Add name textfield
            buildNameField(),
            //TODO: Add importance selection
            buildImportanceField(),
            //TODO: Add date picker
            buildDateField(),
            //TODO: Add time picker
            buildTimeField(),
            //TODO: Add color picker
            buildColorPicker(),
            //TODO: Add slider
            SizedBox(
              height: 10,
            ),
            buildQuantityField(),
            //TODO: Add grocery tile
            GroceryTile(
              item: GroceryItem(
                  color: _currentColor,
                  date: DateTime(_dueDate.year, _dueDate.month, _dueDate.day,
                      _dueDate.hour, _dueDate.minute),
                  id: 'previewMode',
                  importance: _importance,
                  name: _name,
                  quantity: _currentSliderValue),
            )
          ],
        ),
      ),
    );
  }

  // TODO: Add buildNameField()
  Widget buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Item name',
          style: GoogleFonts.lato(
            fontSize: 28,
          ),
        ),
        TextField(
          controller: _nameController,
          cursorColor: _currentColor,
          decoration: InputDecoration(
            hintText: 'E.g Apples, Grapes, 1 bad of rice',
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: _currentColor),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: _currentColor),
            ),
          ),
        )
      ],
    );
  }

  // TODO: Add buildImportanceField()
  Widget buildImportanceField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Importance',
          style: GoogleFonts.lato(
            fontSize: 28,
          ),
        ),
        Wrap(
          spacing: 10,
          children: [
            ChoiceChip(
              label: Text(
                'Low',
                style: TextStyle(color: Colors.grey.shade400),
              ),
              selected: _importance == Importance.low,
              selectedColor: Colors.black,
              onSelected: (selected) {
                setState(() {
                  _importance = Importance.low;
                });
              },
            ),
            ChoiceChip(
              label: Text(
                'Medium',
                style: TextStyle(
                  color: Colors.grey.shade400,
                ),
              ),
              selected: _importance == Importance.medium,
              selectedColor: Colors.black,
              onSelected: (selected) {
                setState(() {
                  _importance = Importance.medium;
                });
              },
            ),
            ChoiceChip(
              selectedColor: Colors.black,
              label: Text(
                'High',
                style: TextStyle(color: Colors.grey.shade400),
              ),
              selected: _importance == Importance.high,
              onSelected: (selected) {
                setState(() {
                  _importance = Importance.high;
                });
              },
            )
          ],
        )
      ],
    );
  }

  // TODO: ADD buildDateField()
  Widget buildDateField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Date',
              style: GoogleFonts.lato(
                fontSize: 28,
              ),
            ),
            TextButton(
              onPressed: () async {
                final currentDate = DateTime.now();
                final selectedDate = await showDatePicker(
                  context: context,
                  firstDate: currentDate,
                  initialDate: currentDate,
                  lastDate: DateTime(
                    currentDate.year + 5,
                  ),
                );
                setState(() {
                  if (selectedDate != null) {
                    _dueDate = selectedDate;
                  }
                });
              },
              child: const Text('Select'),
            )
          ],
        ),
        Text(
          DateFormat('dd-MM-yyyy').format(_dueDate),
        )
      ],
    );
  }

  // TODO: Add buildTimeField()
  Widget buildTimeField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Time of the Day',
              style: GoogleFonts.lato(fontSize: 28.0),
            ),
            TextButton(
              child: Text('Select'),
              onPressed: () async {
                final timeOfDay = await showTimePicker(
                  initialTime: TimeOfDay.now(),
                  context: context,
                );
                setState(() {
                  if (timeOfDay != null) {
                    _timeOfDay = timeOfDay;
                  }
                });
              },
            ),
          ],
        ),
        Text(_timeOfDay.format(context)),
      ],
    );
  }

  // TODO: Add buildColorPicker()
  Widget buildColorPicker() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 50,
              width: 10,
              color: _currentColor,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              'Color',
              style: GoogleFonts.lato(fontSize: 28),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: BlockPicker(
                        pickerColor: Colors.white,
                        onColorChanged: (color) {
                          setState(() {
                            _currentColor = color;
                          });
                        }),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Save'))
                    ],
                  );
                });
          },
          child: Text('Select'),
        ),
      ],
    );
  }

  // TODO: Add buildQuantityField()
  Widget buildQuantityField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              'Quantity',
              style: GoogleFonts.lato(fontSize: 28),
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              _currentSliderValue.toInt().toString(),
              style: GoogleFonts.lato(fontSize: 18),
            )
          ],
        ),
        Slider(
            value: _currentSliderValue.toDouble(),
            min: 0.0,
            max: 100.0,
            divisions: 100,
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value.toInt();
              });
            })
      ],
    );
  }
}
