import 'package:flutter/material.dart';
import 'package:sampleproject/home.dart';
import 'package:sampleproject/validation.dart';



class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

enum FormType {
  login,
  register,
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late String _email;
  late String _password;
  FormType _formType = FormType.login;
  bool _obscureText = true;
  bool validateAndSave() {
    final FormState? form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> validateAndSubmit() async {
    if (validateAndSave()) {
      Navigator.push (
        context,
        MaterialPageRoute (
          builder: (BuildContext context) =>  Home(),
        ),
      );
    }
  }

  void moveToRegister() {
    formKey.currentState?.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    formKey.currentState?.reset();
    setState(() {
      _formType = FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter login demo'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: buildInputs() + buildSubmitButtons(),
          ),
        ),
      ),
    );
  }




  List<Widget> buildInputs() {
    return <Widget>[
      TextFormField(
        key: const Key('email'),
        decoration: const InputDecoration(labelText: 'Email'),
        validator: (val) => Validations.emailValidate(val!),
        onSaved: (value) => _email = value!,
      ),
      TextFormField(
        key: const Key('password'),
        decoration: InputDecoration(
            labelText: 'Password',
            suffixIcon: IconButton(
              icon: _obscureText
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility),
              onPressed: () {

                _obscureText = !_obscureText;

                setState(() {});
              },
            )),
        obscureText: _obscureText,
        maxLength: 6,
        validator: (val) => Validations.passValidate(val!),
        onSaved: (value) => _password = value!,
      ),
    ];
  }

  List<Widget> buildSubmitButtons() {
    if (_formType == FormType.login) {
      return <Widget>[
        TextButton(
          key: const Key('signIn'),
          child: const Text('Login', style: TextStyle(fontSize: 20.0)),
          onPressed: validateAndSubmit,
        ),
        TextButton(
          child: const Text('Create an account', style: TextStyle(fontSize: 20.0)),
          onPressed: moveToRegister,
        ),
      ];
    } else {
      return <Widget>[
        TextButton(
          child: const Text('Create an account', style: TextStyle(fontSize: 20.0)),
          onPressed: validateAndSubmit,
        ),
        TextButton(
          child:
              const Text('Have an account? Login', style: TextStyle(fontSize: 20.0)),
          onPressed: moveToLogin,
        ),
      ];
    }
  }
}
