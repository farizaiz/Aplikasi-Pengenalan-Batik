import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:batik_app/model/batik_motif.dart';

import 'detail_screen.dart';

class BatikMotifList extends StatelessWidget {
  const BatikMotifList({Key? key, required this.itemsPerRow}) : super(key: key);

  final int itemsPerRow;

  @override
  Widget build(BuildContext context) {
    final titleFontStyle = TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    );

    final subTitleFontStyle = TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontSize: 14.0,
    );

    return ListView.builder(
      itemCount: (batikMotifList.length / itemsPerRow).ceil(),
      itemBuilder: (context, rowIndex) {
        return Row(
          children: List.generate(
            itemsPerRow,
            (colIndex) {
              final index = rowIndex * itemsPerRow + colIndex;

              if (index < batikMotifList.length) {
                final BatikMotif place = batikMotifList[index];

                return Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            place: place,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(place.imageAsset),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  place.name,
                                  style: titleFontStyle,
                                ),
                                Text(
                                  place.location,
                                  style: subTitleFontStyle,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return Expanded(child: Container());
              }
            },
          ),
        );
      },
    );
  }
}
