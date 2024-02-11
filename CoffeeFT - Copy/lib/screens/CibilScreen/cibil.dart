import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:coffeeft/constants.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:coffeeft/services/api_service.dart';

class CibilScreen extends StatelessWidget {
  const CibilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kPrimarycolor,
        appBar: AppBar(
          title: Column(
            children: [
              Text(
                "Calculate my CIBIL",
                style: TextStyle(
                  color: darkgreen,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Text(
              //   "${ItemsList.length} Items",
              //   style: TextStyle(
              //     color: Colors.grey,
              //     fontSize: 12,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
            ],
          ),
          centerTitle: true,
        ),
        body: MyForm(),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  // Declare the form key
  final _formKey = GlobalKey<FormState>();
  final gemini = Gemini.instance;

  // Declare the variables to store the input values
  String _district = '';
  String _state = '';
  int _age = 0;
  int _kids = 0;
  int _yearly_income = 0;
  int _land = 0;
  String _gender = '';

  // Declare the radio button values
  final _genders = ['Male', 'Female', 'Other'];

  // Declare the calculation result
  String _result = '';

  // Define a method to perform the calculation
  void _calculate() {
    setState(() {
      // Perform any calculation here, for example:
      final _prompt =
          'tell me the rough estimate of the cibil score of a farmer with these characteristics, only mention the score and dont say anything else\nannual income: ${_yearly_income} rupees\n loans taken: ${1000}\nland owned: ${_land}acres\nlocation:${_district}, ${_state}';
      gemini.text(_prompt)
          .then((value) async {
        _result = "CIBIL Score: " + value!.content!.parts!.last.text! as String;
        final _firestore = FirebaseFirestore.instance;
        final _currentUser = FirebaseAuth.instance.currentUser?.uid;
        print(_currentUser);
        await _firestore
            .collection('cibil')
            .doc(_currentUser)
            .set({'cibilScore': value}).then((value) => print('done'));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Text field for district
            TextFormField(
              style: TextStyle(color: darkgreen),
              decoration: InputDecoration(
                labelText: 'District',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your district';
                }
                return null;
              },
              onSaved: (value) {
                _district = value!;
              },
            ),
            TextFormField(
              style: TextStyle(color: darkgreen),
              decoration: InputDecoration(
                labelText: 'State',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your state';
                }
                return null;
              },
              onSaved: (value) {
                _state = value!;
              },
            ),
            // Text field for age
            TextFormField(
              style: TextStyle(color: darkgreen),
              decoration: InputDecoration(
                labelText: 'Age',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your age';
                }
                if (int.tryParse(value) == null) {
                  return 'Please enter a valid number';
                }
                return null;
              },
              onSaved: (value) {
                _age = int.parse(value!);
              },
            ),
            // Radio buttons for gender
            Text(
              'Gender',
              style: TextStyle(color: darkgreen),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _genders.map((gender) {
                return Row(
                  children: [
                    Radio<String>(
                      value: gender,
                      groupValue: _gender,
                      onChanged: (value) {
                        setState(() {
                          _gender = value!;
                        });
                      },
                    ),
                    Text(
                      gender,
                      style: TextStyle(color: darkgreen),
                    ),
                  ],
                );
              }).toList(),
            ),
            TextFormField(
              style: TextStyle(color: darkgreen),
              decoration: InputDecoration(
                labelText: 'No of kids',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter number of children';
                }
                if (int.tryParse(value) == null) {
                  return 'Please enter a valid number';
                }
                return null;
              },
              onSaved: (value) {
                _kids = int.parse(value!);
              },
            ),
            TextFormField(
              style: TextStyle(color: darkgreen),
              decoration: InputDecoration(
                labelText: 'Yearly Income',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter yearly income';
                }
                if (int.tryParse(value) == null) {
                  return 'Please enter a valid number';
                }
                return null;
              },
              onSaved: (value) {
                _yearly_income = int.parse(value!);
              },
            ),
            TextFormField(
              style: TextStyle(color: darkgreen),
              decoration: InputDecoration(
                labelText: 'Land owned(in acres)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter land owned';
                }
                if (int.tryParse(value) == null) {
                  return 'Please enter a valid number';
                }
                return null;
              },
              onSaved: (value) {
                _land = int.parse(value!);
              },
            ),
            // Elevated button to submit the form
            ElevatedButton(
              onPressed: () {
                // Validate and save the form
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // Call the calculation method
                  _calculate();
                }
              },
              child: Text('Submit'),
            ),
            SizedBox(height: 16.0),
            // Text widget to display the result
            Text(
              _result,
              style: TextStyle(
                color: darkgreen,
                fontSize: 21.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
