import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? _selectedOption;

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kayıt ol'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Ad',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Ad alanı boş bırakılamaz';
                }
                return null;
                },
            ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: _surnameController,
            decoration: InputDecoration(
              labelText: 'Soyad',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Soyad boş bırakılamaz.';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'E-posta',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'E-posta alanı boş bırakılamaz.';
                }
                if (!value.contains('@')) {
                  return 'Geçerli bir e-posta adresi girin.';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Parola',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Parola alanı boş bırakılamaz.';
                }
                if (value.length < 6) {
                  return 'Parola en az 6 karakter olmalıdır.';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Unity veya Flutter seçin',
              ),
              value: _selectedOption,
              items: ['Unity', 'Flutter'].map((option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // form alanları doğru şekilde doldurulduğunda burası çalışır
                  String name = _nameController.text;
                  String surname = _surnameController.text;
                  String email = _emailController.text;
                  String password = _passwordController.text;
                  String? selectedOption = _selectedOption;

                  // Bu bilgileri veri tabanına kaydedebilirsiniz veya
                  // başka bir işlem yapabilirsiniz.

                  // Kayıt işlemi tamamlandıktan sonra, kullanıcıyı ana sayfaya yönlendirin:
                  Navigator.pushReplacementNamed(context, '/');
                }
              },
              child: Text('Kayıt Ol'),
            ),
          ],
        ),
      ),
    );
  }



}