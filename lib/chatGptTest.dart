import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class FingerprintPage extends StatefulWidget {
  @override
  _FingerprintPageState createState() => _FingerprintPageState();
}

class _FingerprintPageState extends State<FingerprintPage> {
  final _localAuthentication = LocalAuthentication();
  bool _isAuthenticated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fingerprint Authentication'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2.0,
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Icon(
                Icons.fingerprint,
                size: 64.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Touch the fingerprint sensor to authenticate',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                bool isAuthenticated = false;
                try {
                  isAuthenticated = await _localAuthentication.authenticate(
                    localizedReason: 'Authenticate to access the app',
                  );
                } on PlatformException catch (e) {
                  print('Error: $e');
                }
                setState(() {
                  _isAuthenticated = isAuthenticated;
                });
              },
              child: Text('Authenticate'),
            ),
            SizedBox(height: 16.0),
            if (_isAuthenticated)
              Text(
                'Authentication successful!',
                style: TextStyle(fontSize: 16.0, color: Colors.green),
              ),
            if (!_isAuthenticated)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (bool? value) {},
                  ),
                  SizedBox(width: 8.0),
                  Text('I am an amputee'),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
