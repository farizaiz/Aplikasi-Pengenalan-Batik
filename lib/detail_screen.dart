import 'package:flutter/material.dart';
import 'package:batik_app/components/detail_mobile_page.dart';
import 'package:batik_app/components/detail_web_page.dart';
import 'package:batik_app/model/batik_motif.dart';

class DetailScreen extends StatelessWidget {
  final BatikMotif place;

  const DetailScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            return DetailWebPage(place: place);
          } else {
            return DetailMobilePage(place: place);
          }
        },
      ),
    );
  }
}
