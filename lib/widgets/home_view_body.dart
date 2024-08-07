import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_instagram_searchable_listview_app/bloc/searchable_cubit/seachable_cubit.dart';
import 'package:flutter_instagram_searchable_listview_app/widgets/user_component.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<SeachableCubit>(context);

    return BlocConsumer<SeachableCubit, SeachableState>(
      listener: (context, state) {
        if (state is SeachableInitial) {
          cubit.foundedUsers = cubit.users;
        }
      },
      builder: (context, state) {
        if (state is SeachableInitial ||
            state is SeachableLoaded ||
            state is Seachablefollow) {
          return Container(
              color: Colors.grey.shade900,
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const BouncingScrollPhysics(),
                  itemCount: cubit.foundedUsers.length,
                  itemBuilder: (context, index) {
                    return Slidable(
                        startActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) {},
                              backgroundColor: Colors.transparent,
                              label: 'Archive',
                              icon: Icons.archive,
                            ),
                            SlidableAction(
                              onPressed: (context) {},
                              backgroundColor: Colors.transparent,
                              label: 'Share',
                              icon: Icons.share_rounded,
                            ),
                          ],
                        ),
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) {},
                              backgroundColor: Colors.transparent,
                              label: 'More',
                              icon: Icons.more_horiz,
                            ),
                            SlidableAction(
                              onPressed: (context) {},
                              backgroundColor: Colors.transparent,
                              label: 'Delete',
                              icon: Icons.delete,
                            ),
                          ],
                        ),
                        child: UserComponent(user: cubit.foundedUsers[index]));
                  }));
        } else if (state is SeachableEmpty) {
          return const Center(
            child: Text(
              "No users found",
              style: TextStyle(color: Colors.white),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
