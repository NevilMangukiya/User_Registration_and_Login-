import 'package:flutter/material.dart';

class StepperPage extends StatefulWidget {
  const StepperPage({Key? key}) : super(key: key);

  @override
  State<StepperPage> createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Your Profile",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Stepper(
                type: StepperType.vertical,
                currentStep: _currentStep,
                onStepTapped: (index) {
                  setState(() {
                    _currentStep = index;
                  });
                },
                onStepContinue: () {
                  (_currentStep <= 10)
                      ? (_currentStep == 10)
                          ? Navigator.of(context).pushNamed('/')
                          : setState(() {
                              _currentStep += 1;
                            })
                      : null;
                },
                onStepCancel: () {
                  (_currentStep >= 1)
                      ? setState(() {
                          _currentStep -= 1;
                        })
                      : null;
                },
                steps: [
                  Step(
                    title: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    content: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "FullName",
                            prefixIcon: const Icon(Icons.account_box_sharp),
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "EmailId",
                            prefixIcon: const Icon(Icons.email_outlined),
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Password",
                            prefixIcon: const Icon(Icons.lock_outline),
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "ConfrimPassword",
                            prefixIcon: const Icon(Icons.lock_outline),
                          ),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    content: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "User Name⭐",
                            prefixIcon: const Icon(Icons.account_box_sharp),
                          ),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Password⭐",
                            prefixIcon: const Icon(Icons.lock_outline),
                          ),
                        )
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 1
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: const Text(
                      "Home",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    content: Column(),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 2
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
