import 'package:flutter/material.dart';

class TxtIf extends StatelessWidget {
  final String txt;
  final String initialTxtValue;
  final String hint;
  final bool isReadOnly;
  final IconData? icon;
  final TextInputType textInputType;
  //final String Function(String) validator;
  final Function(String) onSaved;
  const TxtIf({
    Key? key,
    required this.txt,
    required this.initialTxtValue,
    required this.hint,
    this.icon,
    required this.isReadOnly,
    required this.textInputType,
    //required this.validator,
    required this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(25.0, 18, 25.0, 8),
          child: Text(
            txt,
            textAlign: TextAlign.start,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black54),
          ),
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 2.0,
            ),
          ]),
          margin: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
          child: TextFormField(
            initialValue: initialTxtValue,
            readOnly: isReadOnly,
            autocorrect: true,
            keyboardType: textInputType,
            style: const TextStyle(color: Colors.black),
            onChanged: (value){
              onSaved(value);
            },
            decoration: InputDecoration(
              hintText: hint,
              contentPadding: const EdgeInsets.all(0),
              prefixIcon: Icon(icon, color: Colors.grey,),
              hintStyle: const TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide:  BorderSide(color: Colors.white, width: 2),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: Colors.amber, width: 1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
