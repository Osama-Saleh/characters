import 'package:flutter/material.dart';

class SearchBuild extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String)? onChanged;
  SearchBuild({required this.controller,this.onChanged,super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        hintText: 'find a Character',
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.grey,fontSize: 18)
      ),
      onChanged: onChanged
    );
  }
}