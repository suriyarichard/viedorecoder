import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viedorecoder/provider/auth_provider.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final TextEditingController phoneController = TextEditingController();

  Country selectedCountry = Country(
      countryCode: "IN",
      phoneCode: "91",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "India",
      displayName: "India",
      displayNameNoCountryCode: "IN",
      e164Key: "",
      example: '');
  final _auth = FirebaseAuth.instance;
  var verificationId = '';
  void phoneAuth(String phoneNo) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (e) {},
      codeSent: (verificationId, resendToken) {
        // this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  child: Image.asset('assets/BlackcofferLogo.png'),
                ),
                // Text("Enter your Phone number"),
                Text(
                  "Enter your phone number",
                  style: TextStyle(
                    color: Colors.blue[800],
                    fontSize: 25,
                    // fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "we will send you 4 digit verification code",
                  style: TextStyle(color: Colors.grey[800], fontSize: 18),
                ),
                // text box
                // TextFormField(
                //   controller: phoneController,
                //   decoration: InputDecoration(
                //     hintText: "Enter phone number",
                //     enabledBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(10),
                //         borderSide: BorderSide(color: Colors.black12)),
                //   ),
                // ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  // child: Padding(
                  //   padding: const EdgeInsets.only(left: 20.0),
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    controller: phoneController,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15.0),
                      hintText: "Phone number",
                      hintStyle: TextStyle(fontWeight: FontWeight.w500),
                      // : phoneController.text.length > 9 ? Container(child: Text("crr"),) : w,
                      prefixIcon: Container(
                        padding: EdgeInsets.all(15.0),
                        child: InkWell(
                          onTap: () {
                            showCountryPicker(
                                context: context,
                                countryListTheme: const CountryListThemeData(
                                    bottomSheetHeight: 500),
                                onSelect: (value) {
                                  setState(() {
                                    selectedCountry = value;
                                  });
                                });
                          },
                          child: Text(
                            "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // ),
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 90.0),
                  child: GestureDetector(
                    onTap: sendPhonenumber,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: Center(
                          child: Text(
                        'Get OTP',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void sendPhonenumber() {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    String phoneNumber = phoneController.text.trim();
    ap.signInWithPhone(context, "+${selectedCountry.phoneCode}$phoneNumber");
  }
}
