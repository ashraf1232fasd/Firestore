import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/screens/profile_screen.dart';


class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseAuth = FirebaseAuth.instance;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Welcome Page')),
        backgroundColor: Colors.blue[800],
      ),
      drawer: SafeArea(
        child: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
                },
                leading: Icon(Icons.info),
                title: Text(' Profile About'),
              ),
              SizedBox(height: 20,),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
              SizedBox(height: 20,),
        
              ListTile(
                onTap: (){
                  firebaseAuth.signOut();
                },
                leading: Icon(Icons.logout),
                title: Text(' Logout'),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.blue[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Welcome text
            Text(
              'Welcome👋',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '${firebaseAuth.currentUser?.email}',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'We are happy to have you here!',
              style: TextStyle(fontSize: 18, color: Colors.grey[700],fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: () async {
                await firebaseAuth.signOut();
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[200],
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('    Logout    ', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20),),
            ),
          ],
        ),
      ),
    );
  }
}
//
// // Second page for testing
// class NextPage extends StatelessWidget {
//   const NextPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Next Page')),
//       body: const Center(
//         child: Text('This is the next page ✨', style: TextStyle(fontSize: 24)),
//       ),
//     );
//   }
// }
