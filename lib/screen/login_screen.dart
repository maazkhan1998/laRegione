import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:laregione/networking/api_response.dart';
import 'package:laregione/webServices/bloc/authBloc.dart';
import 'package:laregione/webServices/models/loginModel.dart';
import 'package:laregione/webServices/webServicesConstant.dart';
import '../utils/AppTheme.dart';
import 'reset_password_screen.dart';
import 'register_screen.dart';
import 'home_screen.dart';
import '../utils/SizeConfig.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ThemeData themeData;

  AuthBloc _bloc;

  @override
  void initState() {
    _bloc=AuthBloc();
    super.initState();
  }

  TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();

  Container get loginButton{
    return Container(
                      margin: EdgeInsets.only(
                          left: MySize.size24,
                          right: MySize.size24,
                          top: MySize.size36),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(MySize.size48)),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  themeData.colorScheme.primary.withAlpha(100),
                              blurRadius: 5,
                              offset:
                                  Offset(0, 5), // changes position of shadow
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all(Spacing.xy(16, 0))),
                          onPressed: () {
                            if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(emailController.text))
                            return Fluttertoast.showToast(msg: 'Invalid email');
                            if(passController.text.length<6) return Fluttertoast.showToast(msg: 'Password length must be atleast 6');
                            _bloc.loginUser(emailController.text, passController.text);
                          },
                          child: Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.center,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "CONTINUE",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText2,
                                      color: themeData.colorScheme.onPrimary,
                                      letterSpacing: 0.8,
                                      fontWeight: 700),
                                ),
                              ),
                              Positioned(
                                right: 16,
                                child: ClipOval(
                                  child: Container(
                                    color: themeData.colorScheme.primaryVariant,
                                    // button color
                                    child: SizedBox(
                                        width: MySize.size30,
                                        height: MySize.size30,
                                        child: Icon(
                                          MdiIcons.arrowRight,
                                          color:
                                              themeData.colorScheme.onPrimary,
                                          size: MySize.size18,
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ));
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(top: MySize.size48),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(
                          left: MySize.size16, right: MySize.size16),
                      child: Center(
                        child: Text(
                          "Log In",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.headline5,
                              fontWeight: 700),
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.only(
                        left: MySize.size48,
                        right: MySize.size48,
                        top: MySize.size40),
                    child: Text(
                      "Enter your login details to access your account",
                      softWrap: true,
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText1,
                          fontWeight: 500,
                          height: 1.2,
                          color: themeData.colorScheme.onBackground
                              .withAlpha(200)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: MySize.size24,
                        right: MySize.size24,
                        top: MySize.size36),
                    child: Container(
                      decoration: new BoxDecoration(
                          color: themeData.cardTheme.color,
                          borderRadius:
                              BorderRadius.all(Radius.circular(MySize.size16)),
                          boxShadow: [
                            BoxShadow(blurRadius: 8.0, offset: Offset(0, 3)),
                          ]),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText1,
                                fontWeight: 600,
                                letterSpacing: 0.2),
                            decoration: InputDecoration(
                              hintStyle: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText1,
                                  fontWeight: 500,
                                  letterSpacing: 0,
                                  color: themeData.colorScheme.onBackground
                                      .withAlpha(180)),
                              hintText: "Email Address",
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.all(MySize.size16),
                            ),
                            autofocus: false,
                            keyboardType: TextInputType.emailAddress,
                            controller:emailController
                          ),
                          Divider(
                            color: themeData.dividerColor,
                            height: 0.5,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: TextFormField(
                                  controller: passController,
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText1,
                                      fontWeight: 600,
                                      letterSpacing: 0.2),
                                  decoration: InputDecoration(
                                    hintStyle: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText1,
                                        fontWeight: 500,
                                        letterSpacing: 0,
                                        color: themeData
                                            .colorScheme.onBackground
                                            .withAlpha(180)),
                                    hintText: "Your Password",
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    isDense: true,
                                    contentPadding:
                                        EdgeInsets.all(MySize.size16),
                                  ),
                                  autofocus: false,
                                  textInputAction: TextInputAction.search,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  obscureText: true,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ResetPasswordScreen()));
                                },
                                child: Text("FORGOT",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText2,
                                        letterSpacing: 0.5,
                                        color: themeData
                                            .colorScheme.onBackground
                                            .withAlpha(140),
                                        fontWeight: 700)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  StreamBuilder<ApiResponse<LoginResponse>>(
                    stream: _bloc.loginStream,
                    builder: (context,snapshot){
                      if (snapshot.hasData) {
                          if (!snapshot.data.isConsumed) {
                            snapshot.data.isConsumed = true;
                            switch (snapshot.data?.apiStatus) {
                              case Status.LOADING:
                                return buildLoader;
                                break;
                              case Status.COMPLETED:
                                Future.delayed(Duration.zero, () {
                                  token=snapshot.data.data.meta.token;
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                    builder: (_)=>HomeScreen()
                                  ));
                                });

                                return loginButton;
                                break;
                              case Status.ERROR:
                                Fluttertoast.showToast(
                                    msg: snapshot.data.message);
                                return loginButton;
                                break;
                            }
                          }
                        }
                        return loginButton;
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: MySize.size16),
                      child: Center(
                        child: Text(
                          "I haven't an account",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

CircularProgressIndicator get buildLoader {
    return CircularProgressIndicator(
      backgroundColor: Colors.white,
    );
  }
