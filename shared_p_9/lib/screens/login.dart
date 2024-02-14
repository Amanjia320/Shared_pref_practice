import 'package:flutter/material.dart';
import 'package:shared_p_9/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final agecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.purple.shade100,
          title: const Text(
            'Login Form',
            style: TextStyle(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          automaticallyImplyLeading: false,
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailcontroller,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(hintText: 'Email'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: passwordcontroller,
                decoration: const InputDecoration(hintText: 'Password'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: agecontroller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'Age'),
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () async {
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.setString('email', emailcontroller.text.toString());
                  sp.setString('age', agecontroller.text.toString());
                  sp.setBool('isLogin', true);

                  // ignore: use_build_context_synchronously
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.purple.shade100,
                  child: const Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
