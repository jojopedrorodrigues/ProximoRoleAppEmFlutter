import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:proximorole/main.dart';
import 'package:flutter_share/flutter_share.dart';

class Page_ extends StatefulWidget {
  String role;

  String img = 'img/senhora.gif';
  String varia = '';
  String frase = '';

  int cont = 0;
  String roledehoje = '';
  Page_({required this.role});

  @override
  _Page_State createState() => _Page_State();
}

class _Page_State extends State<Page_> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Acabei de achar nosso Role',
        text: 'Encontrei o nosso Proximo Role no Aplicativo e nos iremos ' +
            widget.roledehoje,
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Baixe o aplicativo Proximo Role voce tambem');
  }

  @override
  Widget build(BuildContext context) {
    //String a = '';
    MediaQueryData query = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          Expanded(
              child: Column(
            children: [
              _voltar(),
              const Padding(padding: EdgeInsets.only(top: 22)),
              _CardImage(query),
              const Padding(padding: EdgeInsets.only(top: 12)),
              SizedBox(
                width: query.size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(padding: EdgeInsets.only(left: 22)),
                    Text(
                      'Mariana Clubes',
                      style: GoogleFonts.openSans(
                        textStyle: const TextStyle(color: Colors.black),
                        fontSize: 27,
                        fontWeight: FontWeight.w700,
                        //fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }

  _voltar() {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      IconButton(
        icon: const Icon(Icons.arrow_back),
        color: Colors.black,
        onPressed: () {},
      )
    ]);
  }

  _CardImage(MediaQueryData query) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.9),
      ),
      child: SizedBox(
        height: 200,
        width: query.size.width - 22,
        child: Image.asset('img/amigos.png'),
      ),
    );
  }
}
