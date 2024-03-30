import 'package:flutter/material.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final FocusNode _fullNameFocusNode = FocusNode();
  final FocusNode _countryCodeFocusNode = FocusNode();
  final FocusNode _mobileNumberFocusNode = FocusNode();

  @override
  void dispose() {
    _fullNameFocusNode.dispose();
    _countryCodeFocusNode.dispose();
    _mobileNumberFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // GestureDetector to capture taps
      onTap: () {
        // Dismiss keyboard when tapped outside of text fields
        FocusScope.of(context).unfocus();
      },
      child: MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.black,
          body: Padding(
            padding: const EdgeInsets.all(20.0), //change fromLTRB values
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20.0),
                Center(
                  child: Container(),
                ),
                const SizedBox(height: 20.0),
                TextField(
                  focusNode: _fullNameFocusNode,
                  textInputAction: TextInputAction.next,
                  onSubmitted: (_) {
                    _fieldFocusChange(
                        context, _fullNameFocusNode, _countryCodeFocusNode);
                  },
                  decoration: const InputDecoration(
                    labelText: "Full Name",
                    hintText: "Full Name",
                    hintStyle: TextStyle(color: Colors.grey),
                    labelStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),

                const SizedBox(height: 20.0),

                TextField(
                  decoration: InputDecoration(
                    labelText: 'Mobile Number',
                    labelStyle: const TextStyle(color: Colors.grey),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    prefix: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width:
                          60.0, // Adjust the width as needed for the prefix text field
                          child: TextField(
                            focusNode: _countryCodeFocusNode,
                            textInputAction: TextInputAction.next,
                            onSubmitted: (_) {
                              _fieldFocusChange(context, _countryCodeFocusNode,
                                  _mobileNumberFocusNode);
                            },
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              hintText: '+91',
                              hintStyle: TextStyle(color: Colors.grey),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                            width:
                            10.0), // Adjust the space between prefix and suffix
                        Flexible(
                          child: TextField(
                            focusNode: _mobileNumberFocusNode,
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.done,
                            onSubmitted: (_) {
                              _mobileNumberFocusNode
                                  .unfocus(); // Dismiss keyboard
                            },
                            decoration: const InputDecoration(
                              hintText: 'Mobile Number',
                              hintStyle: TextStyle(color: Colors.grey),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20.0),

                const Spacer(),

                //BUTTON SEND OTP
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
                    child: SizedBox(
                      height: 52,
                      width: MediaQuery.of(context).size.width,
                      child: MaterialButton(
                        onPressed: () {

                        },
                        color: Colors.lightGreen,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              50.0), // Circular border radius
                        ),
                        child: const Text(
                          'Send OTP',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}

//THIS BELOW CODE YOU CAN USED IT FOR 2 DIFFRENT TEXTFIELD COUNTRY CODE AND MOBILE NUMBER IF YIU WANT TO TEST IT ADD AFTER ANYWHERE AFTER const SizedBox(height: 20.0),

// Row(
//   children: [
//     Expanded(
//       child: TextField(
//         focusNode: _countryCodeFocusNode,
//         keyboardType: TextInputType.phone,
//         decoration: const InputDecoration(
//           labelText: '+91',
//           labelStyle: TextStyle(color: Colors.grey),
//           enabledBorder: UnderlineInputBorder(
//             borderSide: BorderSide(color: Colors.grey),
//           ),
//           focusedBorder: UnderlineInputBorder(
//             borderSide: BorderSide(color: Colors.grey),
//           ),
//         ),
//         style: const TextStyle(color: Colors.white),
//         onChanged: (value) {
//           if (value.length >= 2) {
//             _fieldFocusChange(context, _countryCodeFocusNode,
//                 _mobileNumberFocusNode);
//           }
//         },
//       ),
//     ),
//     const SizedBox(width: 10.0),
//     Expanded(
//       flex: 3,
//       child: TextField(
//         focusNode: _mobileNumberFocusNode,
//         keyboardType: TextInputType.phone,
//         textInputAction: TextInputAction.done,
//         onSubmitted: (_) {
//           _mobileNumberFocusNode.unfocus(); // Dismiss keyboard
//         },
//         decoration: const InputDecoration(
//           labelText: 'Mobile Number',
//           labelStyle: TextStyle(color: Colors.grey),
//           enabledBorder: UnderlineInputBorder(
//             borderSide: BorderSide(color: Colors.grey),
//           ),
//           focusedBorder: UnderlineInputBorder(
//             borderSide: BorderSide(color: Colors.grey),
//           ),
//         ),
//         style: const TextStyle(color: Colors.white),
//       ),
//     ),
//   ],
// ),
