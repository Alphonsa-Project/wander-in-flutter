import 'dart:developer';

import 'package:country_calling_code_picker/picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
// class Login extends StatelessWidget {
  final phoneCtrl = TextEditingController();
  final contryCtrl = TextEditingController();
  String? verifyId;
  ConfirmationResult? confirmRes;

  // Login({super.key});

  @override
  void initState() {
    phoneCtrl.text = '';
    contryCtrl.text = '+91';
    super.initState();
  }

  String otpCtrl = '';
  bool loading = false;
  String _selectedCountry = '+91';

  // initCountry() async {
  // final country = await getDefaultCountry(context);
  // }

  void _showCountryPicker() async {
    final country = await showCountryPickerSheet(
      context,
    );
    if (country != null) {
      setState(() {
        _selectedCountry = country.callingCode;
        contryCtrl.text = country.callingCode;
        log(_selectedCountry);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AuthFlowBuilder<PhoneAuthController>(
      listener: (oldState, newState, controller) {
        if (newState is PhoneVerified) {
          // context.push('/home');
        } else if (newState is SignedIn) {
          // context.go('/home');
        } else if (newState is UserCreated) {
          // context.go('/home');
        }
      },
      builder: (context, state, ctrl, child) {
        if (state is AwaitingPhoneNumber || state is SMSCodeRequested) {
          return

              // PhoneInput(
              //   initialCountryCode: 'US',
              //   onSubmit: (phoneNumber) {
              //     ctrl.acceptPhoneNumber(phoneNumber);
              //   },
              // );
              loading
                  ? const Loading()
                  : Scaffold(
                      resizeToAvoidBottomInset: false,
                      body: Container(
                        height: MediaQuery.of(context).size.height,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .56,
                                  child: const Text(
                                    'Enter your Mobile Number.',
                                    style: TextStyle(
                                        fontSize: 30,
                                        height: 1,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                const Gap(20),
                                Row(
                                  children: [
                                    // GestureDetector(
                                    //     onTap: () {
                                    //       // Get the list of preferred locales from the window object
                                    //       List<Locale> preferredLocales =
                                    //           window.locales;

                                    //       // Use the first locale from the list to get the country code
                                    //       if (preferredLocales != null &&
                                    //           preferredLocales.isNotEmpty) {
                                    //         String? countryCode =
                                    //             preferredLocales.first.;
                                    //         if (countryCode != null) {
                                    //           print('Country Code: $countryCode');
                                    //         } else {
                                    //           print('Country code not found');
                                    //         }
                                    //       } else {
                                    //         print('Preferred locales not found');
                                    //       }
                                    //     },
                                    //     child:
                                    GestureDetector(
                                      onTap: () {
                                        _showCountryPicker();
                                      },
                                      child: Container(
                                        height: 60,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 1),
                                          color: const Color(0xffDDE7FF),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Text(
                                            _selectedCountry,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      // width: MediaQuery.of(context).size.width * .6,
                                      child: Container(
                                        height: 60,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 1),
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: TextFormField(
                                            style: const TextStyle(
                                              height: 1,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                            controller: phoneCtrl,
                                            keyboardType: TextInputType.number,
                                            decoration: const InputDecoration(
                                              hintStyle: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black38),
                                              border: InputBorder
                                                  .none, // Remove the default border
                                              hintText: 'Mobile Number',
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 10),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          if (phoneCtrl.text.length > 5 &&
                                              contryCtrl.text.length > 1) {
                                            loading = true;

                                            ctrl.acceptPhoneNumber(
                                                "${contryCtrl.text}${phoneCtrl.text}");
                                            log('${contryCtrl.text}${phoneCtrl.text}');
                                          } else {
                                            newCustomMessage(
                                              context,
                                              'Enter phone number correctly',
                                            );
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          // side: const BorderSide(color: Colors.black, width: 2),
                                          backgroundColor:
                                              const Color(0XFF4E80EE),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 40, vertical: 5),
                                          shape: RoundedRectangleBorder(
                                            side: const BorderSide(
                                                color: Colors.transparent,
                                                width: 0),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        child: const Text('Go')
                                        // Container(
                                        //   height:
                                        //       MediaQuery.of(context).size.height *
                                        //           0.05,
                                        //   width:
                                        //       MediaQuery.of(context).size.width *
                                        //           0.05,
                                        //   // decoration: BoxDecoration(
                                        //   //   borderRadius:
                                        //   //       BorderRadius.circular(10),
                                        //   //   image: const DecorationImage(
                                        //   //     image: AssetImage(
                                        //   //       "assets/images/farrowwhite.png",
                                        //   //     ),
                                        //   //   ),
                                        //   // ),
                                        // ),
                                        ),
                                  ],
                                ),
                                const Spacer(),
                              ]),
                        ),
                      ),
                    );
        } else if (state is SMSCodeSent) {
          verifyId = state.verificationId;
          confirmRes = state.confirmationResult;

          return

//OTP ...................................................................

              Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .6,
                    child: const Text(
                      'Enter your OTP Number below.',
                      style: TextStyle(
                          fontSize: 30,
                          height: 1,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                const Gap(10),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: PinCodeTextField(
                              textStyle: const TextStyle(color: Colors.black),
                              length: 6,
                              obscureText: false,
                              animationType: AnimationType.fade,
                              pinTheme: PinTheme(
                                inactiveColor: Colors.black,
                                shape: PinCodeFieldShape.box,
                                activeColor: Colors.black,
                                disabledColor: Colors.black,
                                borderWidth: 1,
                                selectedColor: const Color(0xff4E80EE),
                                selectedFillColor: const Color(0xffDDE7FF),
                                borderRadius: BorderRadius.circular(5),
                                fieldHeight: 50,
                                fieldWidth: 40,
                                activeFillColor: Colors.black,
                              ),
                              animationDuration:
                                  const Duration(milliseconds: 300),
                              backgroundColor: Colors.white,
                              enableActiveFill: false,
                              onChanged: (value) {
                                otpCtrl = value;
                              },
                              onCompleted: (val) {
                                if (otpCtrl.length == 6) {
                                  ctrl.verifySMSCode(
                                    otpCtrl.trim(),
                                    verificationId: state.verificationId,
                                    confirmationResult:
                                        state.confirmationResult,
                                  );
                                  print(otpCtrl);
                                } else {
                                  newCustomMessage(
                                    context,
                                    'Enter OTP correctly',
                                  );
                                }
                              },
                              beforeTextPaste: (text) {
                                log("Allowing to paste $text");
                                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                return true;
                              },
                              appContext: context,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                if (otpCtrl.length == 6) {
                                  ctrl.verifySMSCode(
                                    otpCtrl.trim(),
                                    verificationId: state.verificationId,
                                    confirmationResult:
                                        state.confirmationResult,
                                  );
                                  print(otpCtrl);
                                } else {
                                  newCustomMessage(
                                    context,
                                    'Enter OTP correctly',
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                // side: const BorderSide(color: Colors.black, width: 2),
                                backgroundColor: const Color(0XFF4E80EE),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 5),
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      color: Colors.transparent, width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text('Go')
                              // Container(
                              //   height: MediaQuery.of(context).size.height * 0.05,
                              //   width: MediaQuery.of(context).size.width * 0.05,
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(10),
                              //     image: const DecorationImage(
                              //       image: AssetImage(
                              //         "assets/images/farrowwhite.png",
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              ),
                        ],
                      ),
                    ),
                  ]),
                ),
                const Gap(10),
                // Container(
                //   height: MediaQuery.of(context).size.width * .6,
                //   width: MediaQuery.of(context).size.height * .3,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(0),
                //     image: const DecorationImage(
                //       image: AssetImage("assets/images/otphand.png"),
                //     ),
                //   ),
                // ),
                // const Spacer(),
                //image section

                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.only(right: 6.0, bottom: 28),
                //       child: Container(
                //         height: MediaQuery.of(context).size.width * .15,
                //         width: MediaQuery.of(context).size.height * .2,
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(0),
                //           image: const DecorationImage(
                //             image: AssetImage("assets/images/logo.png"),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // )
              ],
            ),
          );
        } else if (state is SigningIn) {
          return const Loading();
        } else if (state is AuthFailed) {
          log(state.toString());

          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .6,
                    child: const Text(
                      'Enter your OTP Number below.',
                      style: TextStyle(
                          fontSize: 30,
                          height: 1,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                const Gap(10),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: PinCodeTextField(
                              textStyle: const TextStyle(color: Colors.black),
                              length: 6,
                              obscureText: false,
                              animationType: AnimationType.fade,
                              pinTheme: PinTheme(
                                inactiveColor: Colors.black,
                                shape: PinCodeFieldShape.box,
                                activeColor: Colors.black,
                                disabledColor: Colors.black,
                                borderWidth: 1,
                                selectedColor: const Color(0xff4E80EE),
                                selectedFillColor: const Color(0xffDDE7FF),
                                borderRadius: BorderRadius.circular(5),
                                fieldHeight: 50,
                                fieldWidth: 40,
                                activeFillColor: Colors.black,
                              ),
                              animationDuration:
                                  const Duration(milliseconds: 300),
                              backgroundColor: Colors.white,
                              enableActiveFill: false,
                              // onCompleted: (v) => setState(() => otpCtrl = v),
                              onChanged: (value) {
                                // log(value);
                                otpCtrl = value;
                                // setState(() {});
                              },
                              onCompleted: (val) {
                                if (otpCtrl.length == 6) {
                                  ctrl.verifySMSCode(
                                    otpCtrl.trim(),
                                    verificationId: verifyId,
                                    confirmationResult: confirmRes,
                                  );
                                  print(otpCtrl);
                                } else {
                                  newCustomMessage(
                                    context,
                                    'Enter OTP correctly',
                                  );
                                }
                              },
                              beforeTextPaste: (text) {
                                log("Allowing to paste $text");
                                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                return true;
                              },
                              appContext: context,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ErrorText(exception: state.exception)
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                if (otpCtrl.length == 6) {
                                  ctrl.verifySMSCode(
                                    otpCtrl.trim(),
                                    verificationId: verifyId,
                                    confirmationResult: confirmRes,
                                  );
                                  print(otpCtrl);
                                } else {
                                  newCustomMessage(
                                    context,
                                    'Enter OTP correctly',
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                // side: const BorderSide(color: Colors.black, width: 2),
                                backgroundColor: const Color(0XFF4E80EE),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 5),
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      color: Colors.transparent, width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text('Go')
                              // Container(
                              //   height: MediaQuery.of(context).size.height * 0.05,
                              //   width: MediaQuery.of(context).size.width * 0.05,
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(10),
                              //     image: const DecorationImage(
                              //       image: AssetImage(
                              //         "assets/images/farrowwhite.png",
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              ),
                        ],
                      ),
                    ),
                  ]),
                ),
                // const Gap(10),
                // Container(
                //   height: MediaQuery.of(context).size.width * .6,
                //   width: MediaQuery.of(context).size.height * .3,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(0),
                //     image: const DecorationImage(
                //       image: AssetImage("assets/images/otphand.png"),
                //     ),
                //   ),
                // ),
                // const Spacer(),
                //image section

                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     // Padding(
                //     //   padding: const EdgeInsets.only(right: 6.0, bottom: 28),
                //     //   child: Container(
                //     //     height: MediaQuery.of(context).size.width * .15,
                //     //     width: MediaQuery.of(context).size.height * .2,
                //     //     decoration: BoxDecoration(
                //     //       borderRadius: BorderRadius.circular(0),
                //     //       image: const DecorationImage(
                //     //         image: AssetImage("assets/images/logo.png"),
                //     //       ),
                //     //     ),
                //     //   ),
                //     // ),
                //   ],
                // // )
              ],
            ),
          );
        } else if (state is SignedIn) {
          return const Loading();
        } else {
          return const Loading();
        }
      },
    );
  }
}
