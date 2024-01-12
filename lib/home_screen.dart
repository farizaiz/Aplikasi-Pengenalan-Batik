import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:batik_app/batik_motif_grid.dart';
import 'package:batik_app/batik_motif_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final headerTitleFontStyles = TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Motif Batik Indonesia',
          style: headerTitleFontStyles,
        ),
        backgroundColor: const Color.fromARGB(174, 94, 62, 5),
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= 600) {
            return const BatikMotifList(
              itemsPerRow: 2,
            );
          } else if (constraints.maxWidth <= 1200) {
            return const BatikMotifGrid(
              gridCount: 4,
            );
          } else {
            return const BatikMotifGrid(
              gridCount: 6,
            );
          }
        },
      ),
    );
  }
}
