import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/batik_motif.dart';

class DetailWebPage extends StatefulWidget {
  final BatikMotif place;

  const DetailWebPage({Key? key, required this.place}) : super(key: key);

  @override
  State<DetailWebPage> createState() => _DetailWebPageState();
}

class _DetailWebPageState extends State<DetailWebPage> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final nameFontStyle = TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    );

    final textFontStyle = TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontSize: 14.0,
    );

    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            const SliverAppBar(
              expandedHeight: 80.0,
              floating: false,
              pinned: true,
              backgroundColor: Color.fromARGB(174, 94, 62, 5),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  'Motif Batik Indonesia',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 28.0, horizontal: 64.0),
            child: Center(
              child: SizedBox(
                width: 1200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 32.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset(widget.place.imageAsset),
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 32.0,
                        ),
                        Expanded(
                          child: Card(
                            child: Container(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Text(
                                    widget.place.name,
                                    textAlign: TextAlign.center,
                                    style: nameFontStyle,
                                  ),
                                  const SizedBox(height: 8.0),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0),
                                    child: Text(
                                      widget.place.description,
                                      textAlign: TextAlign.justify,
                                      style: textFontStyle,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
