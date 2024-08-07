import 'package:flutter/material.dart';
import 'package:flutter_instagram_searchable_listview_app/models/user_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<User> _users = [
    User(
        'Elliana Palacios',
        '@elliana',
        'https://images.unsplash.com/photo-1504735217152-b768bcab5ebc?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=0ec8291c3fd2f774a365c8651210a18b',
        false),
    User(
        'Kayley Dwyer',
        '@kayley',
        'https://images.unsplash.com/photo-1503467913725-8484b65b0715?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=cf7f82093012c4789841f570933f88e3',
        false),
    User(
        'Kathleen Mcdonough',
        '@kathleen',
        'https://images.unsplash.com/photo-1507081323647-4d250478b919?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=b717a6d0469694bbe6400e6bfe45a1da',
        false),
    User(
        'Kathleen Dyer',
        '@kathleen',
        'https://images.unsplash.com/photo-1502980426475-b83966705988?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=ddcb7ec744fc63472f2d9e19362aa387',
        false),
    User(
        'Mikayla Marquez',
        '@mikayla',
        'https://images.unsplash.com/photo-1541710430735-5fca14c95b00?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false),
    User(
        'Kiersten Lange',
        '@kiersten',
        'https://images.unsplash.com/photo-1542534759-05f6c34a9e63?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false),
    User(
        'Carys Metz',
        '@metz',
        'https://images.unsplash.com/photo-1516239482977-b550ba7253f2?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false),
    User(
        'Ignacio Schmidt',
        '@schmidt',
        'https://images.unsplash.com/photo-1542973748-658653fb3d12?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false),
    User(
        'Clyde Lucas',
        '@clyde',
        'https://images.unsplash.com/photo-1569443693539-175ea9f007e8?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false),
    User(
        'Mikayla Marquez',
        '@mikayla',
        'https://images.unsplash.com/photo-1541710430735-5fca14c95b00?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false)
  ];

  List<User> _foundedUsers = [];

  @override
  void initState() {
    super.initState();
    _foundedUsers = _users;
  }

  onSearch(String search) {
    _foundedUsers = _users
        .where((user) => user.name.toLowerCase().contains(search))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade900,
          elevation: 0.0,
          title: SizedBox(
            height: 38,
            child: TextField(
              style: const TextStyle(color: Colors.white),
              onChanged: (value) {
                setState(() {
                  onSearch(value);
                });
              },
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: Colors.grey.shade500,
                  hintText: 'Search users',
                  hintStyle:
                      TextStyle(fontSize: 14, color: Colors.grey.shade500),
                  filled: true,
                  fillColor: Colors.grey[850],
                  contentPadding: const EdgeInsets.all(0),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(50))),
            ),
          ),
        ),
        body: Container(
          color: Colors.grey.shade900,
          child: _foundedUsers.length > 0
              ? ListView.builder(
                  itemCount: _foundedUsers.length,
                  itemBuilder: (context, index) {
                    return Slidable(
                        startActionPane: ActionPane(
                          motion:const  ScrollMotion(),
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
                        child: userComponent(user: _foundedUsers[index]));
                  })
              : const Center(
                  child: Text(
                  "No users found",
                  style: TextStyle(color: Colors.white),
                )),
        ),
      ),
    );
  }
  //

  userComponent({required User user}) {
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
              setState(() {
                user.isFollowedByMe = !user.isFollowedByMe;
              });
            },
            child: Container(
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
                      user.isFollowedByMe ? Colors.blue[700] :Color(0xffffff),
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
