import 'package:flutter/material.dart';
import 'package:flutter_instagram_searchable_listview_app/widgets/custom_textfield.dart';
import 'package:flutter_instagram_searchable_listview_app/widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        elevation: 0.0,
        title: const SizedBox(
          height: 38,
          child: CustomTextField(),
        ),
      ),
      body: const HomeViewBody(),
    );
  }
}