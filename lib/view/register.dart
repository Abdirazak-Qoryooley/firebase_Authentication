import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:push_notification/controller/auth.dart';

class Register extends StatelessWidget {
  final AuthController controller = Get.put(AuthController());

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('register page'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    
                    boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      offset: Offset(0, 1),
                      blurRadius: 6,
                      spreadRadius: 0,
                    ),
                  ],
                    ),
                child: TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 12),
                      labelText: 'Email',
                      border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      offset: Offset(0, 1),
                      blurRadius: 6,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 12),
                      labelText: 'password',
                      border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                controller.signUp(
                    email: email.text.trim(), password: password.text.trim());
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Text('register',style: TextStyle(color: Colors.white,fontSize: 18),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
