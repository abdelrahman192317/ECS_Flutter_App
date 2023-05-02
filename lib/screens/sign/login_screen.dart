import 'package:app2m/provider/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../home_screen.dart';
import 'log_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Consumer<MyPro>(
      builder: (ctx, val, _) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("2M"),
            leading: IconButton(
              onPressed: (){
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const LogScreen())
                );
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/images/login.svg',
                      height: size.height * 0.2,
                    ),

                    SizedBox(height: size.height * 0.1,),

                    Form(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //الاسم
                            TextFormField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(15))
                                ),
                                labelText: 'Name',
                                prefixIcon: Icon(Icons.person),
                              ),
                            ),

                            SizedBox(height: size.height * 0.02,),

                            //الباسورد
                            TextFormField(
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(15))),
                                  labelText: 'Password',
                                  prefixIcon: const Icon(Icons.lock_outline),
                                  suffixIcon: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.remove_red_eye))),
                              validator: (input) => input!.length < 6 ? '' : null,
                              obscureText: true,
                            ),

                            SizedBox(height: size.height * 0.04,),

                            //تسجيل
                            SizedBox(
                              width: size.width,
                              height: size.height * 0.08,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) => const HomeScreen())
                                  );
                                  val.login();
                                },
                                child: const Text('Log in'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
          ),
        ),
      )
    );
  }
}
