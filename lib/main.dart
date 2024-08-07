import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_instagram_searchable_listview_app/bloc/searchable_cubit/seachable_cubit.dart';
import 'package:flutter_instagram_searchable_listview_app/bloc_observer.dart';
import 'package:flutter_instagram_searchable_listview_app/views/home_view.dart';

void main() {
    Bloc.observer = MyBlocObserver();
  runApp(const SearchableListViewApp());
}

class SearchableListViewApp extends StatelessWidget {
  const SearchableListViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SeachableCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}
