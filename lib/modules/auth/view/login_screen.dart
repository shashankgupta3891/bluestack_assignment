import 'package:bluestack_assignment/core/constant/image_src_constant.dart';
import 'package:bluestack_assignment/modules/auth/components/bezier_container.dart';
import 'package:bluestack_assignment/modules/auth/controller/auth_provider.dart';
import 'package:bluestack_assignment/modules/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import 'drawer/drawer.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "/login";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  final userIdController = TextEditingController();

  final passwordController = TextEditingController();

  final ValueNotifier<bool> isValid = ValueNotifier<bool>(false);

  bool getIsValid() {
    final int userIdLength = userIdController.text.length;
    final int paswordLength = passwordController.text.length;
    if (userIdLength <= 11 && userIdLength >= 3 && paswordLength >= 6) {
      return true;
    }

    return false;
  }

  Future<void> onLoginSuccess() async {
    _btnController.success();
    await Future.delayed(const Duration(seconds: 2));

    Navigator.of(context)
        .pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);
  }

  void onLoginError(String errMessage) {
    _btnController.error();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errMessage),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    AuthProvider authProvider = context.read<AuthProvider>();

    // final ValueNotifier<bool> isValid = ValueNotifier(false);

    // Widget _backButton() {
    //   return InkWell(
    //     onTap: () {
    //       Navigator.pop(context);
    //     },
    //     child: Container(
    //       padding: const EdgeInsets.symmetric(horizontal: 10),
    //       child: Row(
    //         children: <Widget>[
    //           Container(
    //             padding: const EdgeInsets.only(left: 0, top: 10, bottom: 10),
    //             child:
    //                 const Icon(Icons.keyboard_arrow_left, color: Colors.black),
    //           ),
    //           const Text('Back',
    //               style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
    //         ],
    //       ),
    //     ),
    //   );
    // }

    // Widget _entryField(String title, {bool isPassword = false}) {
    //   return Container(
    //     margin: const EdgeInsets.symmetric(vertical: 10),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: <Widget>[
    //         Text(
    //           title,
    //           style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
    //         ),
    //         const SizedBox(
    //           height: 10,
    //         ),
    //         TextField(
    //           obscureText: isPassword,
    //           decoration: const InputDecoration(
    //               border: InputBorder.none,
    //               fillColor: Color(0xfff3f3f4),
    //               filled: true),
    //         )
    //       ],
    //     ),
    //   );
    // }

    // Widget _divider() {
    //   return Container(
    //     margin: const EdgeInsets.symmetric(vertical: 10),
    //     child: Row(
    //       children: const <Widget>[
    //         SizedBox(
    //           width: 20,
    //         ),
    //         Expanded(
    //           child: Padding(
    //             padding: EdgeInsets.symmetric(horizontal: 10),
    //             child: Divider(
    //               thickness: 1,
    //             ),
    //           ),
    //         ),
    //         Text('or'),
    //         Expanded(
    //           child: Padding(
    //             padding: EdgeInsets.symmetric(horizontal: 10),
    //             child: Divider(
    //               thickness: 1,
    //             ),
    //           ),
    //         ),
    //         SizedBox(
    //           width: 20,
    //         ),
    //       ],
    //     ),
    //   );
    // }

    // Widget _facebookButton() {
    //   return Container(
    //     height: 50,
    //     margin: const EdgeInsets.symmetric(vertical: 20),
    //     decoration: const BoxDecoration(
    //       borderRadius: BorderRadius.all(Radius.circular(10)),
    //     ),
    //     child: Row(
    //       children: <Widget>[
    //         Expanded(
    //           flex: 1,
    //           child: Container(
    //             decoration: const BoxDecoration(
    //               color: Color(0xff1959a9),
    //               borderRadius: BorderRadius.only(
    //                   bottomLeft: Radius.circular(5),
    //                   topLeft: Radius.circular(5)),
    //             ),
    //             alignment: Alignment.center,
    //             child: const Text('f',
    //                 style: TextStyle(
    //                     color: Colors.white,
    //                     fontSize: 25,
    //                     fontWeight: FontWeight.w400)),
    //           ),
    //         ),
    //         Expanded(
    //           flex: 5,
    //           child: Container(
    //             decoration: const BoxDecoration(
    //               color: Color(0xff2872ba),
    //               borderRadius: BorderRadius.only(
    //                   bottomRight: Radius.circular(5),
    //                   topRight: Radius.circular(5)),
    //             ),
    //             alignment: Alignment.center,
    //             child: const Text('Log in with Facebook',
    //                 style: TextStyle(
    //                     color: Colors.white,
    //                     fontSize: 18,
    //                     fontWeight: FontWeight.w400)),
    //           ),
    //         ),
    //       ],
    //     ),
    //   );
    // }

    // Widget _createAccountLabel() {
    //   return InkWell(
    //     onTap: () {
    //       // Navigator.push(
    //       //     context, MaterialPageRoute(builder: (context) => SignUpPage()));
    //     },
    //     child: Container(
    //       margin: const EdgeInsets.symmetric(vertical: 20),
    //       padding: const EdgeInsets.all(15),
    //       alignment: Alignment.bottomCenter,
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: const <Widget>[
    //           Text(
    //             'Don\'t have an account ?',
    //             style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
    //           ),
    //           SizedBox(
    //             width: 10,
    //           ),
    //           Text(
    //             'Register',
    //             style: TextStyle(
    //                 color: Color(0xfff79c4f),
    //                 fontSize: 13,
    //                 fontWeight: FontWeight.w600),
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
    // }

    // Widget _title() {
    //   return RichText(
    //     textAlign: TextAlign.center,
    //     text: TextSpan(
    //         text: 'd',
    //         style: GoogleFonts.portLligatSans(
    //           textStyle: Theme.of(context).textTheme.headline1,
    //           fontSize: 30,
    //           fontWeight: FontWeight.w700,
    //           color: const Color(0xffe46b10),
    //         ),
    //         children: const [
    //           TextSpan(
    //             text: 'ev',
    //             style: TextStyle(color: Colors.black, fontSize: 30),
    //           ),
    //           TextSpan(
    //             text: 'rnz',
    //             style: TextStyle(color: Color(0xffe46b10), fontSize: 30),
    //           ),
    //         ]),
    //   );
    // }

    // Widget _emailPasswordWidget() {
    //   return Column(
    //     children: <Widget>[
    //       _entryField("Email id"),
    //       _entryField("Password", isPassword: true),
    //     ],
    //   );
    // }

    return Scaffold(
      drawer: const HomeDrawer(),
      body: SizedBox(
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: const BezierContainer(),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: AutofillGroup(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: height * .2),

                      KeyboardVisibilityBuilder(
                        builder: (context, isKeyboardVisible) {
                          final double widthSize =
                              isKeyboardVisible ? 0.27 : 0.35;
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              width:
                                  MediaQuery.of(context).size.width * widthSize,
                              child: Image.asset(KImageConstant.companyLogo),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 50),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "User Id",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: userIdController,
                              autofillHints: const [AutofillHints.username],
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                fillColor: Color(0xfff3f3f4),
                                filled: true,
                              ),
                              validator: (String? value) {
                                final int length = value?.length ?? 0;

                                if (length == 0) {
                                  return "Please Enter someting";
                                }

                                if (length <= 3) {
                                  return "Please Enter more then 3 characters";
                                }

                                if (length > 11) {
                                  return "Please Enter less then 12 characters";
                                }

                                return null;
                              },
                              onChanged: (String _) {
                                isValid.value = getIsValid();
                              },
                            )
                          ],
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Password",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: passwordController,
                              autofillHints: const [AutofillHints.password],
                              obscureText: false,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                fillColor: Color(0xfff3f3f4),
                                filled: true,
                              ),
                              validator: (String? value) {
                                final int length = value?.length ?? 0;

                                if (length == 0) {
                                  return "Please Enter someting";
                                }

                                if (length <= 8) {
                                  return "Please Enter more then 8 characters";
                                }

                                // if (length > 11) {
                                //   return "Please Enter more less then 12 characters";
                                // }

                                return null;
                              },
                              onChanged: (String _) {
                                isValid.value = getIsValid();
                              },
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      ValueListenableBuilder<bool>(
                          valueListenable: isValid,
                          builder: (context, value, _) {
                            return RoundedLoadingButton(
                              resetAfterDuration: true,
                              resetDuration: const Duration(seconds: 5),
                              child: const Text('Login'),
                              borderRadius: 10,
                              controller: _btnController,
                              width: MediaQuery.of(context).size.width,
                              color: const Color(0xfff7892b),
                              onPressed: value
                                  ? () {
                                      try {
                                        authProvider.login(
                                          userId: userIdController.text,
                                          password: passwordController.text,
                                          onSuccess: onLoginSuccess,
                                          onError: onLoginError,
                                        );
                                      } catch (e) {
                                        _btnController.reset();
                                      }
                                    }
                                  : null,
                            );
                          }),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        alignment: Alignment.centerRight,
                        child: const Text(
                          'Forgot Password ?',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ),
                      // _divider(),
                      // _facebookButton(),
                      // SizedBox(height: height * .055),
                      // _createAccountLabel(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
