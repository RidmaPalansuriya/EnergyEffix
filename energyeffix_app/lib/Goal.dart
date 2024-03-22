import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:energyeffix_app/Components/CustomAppBar.dart';
import 'package:energyeffix_app/Components/CustomDrawer.dart';
import 'CustomGoal.dart';
import 'LeaderBoard.dart';
import 'goal.dart';

class Goal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBar: AppBar(
        toolbarHeight: 120,
      ), title: "Goal"),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //CarouselSlider
              Container(
                height: 200,
                color: Colors.transparent,
                child: CarouselSlider(
                  items: [
                    Image.asset('assets/images/1.jpg'),
                    Image.asset('assets/images/2.jpg'),
                    Image.asset('assets/images/3.jpg'),
                    Image.asset('assets/images/4.jpg'),
                    Image.asset('assets/images/5.jpg'),
                  ],
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                  ),
                ),
              ),

              // 4 Buttons
              Container(
                color: Colors.blue,
                child: Column(
                  children: [
                    buildButtonRow(context, [
                      buildButton(
                        context,
                        'Our Champs',
                        LeaderboardPage(),
                      ),
                      buildButton(
                        context,
                        'My Rewards',
                        MyRewardsPage(),
                      ),
                    ]),
                    buildButtonRow(context, [
                      buildButton(
                        context,
                        'Energy Saving Tips',
                        EnergySavingTipsPage(),
                      ),
                      buildButton(
                        context,
                        'View My Badges',
                        ViewMyBadgesPage(),
                      ),
                    ]),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Horizontally scrollable row of daily challenge cards
              Container(
                height: 250, // Adjust height
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildDailyChallengeCard(context, 'Daily Challenge 1', 100),
                    buildDailyChallengeCard(context, 'Daily Challenge 2', 200),
                    buildDailyChallengeCard(context, 'Daily Challenge 3', 500),
                    buildDailyChallengeCard(context, 'Daily Challenge HEHE', 1000),
                    buildDailyChallengeCard(context,  'Daily Challenge yoyo', 7800),
                    buildDailyChallengeCard(context, 'Daily Challenge 6', 1600),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CustomGoal()),
          );
        },
        icon: Icon(Icons.add, color: Colors.white),
        label: Text('Create a Customized Goal', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget buildButtonRow(BuildContext context, List<Widget> buttons) {
    return Wrap(
      spacing: MediaQuery.of(context).size.width * 0.1,
      runSpacing: 10,
      children: buttons,
    );
  }

  Widget buildButton(BuildContext context, String text, Widget page) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, 
          backgroundColor: Colors.blue,
          padding: EdgeInsets.symmetric(vertical: 20.0),
          minimumSize: Size(MediaQuery.of(context).size.width * 0.3, 0),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget buildDailyChallengeCard(
    BuildContext context,
    //String imagePath,
    String title,
    int points)
    {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      width: MediaQuery.of(context).size.width * 0.6, // Adjust card width
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image of the goal
          // Image.asset(
          //   imagePath,
          //   height: 100,
          //   width: 100, // Adjust image height
          // ),
          SizedBox(height: 10),
          // Title of the goal
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          // Points received
          Text(
            'Points: $points',
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 10),
          // View more button
          ElevatedButton(
            onPressed: () {
              // Implement functionality to view more details
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Colors.black,
            ),
            child: Text('View More'),
          ),
        ],
      ),
    );
  }
}
class MyRewardsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Rewards'),
      ),
      body: Center(
        child: Text('My Rewards Page'),
      ),
    );
  }
}

class EnergySavingTipsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Energy Saving Tips'),
      ),
      body: Center(
        child: Text('Energy Saving Tips Page'),
      ),
    );
  }
}

class ViewMyBadgesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View My Badges'),
      ),
      body: Center(
        child: Text('View My Badges Page'),
      ),
    );
  }
}
