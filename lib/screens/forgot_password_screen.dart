import 'dart:async';

import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController _emailController = TextEditingController();
  bool _isEmailValid = false;
  bool _isLoading = false;
  bool _showConfirmation = false;

  void _onEmailChanged(String value) {
    setState(() {
      _isEmailValid = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
    });
  }

  void _onSubmit() {
    setState(() {
      _isLoading = true;
    });

    // Simulating email reset request
    Timer(Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
        _showConfirmation = true;
      });

      Timer(Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, '/login');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40.0),
                Text(
                  'Parola Sıfırlama Talebi',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _emailController,
                    onChanged: _onEmailChanged,
                    decoration: InputDecoration(
                      hintText: 'Email Adresi',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: ElevatedButton(
                    onPressed: _isEmailValid && !_isLoading ? _onSubmit : null,
                    child: _isLoading
                        ? SizedBox(
                      width: 20.0,
                      height: 20.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                        : Text('Parolamı Sıfırla'),
                  ),
                ),
                if (_showConfirmation)
                  Column(
                    children: [
                      SizedBox(height: 20.0),
                      Text(
                        'Parola sıfırlama bilgileri email adresinize gönderilmiştir',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}