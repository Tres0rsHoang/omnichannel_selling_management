import 'package:flutter/material.dart';

class Tag {
  String text;
  int quantity;

  Tag({required this.text, required this.quantity});

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      text: json['text'] as String,
      quantity: json['quantity'] as int,
    );
  }
}

class TagComponent extends StatefulWidget {
  final bool isSelected;
  final Tag tag;

  const TagComponent({super.key, required this.isSelected, required this.tag});

  @override
  State<TagComponent> createState() => _TagState();
}

class _TagState extends State<TagComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: widget.isSelected
              ? Theme.of(context).primaryColor
              : Colors.grey[500]!,
          width: 1,
        ),
        color: widget.isSelected
            ? Theme.of(context).primaryColor
            : Colors.transparent,
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
                  color: widget.isSelected
                      ? Colors.white
                      : Theme.of(context).primaryColor,
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
                        color: Theme.of(context).primaryColor),
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
