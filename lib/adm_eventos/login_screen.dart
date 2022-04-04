import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:proximorole/adm_eventos/administrator_event.dart';
import 'package:proximorole/adm_eventos/login_auth/authentication.dart';
import 'package:video_player/video_player.dart';
import 'login_auth/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginAdm extends StatefulWidget {
  @override
  _LoginAdmState createState() => _LoginAdmState();
}

class _LoginAdmState extends State<LoginAdm> {
  late VideoPlayerController _controller;

  String button_letra = 'Entrar com o Google';

  @override
  void initState() {
    // TODO: implement initState
    //Authentication.initializeFirebase();
    Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: "proximorole-bcf48",
          appId: "1:374956832297:android:e67031f46b079ac842ce38",
          messagingSenderId: "",
          projectId: "374956832297",
        ),
        name: 'ProximoRole');
    _controller = VideoPlayerController.asset('img/adm1.mp4');
    _controller.initialize().then((_) {
      setState(() {});
    });

    _controller.setLooping(false);
    _controller.play();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData query = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(children: [
        Opacity(
          opacity: 0.4,
          child: SizedBox.expand(
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
        Column(
          children: [
            _voltar(),
            const Padding(padding: EdgeInsets.only(top: 18)),
            _textLogo(query),
            _frase(),
            _buttonLogin(query)
          ],
        ),
      ]),
    );
  }

  _buttonLogin(MediaQueryData query) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: query.size.width - 33,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white, // background
                      onPrimary: Colors.black, // foreground
                    ),
                    onPressed: () async {
                      User? user = await Authentication.signInWithGoogle(
                          context: context);
                      if (user != null) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => AdministratorEvent(
                              user: user,
                            ),
                          ),
                        );
                      }
                    }, //_UpdateScreen(),
                    child: Text(
                      button_letra,
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                  ),
                ),
              ]),
          const Padding(padding: EdgeInsets.only(top: 24)),
        ],
      ),
    );
  }

  _textLogo(MediaQueryData query) {
    return SizedBox(
      width: query.size.width,
      child: Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }

  _page_login(BuildContext context) {
    return FutureBuilder(
        future: Authentication.initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
          } else if (snapshot.connectionState == ConnectionState.done) {}

          return Text('data');
        });
  }

  _frase() {
    return Column(
      children: [
        const Padding(padding: EdgeInsets.only(top: 22)),
        Text(
          'Engaje seu evento',
          style: GoogleFonts.openSans(
            textStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500),
            fontSize: 30,

            //fontStyle: FontStyle.italic,
          ),
        ),
        Text(
          'OFERECA A DIVERSAO',
          style: GoogleFonts.prata(
            textStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w300),
            fontSize: 22,

            //fontStyle: FontStyle.italic,
          ),
        ),
        Text(
          'E GANHE CLIENTES',
          style: GoogleFonts.prata(
            textStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w300),
            fontSize: 18,

            //fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }

  _voltar() {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      IconButton(
        icon: const Icon(Icons.arrow_back),
        color: Colors.white,
        onPressed: () {
          Navigator.pushNamed(context, "/");
        },
      )
    ]);
  }
}
