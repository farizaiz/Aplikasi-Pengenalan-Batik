import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/batik_motif.dart';

class DetailMobilePage extends StatelessWidget {
  final BatikMotif place;

  const DetailMobilePage({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    final titleFontStyle = TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontSize: 26.0,
      fontWeight: FontWeight.bold,
    );

    final textFontStyle = TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontSize: 16.0,
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(place.imageAsset),
                SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: Text(
                place.name,
                textAlign: TextAlign.center,
                style: titleFontStyle,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                place.description,
                textAlign: TextAlign.start,
                style: textFontStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
