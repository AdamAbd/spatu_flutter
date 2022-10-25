import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:spatu_flutter/feature/feature.dart';

class BaseAuthPage extends StatefulWidget {
  BaseAuthPage({
    super.key,
    required this.title,
    required this.description,
    required this.child,
    required this.isLoginPage,
  });

  final String title;
  final String description;
  final bool isLoginPage;
  final Widget child;

  @override
  State<BaseAuthPage> createState() => _BaseAuthPageState();
}

class _BaseAuthPageState extends State<BaseAuthPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  GoogleSignInAccount? googleSignInAccount;
  GoogleSignInAuthentication? googleSignInAuthentication;
  AuthCredential? credential;
  UserCredential? user;

  Future<void> _handleSignIn() async {
    try {
      FocusUtils(context).unfocus();

      googleSignInAccount = await _googleSignIn.signIn();
      googleSignInAuthentication = await googleSignInAccount!.authentication;
      credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication?.accessToken,
        idToken: googleSignInAuthentication?.idToken,
      );

      user = await _auth.signInWithCredential(credential!);

      setState(() {});
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() async {
    try {
      FocusUtils(context).unfocus();

      await _googleSignIn.signOut();

      setState(() {});
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    final _responsive = ResponsiveUtils(context);
    // GoogleSignInAccount? user = _googleSignIn.currentUser;

    return GestureDetector(
      onTap: () => FocusUtils(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppGap.extraLarge),
              child: Column(
                children: [
                  const Gap(height: 50, width: double.infinity),
                  Image.asset(AppIcon.logo, height: 50),
                  const Gap(height: AppGap.medium),
                  Text(
                    widget.title,
                    style: AppTextStyle.medium.copyWith(
                      color: AppColors.white,
                      fontSize: _responsive
                          .getResponsiveFontSize(AppFontSize.extraLarge),
                    ),
                  ),
                  const Gap(height: AppGap.extraSmall),
                  Text(
                    widget.description,
                    style: AppTextStyle.regular.copyWith(
                      fontSize:
                          _responsive.getResponsiveFontSize(AppFontSize.medium),
                    ),
                  ),
                  const Gap(height: 50),
                  ButtonPrimary(
                    'Sign In with Google',
                    onPressed: () => _handleSignIn(),
                    width: double.infinity,
                    labelColor: AppColors.white,
                    buttonColor: Blue.secondary,
                    leading: Image.asset(
                      AppIcon.google,
                      width: AppIconSize.large,
                    ),
                    // isLoading: true,
                  ),
                  ButtonPrimary(
                    '${user?.user?.uid}',
                    onPressed: () => print(user),
                    // onPressed: () => _handleSignOut(),
                    width: double.infinity,
                    labelColor: AppColors.white,
                    buttonColor: Blue.secondary,
                    leading: Image.asset(
                      AppIcon.google,
                      width: AppIconSize.large,
                    ),
                    // isLoading: true,
                  ),
                  const Gap(height: AppGap.extraLarge),
                  Row(
                    children: [
                      const Flexible(
                        child: Divider(
                          thickness: 1,
                          endIndent: AppGap.normal,
                        ),
                      ),
                      Text(
                        'OR',
                        style: AppTextStyle.regular.copyWith(
                          fontSize: _responsive
                              .getResponsiveFontSize(AppFontSize.medium),
                        ),
                      ),
                      const Flexible(
                        child: Divider(
                          thickness: 1,
                          indent: AppGap.normal,
                        ),
                      ),
                    ],
                  ),
                  const Gap(height: AppGap.large),
                  widget.child,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.isLoginPage
                            ? 'Dont have account? '
                            : 'Already have an account? ',
                        style: AppTextStyle.light.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      Hyperlink(
                        widget.isLoginPage ? 'Sign Up' : 'Sign In',
                        onTap: () {
                          widget.isLoginPage
                              ? Navigator.pushNamed(context, PagePath.register)
                              : Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  const Gap(height: AppGap.extraLarge),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
