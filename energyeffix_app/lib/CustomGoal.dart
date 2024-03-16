import 'package:flutter/material.dart';


class CustomGoal extends StatefulWidget {
  @override
  _CustomGoalState createState() => _CustomGoalState();
}

class _CustomGoalState extends State<CustomGoal> {
  int currentStep = 0;
  List<String> goalTypes = ['Percentage Reduction', 'Absolute Target'];
  List<String> timeFrames = ['Daily', 'Weekly', 'Monthly', 'Annually'];
  String selectedGoalType = 'Percentage Reduction';
  String selectedTimeFrame = 'Daily';
  TextEditingController usageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create a Customized Goal'),
      ),
      body: SafeArea(
        child: Stepper(
          currentStep: currentStep,
          onStepContinue: () {
            if (currentStep < 3) {
              setState(() {
                currentStep += 1;
              });
            } else {
              // Save data logic
              // Add your code to handle the Save button action
            }
          },
          onStepCancel: () {
            if (currentStep > 0) {
              setState(() {
                currentStep -= 1;
              });
            }
          },
          steps: [
            Step(
              title: Text('Goal Type'),
              content: Column(
                children: [
                  Wrap(
                    spacing: 10.0,
                    children: goalTypes.map((type) {
                      return ChoiceChip(
                        label: Text(type),
                        selected: selectedGoalType == type,
                        onSelected: (selected) {
                          setState(() {
                            selectedGoalType = type;
                          });
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
              isActive: currentStep == 0,
            ),
            Step(
              title: Text('Time Frame'),
              content: Column(
                children: [
                  Wrap(
                    spacing: 10.0,
                    children: timeFrames.map((frame) {
                      return ChoiceChip(
                        label: Text(frame),
                        selected: selectedTimeFrame == frame,
                        onSelected: (selected) {
                          setState(() {
                            selectedTimeFrame = frame;
                          });
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
              isActive: currentStep == 1,
            ),
            Step(
              title: Text('Usage Reduction'),
              content: Column(
                children: [
                  TextFormField(
                    controller: usageController,
                    decoration: InputDecoration(
                      labelText: selectedGoalType == 'Percentage Reduction'
                          ? 'Usage reduction target Percentage'
                          : 'Usage reduction Absolute Target',
                    ),
                  ),
                ],
              ),
              isActive: currentStep == 2,
            ),
            Step(
              title: Text('Set Alert'),
              content: Column(
                children: [
                  CheckboxListTile(
                    title: Text('Receive alerts when approaching the goal.'),
                    value: true, // Change the value based on the user's selection
                    onChanged: (value) {
                      // Handle checkbox value change
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Receive alerts when exceeding the goal.'),
                    value: false, // Change the value based on the user's selection
                    onChanged: (value) {
                      // Handle checkbox value change
                    },
                  ),
                  // Add more checkboxes and logic for custom alerts
                ],
              ),
              isActive: currentStep == 3,
            ),
          ],
        ),
      ),
    );
  }
}
