import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_instagram_searchable_listview_app/bloc/searchable_cubit/seachable_cubit.dart';
import 'package:flutter_instagram_searchable_listview_app/models/user_model.dart';

class UserComponent extends StatelessWidget {
  const UserComponent({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<SeachableCubit>(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(user.image),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.name,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500)),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(user.username,
                      style: TextStyle(color: Colors.grey[500])),
                ],
              )
            ],
          ),
          GestureDetector(
            onTap: () {
              cubit.follow(user: user);
            },
            child: AnimatedContainer(
                duration: Duration(milliseconds: 150),
                height: 35,
                width: 110,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: user.isFollowedByMe
                        ? Colors.transparent
                        : Colors.grey.shade700,
                  ),
                  borderRadius: BorderRadius.circular(5),
                  color:
                      user.isFollowedByMe ? Colors.blue[700] : Color(0xffffff),
                ),
                child: Center(
                  child: Text(user.isFollowedByMe ? 'Unfollow' : 'Follow',
                      style: TextStyle(
                          color: user.isFollowedByMe
                              ? Colors.white
                              : Colors.white)),
                )),
          ),
        ],
      ),
    );
  }
}
