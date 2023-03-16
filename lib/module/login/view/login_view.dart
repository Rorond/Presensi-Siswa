import 'package:flutter/material.dart';
import 'package:fhe_template/core.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  Widget build(context, LoginController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 30),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Login',
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.blue[900],
                          )),
                      const SizedBox(height: 10),
                      Text('Welcome Back',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue[900],
                          ))
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 60),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.blue.shade600,
                                  blurRadius: 15,
                                  offset: const Offset(0, 10))
                            ]),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey.shade200))),
                              child: TextFormField(
                                initialValue: controller.email,
                                maxLength: 20,
                                decoration: const InputDecoration(
                                  labelText: 'Email',
                                  labelStyle: TextStyle(
                                    color: Colors.blueGrey,
                                  ),
                                  suffixIcon: Icon(
                                    Icons.email,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                ),
                                onChanged: (value) {
                                  controller.email = value;
                                },
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey.shade200))),
                              child: TextFormField(
                                initialValue: controller.password,
                                maxLength: 20,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  labelText: 'Password',
                                  labelStyle: TextStyle(
                                    color: Colors.blueGrey,
                                  ),
                                  suffixIcon: Icon(
                                    Icons.password,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                ),
                                onChanged: (value) {
                                  controller.password = value;
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      const Text('Forgot Password?',
                          style: TextStyle(color: Colors.grey)),
                      const SizedBox(height: 40),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            controller.doLogin();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[900],
                              shape: const StadiumBorder()),
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                      const SizedBox(height: 80),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<LoginView> createState() => LoginController();
}
