import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:selling_management/themes/app_themes.dart';

// ignore: must_be_immutable
class OptionChoice extends StatefulWidget {
  const OptionChoice({Key? key}) : super(key: key);

  State<OptionChoice> createState() => _OptionChoice();
}

class _OptionChoice extends State<OptionChoice> {
  Color colorSelected = Colors.white;
  Color colorSelectedBorder = Colors.white;
  Color? colorTextSelected = Color.fromARGB(255, 0, 0, 0);

  int? _value = 0;
  Widget build(BuildContext context) {
    List choice = ["22/06 - 22/06/2023", "Hom nay", "Hom qua", "7 ngay "];

    return Container(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          
          Wrap(
          
          direction: Axis.horizontal,
            spacing: 3.0,
            runSpacing: 1.0,
            children: List<Widget>.generate(
              choice.length,
              (int index) {
                
                if (index == 0) {
                  return ChoiceChip(
                  
                    avatar: const Icon(
                      Icons.calendar_month,
                      color: Colors.blue,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(width: 0, color: colorSelectedBorder)
                      ),
                    label: Text(
                      choice[index],
                      style: TextStyle(color: colorTextSelected, fontSize: 11),
                    ),
                  backgroundColor: Theme.of(context).backgroundColor,
                  selectedColor: colorSelected,
              
                    selected: _value == index,
                    onSelected: (bool selected) {
                      setState(() {
                        _value = selected ? index : null;
                        colorSelected = Theme.of(context).colorScheme.bodyHomeColor;
                        colorSelectedBorder = Theme.of(context).primaryColor;
      
                        // colorSelected = Colors.blue;
                      });
                    },
                  );
                }

                return ChoiceChip(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(width: 0, color: colorSelectedBorder)
                      ),
                  label: Text(
                    choice[index],
                    style: TextStyle(color: colorTextSelected, fontSize: 11),
                  ),
                  backgroundColor: Theme.of(context).backgroundColor,
                  selectedColor: colorSelected,
                  selected: _value == index,
                  onSelected: (bool selected) {
                    setState(() {
                      _value = selected ? index : null;
                        colorSelected = Theme.of(context).colorScheme.bodyHomeColor;
                        colorSelectedBorder = Theme.of(context).primaryColor;

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
