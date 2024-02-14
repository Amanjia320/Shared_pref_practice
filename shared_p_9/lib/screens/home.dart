import 'package:flutter/material.dart';
import 'package:shared_p_9/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? email;
  String age = '';

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    email = sp.getString('email') ?? '';
    age = sp.getString('age') ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.lightBlue.shade200,
          title: const Text(
            'HomePage',
            style: TextStyle(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Email',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(email.toString()),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Age',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    age.toString(),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () async {
                  // ignore: unused_local_variable
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.clear();

                  // ignore: use_build_context_synchronously
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.lightBlue.shade200,
                  child: const Center(
                    child: Text(
                      'Logout',
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
