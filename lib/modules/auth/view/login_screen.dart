import 'package:bluestack_assignment/modules/auth/components/bezier_container.dart';
import 'package:bluestack_assignment/modules/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "/login";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

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

    Widget _submitButton() {
      return Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: const Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xfffbb448), Color(0xfff7892b)])),
        child: const Text(
          'Login',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      );
    }

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
      body: SizedBox(
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
                top: -height * .15,
                right: -MediaQuery.of(context).size.width * .4,
                child: const BezierContainer()),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    SizedBox(
                      child: Image.asset("assets/images/gametv-logo.png"),
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                    const SizedBox(height: 50),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Email id",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Color(0xfff3f3f4),
                                filled: true),
                          )
                        ],
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Password",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Color(0xfff3f3f4),
                                filled: true),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // _submitButton(),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize:
                              Size.fromWidth(MediaQuery.of(context).size.width),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          primary: const Color(0xfff7892b)),
                      onPressed: () {
                        Navigator.of(context).pushNamed(HomeScreen.routeName);
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.centerRight,
                      child: const Text('Forgot Password ?',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                    ),
                    // _divider(),
                    // _facebookButton(),
                    // SizedBox(height: height * .055),
                    // _createAccountLabel(),
                  ],
                ),
              ),
            ),
            // Positioned(top: 40, left: 0, child: _backButton()),
          ],
        ),
      ),
    );
  }
}
