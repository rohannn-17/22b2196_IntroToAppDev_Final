import 'package:flutter/material.dart';
import 'package:flutter_fcm/constants.dart';
import 'package:flutter_fcm/loading.dart';
import '../../auth.dart';

class Register extends StatefulWidget {
  final Function() toggle;
  const Register({super.key, required this.toggle});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            appBar: AppBar(
              title: const Text(
                'Create account',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.brown,
              actions: [
                TextButton.icon(
                    onPressed: () {
                      widget.toggle();
                    },
                    icon: const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
            backgroundColor: Colors.brown[100],
            body: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Center(
                  child: SizedBox(
                    width: 400,
                    child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              decoration:
                                  decorate.copyWith(hintText: 'Email ID'),
                              validator: (val) =>
                                  val!.isEmpty ? 'Enter Email Id' : null,
                              onChanged: (val) {
                                setState(() => email = val);
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              decoration:
                                  decorate.copyWith(hintText: 'Password'),
                              validator: (val) => val!.length < 6
                                  ? 'Password contain atleast 6 characters'
                                  : null,
                              obscureText: true,
                              onChanged: (val) {
                                setState(() => password = val);
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    loading = true;
                                  });
                                  dynamic result = await _auth.registerEmail(
                                      email, password);
                                  if (result == null) {
                                    setState(() {
                                      error = 'Please enter valid input';
                                      loading = false;
                                    });
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.pink[200],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  )),
                              child: const Text(
                                'Register',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              error,
                              style: const TextStyle(color: Colors.red),
                            )
                          ],
                        )),
                  ),
                )),
          );
  }
}
