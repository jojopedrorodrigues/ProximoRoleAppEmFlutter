import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

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

// ignore: camel_case_types
class _Page_State extends State<Page_> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    _controller = VideoPlayerController.asset('img/map.mp4');
    _controller.initialize().then((_) {
      setState(() {});
    });
    //_controller.initialize();
    _controller.setLooping(true);
    _controller.play();
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
              const Padding(padding: EdgeInsets.only(top: 13)),
              _cardImage(query),
              const Padding(padding: EdgeInsets.only(top: 12)),
              _titleEvent(query),
              const Padding(padding: EdgeInsets.only(top: 13)),
              _descriptionEvent(query),
              const Padding(padding: EdgeInsets.only(top: 15)),
              _localeTitle(query),
              const Padding(padding: EdgeInsets.only(top: 13)),
              _cardMap(query),
              const Padding(padding: EdgeInsets.only(top: 13)),
              _localizacaoAtual(query),
              _buttonAtualizar(query, context),
            ],
          )),
        ],
      ),
    );
  }

  _descriptionEvent(MediaQueryData query) {
    return SizedBox(
      width: query.size.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(padding: EdgeInsets.only(left: 22)),
                SizedBox(
                  width: query.size.width - 32,
                  child: Text(
                    'O Lorem Ipsum é um texto modelo da indústria tipográfica e de impressão. O Lorem Ipsum tem vindo a ser o texto padrão usado por estas indústrias desde o ano de 1500',
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(color: Colors.black),
                      fontSize: 18,

                      //fontStyle: FontStyle.italic,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  _titleEvent(MediaQueryData query) {
    return SizedBox(
      width: query.size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(padding: EdgeInsets.only(left: 22)),
          Text(
            'Mariana Clubes',
            style: GoogleFonts.openSans(
              textStyle: const TextStyle(color: Colors.black),
              fontSize: 26,
              fontWeight: FontWeight.w700,
              //fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  _voltar() {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      IconButton(
        icon: const Icon(Icons.arrow_back),
        color: Colors.black,
        onPressed: () {
          Navigator.pushNamed(context, "/");
        },
      )
    ]);
  }

  _localeTitle(MediaQueryData query) {
    return SizedBox(
      width: query.size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(padding: EdgeInsets.only(left: 22)),
          Text(
            'Endereço',
            style: GoogleFonts.openSans(
              textStyle: const TextStyle(color: Colors.black),
              fontSize: 27,
              fontWeight: FontWeight.w700,
              //fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  _cardMap(MediaQueryData query) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3.9),
      ),
      child: SizedBox(
        height: 120,
        width: query.size.width - 22,
        child: Stack(children: [
          SizedBox.expand(
            child: Opacity(
              opacity: 0.8,
              child: FittedBox(
                fit: BoxFit.fill,
                child: SizedBox(
                  width: _controller.value.size.width,
                  height: _controller.value.size.height,
                  child: VideoPlayer(_controller),
                ),
              ),
            ),
          ),
          SizedBox.expand(
              child: Opacity(
            opacity: 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: Row(
                    children: [
                      _iconMaps(),
                      _iconWaze(),
                      _iconZap(),
                    ],
                  ),
                ),
              ],
            ),
          )),
        ]),
      ),
    );
  }
}

_localizacaoAtual(MediaQueryData query) {
  return SizedBox(
    width: query.size.width - 22,
    child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Text(
        'Está no evento? ',
        style: GoogleFonts.openSans(
          textStyle: const TextStyle(color: Colors.black),
          fontSize: 18,
          fontWeight: FontWeight.w500,
          //fontStyle: FontStyle.italic,
        ),
      ),
      const Padding(padding: EdgeInsets.only(left: 8)),
      SizedBox(
        width: query.size.width - 124 - 44 - 3,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.black, // background
            onPrimary: Colors.white, // foreground
          ),
          onPressed: () {}, //_UpdateScreen(),
          child: const Text(
            'Localizacao atual',
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
      ),
    ]),
  );
}

_buttonAtualizar(MediaQueryData query, BuildContext context) {
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(children: [
          Center(
            child: SizedBox(
              width: query.size.width,
              height: 42,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black, // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: () async {}, //_UpdateScreen(),
                child: const Text(
                  'Hmmm... Trocar o Rolê',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ),
          ),
        ]),
      ],
    ),
  );
}

_iconZap() {
  return Padding(
    padding: const EdgeInsets.only(left: 22),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            child: SizedBox(
                width: 30, height: 30, child: Image.asset('img/whatsapp.png')),
          ),
        )
      ],
    ),
  );
}

_iconWaze() {
  return Padding(
    padding: const EdgeInsets.only(left: 22),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            child: SizedBox(
                width: 30, height: 30, child: Image.asset('img/waze.png')),
          ),
        )
      ],
    ),
  );
}

_iconMaps() {
  return Padding(
    padding: const EdgeInsets.only(left: 22),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            child: SizedBox(
                width: 30, height: 30, child: Image.asset('img/maps.png')),
          ),
        )
      ],
    ),
  );
}

_cardImage(MediaQueryData query) {
  return Card(
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0.9),
    ),
    child: SizedBox(
      height: 155,
      width: query.size.width - 22,
      child: Image.asset('img/amigos.png'),
    ),
  );
}
