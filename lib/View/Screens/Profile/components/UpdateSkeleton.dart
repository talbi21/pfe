import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class UpdateSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          physics: BouncingScrollPhysics(),
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                child: ClipOval(
                  child: Image.asset(
                    "assets/exempleuser.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Update User Information",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Username",
                prefixIcon: Icon(Icons.account_circle_outlined,
                  color: Color.fromRGBO(12, 62, 117, 1),
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(

              decoration: InputDecoration(
                labelText: "Email",
                prefixIcon: Icon(Icons.email_outlined,
                  color: Color.fromRGBO(12, 62, 117, 1),
                ),
                border: OutlineInputBorder(),
              ),

            ),
            SizedBox(height: 10),
            TextFormField(
              obscureText: true,

              decoration: InputDecoration(
                labelText: "Old Password",
                prefixIcon: Icon(Icons.lock_outline,
                  color: Color.fromRGBO(12, 62, 117, 1),
                ),
                border: OutlineInputBorder(),
              ),

            ),
            SizedBox(height: 10),
            TextFormField(
              obscureText: true,

              decoration: InputDecoration(

                labelText: "New Password",
                prefixIcon: Icon(Icons.lock_outline,
                  color: Color.fromRGBO(12, 62, 117, 1),
                ),
                border: OutlineInputBorder(),
              ),

            ),
            SizedBox(height: 10),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Confirm Password",
                prefixIcon: Icon(Icons.lock_outline,
                  color: Color.fromRGBO(12, 62, 117, 1),
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(

                labelText: "Phone Number",
                prefixIcon: Icon(Icons.phone_outlined,
                  color: Color.fromRGBO(12, 62, 117, 1),
                ),
                border: OutlineInputBorder(),
              ),

            ),
            SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.number,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Phone Password",
                prefixIcon: Icon(Icons.lock_outline,
                  color: Color.fromRGBO(12, 62, 117, 1),
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              obscureText: true,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Confirm Phone Password",
                prefixIcon: Icon(Icons.lock_outline,
                  color: Color.fromRGBO(12, 62, 117, 1),
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),


          ],
        ),
      ),
    );
  }
}