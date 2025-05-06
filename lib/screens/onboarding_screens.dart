import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LanguageScreen()),
      );
    });

    return Scaffold(
      body: Center(

        child: Image.asset(
          'assets/images/cat_logo.png',
          width: 150,
          height: 150,
          fit: BoxFit.contain,
        ),


      ),
    );
  }
}

class LanguageScreen extends StatefulWidget {
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String selectedLang = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            SizedBox(height: 60),
            Center(
              child: Text(
                'Choose your language',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedLang = 'English';
                });
              },
              child: LanguageCard(
                flagEmoji: '🇺🇸',
                language: 'English',
                selected: selectedLang == 'English',
              ),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedLang = 'العربية';
                });
              },
              child: LanguageCard(
                flagEmoji: '🇪🇬',
                language: 'العربية',
                selected: selectedLang == 'العربية',
              ),
            ),
            SizedBox(height: 30),
            Text(
              'You can change it later from settings',
              style: TextStyle(color: Colors.grey),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => RoleScreen())),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageCard extends StatelessWidget {
  final String flagEmoji;
  final String language;
  final bool selected;

  const LanguageCard({
    Key? key,
    required this.flagEmoji,
    required this.language,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      decoration: BoxDecoration(
        color: selected ? Colors.white : Colors.grey.shade100,
        border: Border.all(color: selected ? Colors.blue : Colors.grey.shade300, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text(flagEmoji, style: TextStyle(fontSize: 24)),
          SizedBox(width: 12),
          Text(language, style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}


class RoleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            Center(child: Text('Choose Your Role', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
            SizedBox(height: 10),
            Center(child: Text("Let us know how you'll be using the platform.")),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RoleCard(title: 'Designer', icon: Icons.draw, selected: true),
                RoleCard(title: 'Client', icon: Icons.person, selected: false),
              ],
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PhoneScreen())),
                child: Text('Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoleCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool selected;

  const RoleCard({required this.title, required this.icon, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: selected ? Colors.blue.shade50 : Colors.white,
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Icon(icon, size: 40),
          SizedBox(height: 10),
          Text(title),
        ],
      ),
    );
  }
}

class PhoneScreen extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text('Create Your Account', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            Center(child: Text('Join the community of designers and clients.')),
            SizedBox(height: 20),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone),
                hintText: 'Phone number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => OtpScreen())),
              child: Text('Send OTP'),
            ),
            SizedBox(height: 10),
            Center(child: Text("Already have an account? Log in", style: TextStyle(color: Colors.blue))),
          ],
        ),
      ),
    );
  }
}

class OtpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text('Verify Identity', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            Center(child: Text('Enter the 4-digit code sent to your phone number.')),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) => SizedBox(
                width: 50,
                child: TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  decoration: InputDecoration(
                    counterText: '',
                    border: OutlineInputBorder(),
                  ),
                ),
              )),
            ),
            SizedBox(height: 10),
            Center(child: Text("Didn't receive the code? Resend", style: TextStyle(color: Colors.blue, fontSize: 12))),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => FinalSignUpScreen())),
              child: Text('Verify'),
            ),
          ],
        ),
      ),
    );
  }
}

class FinalSignUpScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text('Create Your Account', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            Center(child: Text('Join the community of designers and clients.')),
            SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                hintText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                suffixIcon: Icon(Icons.visibility_off),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Confirm password',
                suffixIcon: Icon(Icons.visibility_off),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Create Account'),
            ),
            SizedBox(height: 10),
            Center(child: Text("Already have an account? Log in", style: TextStyle(color: Colors.blue))),
          ],
        ),
      ),
    );
  }
}
