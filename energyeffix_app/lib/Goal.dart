import 'package:energyeffix_app/GetStarted.dart';
import 'package:energyeffix_app/ManualEntry.dart';
import 'package:energyeffix_app/ManualEntry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:energyeffix_app/Components/CustomAppBar.dart';
import 'package:energyeffix_app/Components/CustomDrawer.dart';

import 'CustomGoal.dart';
import 'LeaderBoard.dart';
import 'goal.dart';


class GoalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(appBar: AppBar(
      //   toolbarHeight: 100,
      // ), title: "Analytics", ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
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
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 12 / 4, // Updated aspect ratio
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    buildImageButton(
                      'Leaderboard',
                      'image_url_1',
                          () {
                        // Navigate to LeaderboardPage
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ManualEntry()));
                      },
                    ),
                    buildImageButton(
                      'My Rewards',
                      'assets/images/1.jpg',
                          () {
                        // Navigate to MyRewardsPage
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MyRewardsPage()));
                      },
                    ),
                    buildImageButton(
                      'Energy Saving Tips',
                      'image_url_3',
                          () {
                        // Navigate to EnergySavingTipsPage
                        Navigator.push(context, MaterialPageRoute(builder: (context) => EnergySavingTipsPage()));
                      },
                    ),
                    buildImageButton(
                      'View My Badges',
                      'image_url_4',
                          () {
                        // Navigate to ViewMyBadgesPage
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LeaderboardPage()));
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4, // Adjust the number of predefined goals as needed
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Open detailed view for the selected goal
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Goal Details'),
                              content: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Goal Name $index'),
                                  Text('Objective: Achieve this goal to earn points!'),
                                  Text('Points: 100'),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Add logic to subscribe to the goal
                                      Navigator.pop(context); // Close the dialog
                                    },
                                    child: Text('Subscribe'),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        width: 200,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        color: Colors.grey,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset('assets/images/1.jpg',
                              height: double.infinity,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              bottom: 10,
                              child: Text(
                                'Goal $index',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),



      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Navigate to the create customized goal page
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => GetStartedScreen()),
          //);
          // Instead of navigating, show the CustomGoal widget as a modal bottom sheet
          showAdaptiveDialog(
            context: context,
            builder: (context) => CustomGoal(),
          );
        },
        icon: Icon(Icons.add, color: Colors.white), // Set icon color to white
        label: Text('Create a Customized Goal', style: TextStyle(color: Colors.white)), // Set text color to white
        backgroundColor: Colors.blue, // Set background color to blue
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0), // Adjust corner radius as desired
        ),
        //minWidth: double.infinity, // Ensures the button spans the full width
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget buildImageButton(String text, String imageUrl, Function onPressed) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(10), // Updated padding
      ),
      child: Column(
        children: [
          Image.network(
            imageUrl,
            height: 60, // Updated height
            width: 50, // Updated width
            fit: BoxFit.cover,
          ),
          SizedBox(height: 5),
          Text(text),
        ],
      ),
    );
  }
}


//
// class LeaderboardPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Leaderboard'),
//       ),
//       body: Center(
//         child: Text('Leaderboard Page'),
//       ),
//     );
//   }
// }
//
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
