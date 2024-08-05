import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(SignupPage());
}

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Signup Page',
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeaderSection(),
              SignupForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Image.asset(''),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          width: double.infinity,
        ),
        Positioned(
          top: 50,
          left: 20,
          child: Row(
            children: [
              // .asset(
              //   'assets/images/brand-icon.svg',
              //   width: 150,
              // ),
    SvgPicture.asset(
    'assets/images/brand-icon.svg',
    semanticsLabel: 'My SVG Image',
    height: 150,
    ),
              SizedBox(width: 10),
              Text(
                'Block',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          right: 20,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialButton(
                  icon: FontAwesomeIcons.facebookF,
                  color: Colors.blue[800],
                  onPressed: () {},
                ),
                SocialButton(
                  icon: FontAwesomeIcons.google,
                  color: Colors.red,
                  onPressed: () {},
                ),
                SocialButton(
                  icon: FontAwesomeIcons.twitter,
                  color: Colors.blue,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SignupForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Create an Account',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Fill in the form to create an account.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 20),
          CustomTextField(
            label: 'Name',
            icon: Icons.person,
          ),
          SizedBox(height: 20),
          CustomTextField(
            label: 'Email',
            icon: Icons.email,
          ),
          SizedBox(height: 20),
          CustomTextField(
            label: 'Password',
            icon: Icons.lock,
            obscureText: true,
          ),
          SizedBox(height: 20),
          CustomTextField(
            label: 'Confirm Password',
            icon: Icons.lock_outline,
            obscureText: true,
          ),
          SizedBox(height: 30),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.blue,
              ),
              child: Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text.rich(
              TextSpan(
                text: 'Already have an account? ',
                style: TextStyle(fontSize: 16, color: Colors.grey),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Log In',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                    // Add a click event if needed
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text.rich(
              TextSpan(
                text: 'By signing up, you agree to our ',
                style: TextStyle(fontSize: 14, color: Colors.grey),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Terms & Conditions',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                    // Add a click event if needed
                  ),
                  TextSpan(
                    text: ' and ',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  TextSpan(
                    text: 'Privacy Policy.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                    // Add a click event if needed
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool obscureText;

  CustomTextField({
    required this.label,
    required this.icon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final VoidCallback onPressed;

  SocialButton({
    required this.icon,
    this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: FaIcon(icon),
      color: color,
      iconSize: 30,
      onPressed: onPressed,
    );
  }
}
