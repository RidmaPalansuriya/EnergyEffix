import 'package:flutter/material.dart';

import 'Components/CustomAppBar.dart';
import 'Components/CustomDrawer.dart';

class LeaderboardPage extends StatefulWidget {
  @override
  _LeaderboardPageState createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  // Sample data for leaderboard
  List<User> leaderboardData = [
    User(name: 'User1', score: 500, rank: 1, profilePic: 'assets/user1.jpg'),
    User(name: 'User2', score: 450, rank: 2, profilePic: 'assets/user2.jpg'),
    User(name: 'User3', score: 400, rank: 3, profilePic: 'assets/user3.jpg'),
    User(name: 'User4', score: 350, rank: 4, profilePic: 'assets/user4.jpg'),
    User(name: 'User5', score: 300, rank: 5, profilePic: 'assets/user5.jpg'),
    User(name: 'User6', score: 250, rank: 6, profilePic: 'assets/user6.jpg'),
    User(name: 'User7', score: 200, rank: 7, profilePic: 'assets/user7.jpg'),
    User(name: 'User8', score: 150, rank: 8, profilePic: 'assets/user8.jpg'),
    User(name: 'User9', score: 100, rank: 9, profilePic: 'assets/user9.jpg'),
    User(name: 'User10', score: 90, rank: 10, profilePic: 'assets/user10.jpg'),
    User(name: 'User11', score: 80, rank: 11, profilePic: 'assets/user11.jpg'),
    User(name: 'User12', score: 70, rank: 12, profilePic: 'assets/user12.jpg'),
    User(name: 'User13', score: 60, rank: 13, profilePic: 'assets/user13.jpg'),
    User(name: 'User14', score: 50, rank: 14, profilePic: 'assets/user14.jpg'),
    User(name: 'User15', score: 40, rank: 15, profilePic: 'assets/user15.jpg'),
    // Add more users as needed
  ];

  User? myDetails; // Replace with your user details

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBar: AppBar(
        toolbarHeight: 120,
      ), title: "Our Champs"),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Top section with first, second, and third placeholders
              Container(
                padding: EdgeInsets.all(16.0),
                color: Colors.blue, // Set your desired background color
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //2nd Place
                    buildLeaderboardItem(leaderboardData[1], 2),
                    //1st Place
                    buildLeaderboardItem(leaderboardData[0], 1),
                    //3rd Place
                    buildLeaderboardItem(leaderboardData[2], 3),
                  ],
                ),
              ),
              SizedBox(height: 15.0), // Add space between sections
              // My rank section
              if (myDetails != null)
                Container(
                  padding: EdgeInsets.all(16.0),
                  color: Colors.green, // Set your desired background color
                  child: buildLeaderboardItem(myDetails!),
                ),
              SizedBox(height: 16.0), // Add space between sections
              // Leaderboard table
              buildLeaderboardTable(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLeaderboardItem(User user, [int? rank]) {
    return Column(
      children: [
        CircleAvatar(
          radius: rank == null ? 30 : 20, // Decrease radius for table
          backgroundImage: AssetImage(user.profilePic),
        ),
        SizedBox(height: 8.0),
        Text(user.name),
        Text('Rank: ${rank ?? user.rank}'), // Use the rank property if provided, otherwise use the user's rank
        Text('Score: ${user.score}'),
      ],
    );
  }

  Widget buildLeaderboardTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        columnSpacing: 15,
        columns: [
          DataColumn(label: Text('Rank')),
          DataColumn(label: Text('Profile Picture')),
          DataColumn(label: Text('Name')),
          DataColumn(label: Text('Points')),
        ],
        rows: leaderboardData.asMap().entries.map((entry) {
          final int rank = entry.key + 1;
          final User user = entry.value;
          return DataRow(cells: [
            DataCell(Text(rank.toString())),
            DataCell(CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(user.profilePic),
            )),
            DataCell(Text(user.name)),
            DataCell(Text(user.score.toString())),
          ]);
        }).toList(),
      ),
    );
  }
}

class User {
  final String name;
  final int score;
  final int rank;
  final String profilePic;

  User({
    required this.name,
    required this.score,
    required this.rank,
    required this.profilePic,
  });
}
