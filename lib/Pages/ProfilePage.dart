import 'package:flutter/material.dart';
import 'dart:async';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Center(
        child: ElevatedButton(
          child: Text('Win Certificate'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WinCertificateScreen()),
            );
          },
        ),
      ),
    );
  }
}

class WinCertificateScreen extends StatefulWidget {
  @override
  _WinCertificateScreenState createState() => _WinCertificateScreenState();
}

class _WinCertificateScreenState extends State<WinCertificateScreen> {
  final TextEditingController _answerController = TextEditingController();
  Timer? _timer;
  int _timeLeft = 30;
  bool _isTimerFinished = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        setState(() {
          _timeLeft--;
        });
      } else {
        _timer?.cancel();
        setState(() {
          _isTimerFinished = true;
        });
      }
    });
  }

  void _submitAnswer() {
    // Handle answer submission logic
    print('Submitted Answer: ${_answerController.text}');
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Win Certificate')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Tell me About Yourself?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text('Time Left: $_timeLeft seconds'),
            TextField(
              controller: _answerController,
              enabled: !_isTimerFinished,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Write your answer here...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _isTimerFinished ? _submitAnswer : null,
              child: Text('Submit Answer'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _answerController.dispose();
    super.dispose();
  }
}

// Placeholder Tabs
class CertificateTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Certificates')),
      body: Center(child: Text('Certificates Tab')),
    );
  }
}

class ChatTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat')),
      body: Center(child: Text('Chat Tab')),
    );
  }
}

class ScoreTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scores')),
      body: Center(child: Text('Scores Tab')),
    );
  }
}