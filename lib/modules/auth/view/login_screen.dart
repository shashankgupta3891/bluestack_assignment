import 'package:bluestack_assignment/core/constant/image_src_constant.dart';
import 'package:bluestack_assignment/modules/auth/components/bezier_container.dart';
import 'package:bluestack_assignment/modules/auth/controller/auth_provider.dart';
import 'package:bluestack_assignment/modules/home/view/home_screen.dart';
import 'package:bluestack_assignment/common.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

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

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    AuthProvider authProvider = context.read<AuthProvider>();

    return Scaffold(
      drawer: const HomeDrawer(),
      body: SizedBox(
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -height * .15,
              right: -width * .4,
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
                          final double widthPercentage =
                              isKeyboardVisible ? 0.27 : 0.35;
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              width: width * widthPercentage,
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
                            Text(
                              AppLocalizations.of(context)?.userId ?? "User Id",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: userIdController,
                              autofillHints: const [AutofillHints.username],
                              validator: _userIdValidationFunc,
                              onChanged: (String _) {
                                isValid.value = _getIsValid();
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
                            Text(
                              AppLocalizations.of(context)?.password ??
                                  "Password",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: passwordController,
                              autofillHints: const [AutofillHints.password],
                              obscureText: false,
                              validator: _passwordValidationFunc,
                              onChanged: (String _) {
                                isValid.value = _getIsValid();
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
                            successColor: Colors.green,
                            resetDuration: const Duration(seconds: 5),
                            child: Text(
                                AppLocalizations.of(context)?.login ?? 'Login'),
                            borderRadius: 10,
                            controller: _btnController,
                            width: MediaQuery.of(context).size.width,
                            color: Theme.of(context).primaryColor,
                            onPressed: value
                                ? () {
                                    try {
                                      authProvider.login(
                                        userId: userIdController.text,
                                        password: passwordController.text,
                                        onSuccess: _onLoginSuccess,
                                        onError: _onLoginError,
                                      );
                                    } catch (e) {
                                      _btnController.reset();
                                    }
                                  }
                                : null,
                          );
                        },
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        alignment: Alignment.centerRight,
                        child: Text(
                          AppLocalizations.of(context)?.forgetPassword ??
                              'Forgot Password ?',
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ),
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

  bool _getIsValid() {
    final int userIdLength = userIdController.text.length;
    final int paswordLength = passwordController.text.length;
    if (userIdLength <= 11 && userIdLength >= 3 && paswordLength >= 6) {
      return true;
    }

    return false;
  }

  Future<void> _onLoginSuccess() async {
    _btnController.success();
    await Future.delayed(const Duration(seconds: 2));

    Navigator.of(context)
        .pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);
  }

  void _onLoginError(String errMessage) {
    _btnController.error();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errMessage),
      ),
    );
  }

  String? _userIdValidationFunc(String? value) {
    final int length = value?.length ?? 0;

    if (length == 0) {
      return AppLocalizations.of(context)?.noTextValidation ??
          "Please Enter someting";
    }

    if (length <= 3) {
      return AppLocalizations.of(context)?.enterMoreThan(3) ??
          "Please Enter more less than 3 characters";
    }

    if (length > 11) {
      return AppLocalizations.of(context)?.enterLessThan(12) ??
          "Please Enter less than 12 characters";
    }

    return null;
  }

  String? _passwordValidationFunc(String? value) {
    final int length = value?.length ?? 0;

    if (length == 0) {
      return AppLocalizations.of(context)?.noTextValidation ??
          "Please Enter someting";
    }

    if (length <= 8) {
      return AppLocalizations.of(context)?.enterMoreThan(8) ??
          "Please Enter more less than 8 characters";
    }

    return null;
  }
}
