import 'package:ai_ex/firebaseGetUser.dart';
import 'package:ai_ex/page/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0x00f7c8e0).withOpacity(1),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('AI와 운동하기', style: TextStyle(fontFamily: 'Air', fontSize: 30),),
              GestureDetector(
                onTap: ()async{
                  UserCredential as = await signInWithGoogle();
                  if (as.additionalUserInfo!.profile!['email'] !=null){
                    userEmail = as.additionalUserInfo!.profile!['email'];
                    myname = as.additionalUserInfo!.profile!['name'];
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
                  }
                  else{
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(15)
                          ),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.white,
                          margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/4, 10, MediaQuery.of(context).size.width/4, MediaQuery.of(context).size.height/2),
                          content: Text('로그인에 실패했습니다.',
                            textAlign: TextAlign.center,
                            strutStyle: const StrutStyle(
                                fontSize: 20
                            ),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20
                            ),),
                          duration: const Duration(seconds: 1),
                        )
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0x0095BDFF).withOpacity(1),
                        borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black,width: 2)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.g_mobiledata_rounded,size: 30,),
                          Text('Google Login')
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
