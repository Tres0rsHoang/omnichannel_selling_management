import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OptionChoice extends StatefulWidget {
  const OptionChoice({Key? key}) : super(key: key);

  State<OptionChoice> createState() => _OptionChoice();
}

class _OptionChoice extends State<OptionChoice> {
  Color? colorSelected = Colors.blue;
  Color? colorTextSelected = Color.fromARGB(255, 0, 0, 0);

  int? _value = 1;
  Widget build(BuildContext context) {
    List choice = ["22/06/2023 - 22/06/2023", "Hom nay", "Hom qua", "7 ngay "];

    return Container(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 2.0),
          Wrap(
            spacing: 3.0,
            runSpacing: 3.0,
            children: List<Widget>.generate(
              choice.length,
              (int index) {
                if (index != _value) {
                  colorTextSelected = Colors.black;
                } else
                  colorTextSelected = Colors.white;
                if (index == 0) {
                  return ChoiceChip(
                    avatar: const Icon(
                      Icons.calendar_month,
                      color: Colors.blue,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(width: 0, color: Colors.blue)),
                    label: Text(
                      choice[index],
                      style: TextStyle(color: colorTextSelected, fontSize: 12),
                    ),
                  backgroundColor: Theme.of(context).backgroundColor,
                    
                    
                    selected: _value == index,
                    onSelected: (bool selected) {
                      setState(() {
                        _value = selected ? index : null;

                        // colorSelected = Colors.blue;
                      });
                    },
                  );
                }

                return ChoiceChip(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      ),
                  label: Text(
                    choice[index],
                    style: TextStyle(color: colorTextSelected),
                  ),
                  backgroundColor: Theme.of(context).backgroundColor,
                  selectedColor: colorSelected,
                  selected: _value == index,
                  onSelected: (bool selected) {
                    setState(() {
                      _value = selected ? index : null;

                      // colorSelected = Colors.blue;
                    });
                  },
                );
              },
            ).toList(),
          ),
        ],
      ),
      // filter for channel
    );
  }
}
