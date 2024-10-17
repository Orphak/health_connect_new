import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Connect'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<ProfileScreen>(
                  builder: (context) => ProfileScreen(
                    appBar: AppBar(
                      title: const Text('User Profile'),
                    ),
                    actions: [
                      SignedOutAction((context) {
                        Navigator.of(context).pop();
                      }),
                    ],
                    children: [
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.asset('assets/images/logo.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: const Color(0xFFC8E6C9), // Set the background color to Soft Green
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              'Welcome!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            const Divider(),
            // Grid view for feature buttons
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                padding: const EdgeInsets.symmetric(vertical: 10),
                children: [
                  _buildTileButton(
                    context,
                    'Daily Mood Logging',
                    Icons.sentiment_satisfied,
                    '/moodLogging',
                  ),
                  _buildTileButton(
                    context,
                    'Guided Meditation',
                    Icons.self_improvement,
                    '/guidedMeditation',
                  ),
                  _buildTileButton(
                    context,
                    'Access Therapists',
                    Icons.video_call,
                    '/accessTherapists',
                  ),
                  _buildTileButton(
                    context,
                    'Appointment Booking', // New feature button
                    Icons.calendar_today,
                    '/appointmentBooking',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red, // Set the button color to red
            textStyle: const TextStyle(fontSize: 18),
            minimumSize: const Size.fromHeight(50),
          ),
          child: const Text('Sign Out'),
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.pushReplacementNamed(context, '/login');
          },
        ),
      ),
    );
  }

  Widget _buildTileButton(
      BuildContext context, String title, IconData icon, String route) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 32),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
