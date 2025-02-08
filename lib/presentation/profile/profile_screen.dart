import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool allowFaceID = true;
  bool incognitoMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My account"), centerTitle: true,),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildProfileHeader(),
          SizedBox(height: 20),
          _buildPersonalInfoSection(),
          SizedBox(height: 10),
          _buildSettingsSection(),
          _buildOtherSettingsSection(),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(
                  "https://cdn2.iconfinder.com/data/icons/circle-avatars-1/128/050_girl_avatar_profile_woman_suit_student_officer-512.png"), // Replace with actual image
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                radius: 14,
                backgroundColor: Colors.white,
                child: Icon(Icons.edit, size: 16),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Text("Babatunde Yusuf",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildPersonalInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Personal info",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ListTile(
          leading: Icon(Icons.person),
          title: Text("Your name"),
          subtitle: Text("Babatunde Yusuf"),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
        ),
        ListTile(
          leading: Icon(Icons.phone),
          title: Text("Phone number"),
          subtitle: Text("+234 097-123-0123"),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
        ),
        ListTile(
          leading: Icon(Icons.email),
          title: Text("Email address"),
          subtitle: Text("bjyusuf@myexample.com"),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
        ),
      ],
    );
  }

  Widget _buildSettingsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Settings",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SwitchListTile(
          title: Text("Allow Face ID"),
          subtitle: Text("Use Face ID to enter into the app"),
          value: allowFaceID,
          onChanged: (value) => setState(() => allowFaceID = value),
          secondary: Icon(Icons.face),
        ),
        SwitchListTile(
          title: Text("Incognito mode"),
          subtitle: Text("The balance will be hidden"),
          value: incognitoMode,
          onChanged: (value) => setState(() => incognitoMode = value),
          secondary: Icon(Icons.visibility_off),
        ),
      ],
    );
  }

  Widget _buildOtherSettingsSection() {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.lock),
          title: Text("Code to enter into the app"),
          subtitle: Text("Change entrance code"),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
        ),
        ListTile(
          leading: Icon(Icons.language),
          title: Text("Language"),
          subtitle: Text("English"),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
        ),
      ],
    );
  }
}
