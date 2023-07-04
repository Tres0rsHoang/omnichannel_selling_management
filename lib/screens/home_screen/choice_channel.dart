import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

// ignore: must_be_immutable
class ChoiceChannel extends StatefulWidget {
  const ChoiceChannel({Key? key}) : super(key: key);

  State<ChoiceChannel> createState() => _ChoiceChannel();
}

class MultiChoice extends StatefulWidget {
  const MultiChoice({Key? key, required this.items}) : super(key: key);
  final List<String> items;
  @override
  State<MultiChoice> createState() => _MultiChoice();
}

class _MultiChoice extends State<MultiChoice> {
  List<String> _selectedItem = [];

  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItem.add(itemValue);
      } else {
        _selectedItem.remove(itemValue);
      }
    });

    
  }
  void _cancel() {
      Navigator.pop(context);
    }

    void _submit() {
      Navigator.pop(context, _selectedItem);
    }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment(50.0, 50.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      content: SingleChildScrollView(
        child: ListBody(
            children: widget.items
                .map((item) => CheckboxListTile(
                    value: _selectedItem.contains(item),
                    title: Text(item),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (isChecked) => _itemChange(item, isChecked!)))
                .toList()),
      ),
      actions: [
        TextButton(onPressed: _cancel, child: const Text("Cancel")),
        ElevatedButton(onPressed: _submit, child: Text("Submit"))
      ],
    );
  }
}

class _ChoiceChannel extends State<ChoiceChannel> {
  Color? colorSelected = Colors.blue;
  Color? colorTextSelected = Color.fromARGB(255, 0, 0, 0);
  List<String> _selectedItem = [];
  int? _value = 1;

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 0, left: 10, right: 10),
        child: Row(
          children: [
            Column(
              children: [
                ElevatedButton(
                    onPressed: showMultipleSelect,
                    child: Row(
                      children: [
                        const Text("Chon kenh ban"),
                        Icon(Icons.arrow_drop_down),
                      ],
                    )),
              ],
            ),
            Spacer(),
            Text("thoi gian cap nhat")
          ],
        ));
  }

  void showMultipleSelect() async {
    final List<String> channelItems = [
      "Shopee",
      "Lazada",
      "Website",
      "Sendo",
      "Tabao",
      "All"
    ];

    final List<String>? results = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return Positioned(child: MultiChoice(items: channelItems));
        });

    // update UI
    if (results != null) {
      setState(() {
        _selectedItem = results;
      });
    }
  }
}
