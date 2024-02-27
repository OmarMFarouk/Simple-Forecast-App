import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingStateView extends StatelessWidget {
  const LoadingStateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset("images/loading_icon.gif"),
        Text(
          "Loading...",
          style: GoogleFonts.poppins(
              fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
        )
      ]),
    );
  }
}
