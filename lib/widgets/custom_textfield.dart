import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_instagram_searchable_listview_app/bloc/searchable_cubit/seachable_cubit.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      onChanged: (value) {
        BlocProvider.of<SeachableCubit>(context).onSearch(value);
      },
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          prefixIconColor: Colors.grey.shade500,
          hintText: 'Search users',
          hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade500),
          filled: true,
          fillColor: Colors.grey[850],
          contentPadding: const EdgeInsets.all(0),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(50))),
    );
  }
}
