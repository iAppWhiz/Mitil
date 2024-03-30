import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _controllers;
  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(4, (index) => FocusNode());
    _controllers = List.generate(4, (index) => TextEditingController());
  }

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: () {
          // Dismiss keyboard when tapped outside of text fields
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "OTP",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 40.0),
                Center(
                    child: Container()
                ),
                const SizedBox(height: 60.0),
                const Text(
                  "Enter OTP",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(4, (index) {
                    return Container(
                      width: 40.0,
                      alignment: Alignment.center,
                      child: OTPTextField(
                        focusNode: _focusNodes[index],
                        controller: _controllers[index],
                        autoFocus: index == 0,
                        onChanged: (value) {
                          if (value.isNotEmpty && index < 3) {
                            FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                          } else if (value.isNotEmpty && index == 3) {
                            FocusScope.of(context).unfocus();
                          }
                        },
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 60.0),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      // Handle Resend OTP button tap
                    },
                    child: const Text(
                      "Resend OTP",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        decoration: TextDecoration.underline,

                      ),

                    ),
                  ),
                ),
                const Spacer(),
                //BUTTON SEND OTP
                SizedBox(
                  height: 52,
                  width: MediaQuery.of(context).size.width,
                  child: MaterialButton(
                    onPressed: () {},
                    color: Colors.lightGreen,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0), // Circular border radius
                    ),
                    child: const Text(
                      'Send OTP',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      );
  }
}

class OTPTextField extends StatelessWidget {
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final bool autoFocus;
  final ValueChanged<String> onChanged;

  const OTPTextField({
    Key? key,
    required this.focusNode,
    required this.controller,
    required this.autoFocus,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      controller: controller,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      maxLength: 1,
      autofocus: autoFocus,
      style: const TextStyle(color: Colors.white, fontSize: 16.0),
      decoration: const InputDecoration(
        counterText: "",
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(100, 100, 122, 122)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
      onChanged: onChanged,
    );
  }
}

