import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:viedorecoder/provider/auth_provider.dart';
import 'package:viedorecoder/screen/user.dart';
import 'package:viedorecoder/utils/utils.dart';
import 'package:viedorecoder/widgets/custom_button.dart';

class otpScreen extends StatefulWidget {
  final String verificationId;
  const otpScreen({super.key, required this.verificationId});

  @override
  State<otpScreen> createState() => _otpScreenState();
}

class _otpScreenState extends State<otpScreen> {
  String? otpCode;
  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;
    return Scaffold(
      body: SafeArea(
        child: isLoading == true
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: const Icon(Icons.arrow_back),
                        ),
                      ),
                      Container(
                        height: 200,
                        width: 300,
                        // width: 300,
                        child: Image.asset('assets/BlackcofferLogo.png'),
                      ),
                      Text(
                        "Verification",
                        style: TextStyle(
                            color: Colors.blue[800],
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Enter the OTP sent to your Phone number",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Pinput(
                      //   length: 6,
                      //   showCursor: true,
                      //   defaultPinTheme: PinTheme(
                      //     width: 60,
                      //     height: 60,
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(10),
                      //       border: Border.all(
                      //         color: Colors.purple.shade200,
                      //       ),
                      //     ),
                      //     textStyle: const TextStyle(
                      //       fontSize: 20,
                      //       fontWeight: FontWeight.w600,
                      //     ),
                      //   ),
                      //   onCompleted: (value) {
                      //     setState(() {
                      //       otpCode = value;
                      //     });
                      //   },
                      // ),
                      Pinput(
                          length: 6,
                          showCursor: true,
                          defaultPinTheme: PinTheme(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black38),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            textStyle: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          onCompleted: (value) {
                            setState(
                              () {
                                otpCode = value;
                              },
                            );
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      // SizedBox(
                      //   width: MediaQuery.of(context).size.width,
                      //   height: 50,
                      //   child: CustomButton(
                      //     text: "Verify",
                      //     onPressed: () {
                      //       if (otpCode != null) {
                      //         verifyOtp(context, otpCode!);
                      //       } else {
                      //         showSnackBar(context, "Enter 6-Digit code");
                      //       }
                      //     },
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 90.0),
                        child: GestureDetector(
                          onTap: () {
                            if (otpCode != null) {
                              verifyOtp(context, otpCode!);
                            } else {
                              showSnackBar(context, "Enter 6-Digit code");
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(28),
                            ),
                            child: Center(
                                child: Text(
                              'Get Started',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            )),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Did not get OTP, Resend?",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black38),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  void verifyOtp(BuildContext context, String userOtp) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    ap.verifyOtp(
        context: context,
        verificationId: widget.verificationId,
        userOtp: userOtp,
        onSuccess: () {
          //
          ap.checkExistingUser().then((value) async {
            if (value == true) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const userScreen()),
                (route) => false,
              );
            }
          });
        });
  }
}
