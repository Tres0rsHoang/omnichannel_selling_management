import 'package:flutter/material.dart';

class Tag {
  String text;
  int quantity;

  Tag({required this.text, required this.quantity});
}

class TagComponent extends StatefulWidget {
  bool isSelected;
  final Tag tag;

  TagComponent({super.key, required this.isSelected, required this.tag});

  @override
  _TagState createState() => _TagState();
}

class _TagState extends State<TagComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: widget.isSelected ? Colors.blue[500]! : Colors.grey[500]!,
          width: 1,
        ),
        color: widget.isSelected ? Colors.blue[500] : Colors.transparent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Row(
            children: [
              Text(
                widget.tag.text, // Use the tags list for displaying the text
                style: TextStyle(
                  fontFamily:
                      Theme.of(context).textTheme.bodyMedium?.fontFamily,
                  fontSize: 16,
                  color: widget.isSelected ? Colors.white : Colors.blue[500]!,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 8.0),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.blueGrey[50],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    widget.tag.quantity
                        .toString(), // Use the tags list for displaying the quantity
                    style: TextStyle(
                      fontFamily:
                          Theme.of(context).textTheme.bodyMedium?.fontFamily,
                      fontSize: 16,
                      color: Colors.blue[500],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
