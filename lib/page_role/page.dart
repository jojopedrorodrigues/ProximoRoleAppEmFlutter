import 'dart:math';

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
    _imagereturn();
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

  _variavel() {
    if (widget.cont == 0) {
      _imagereturn();
      widget.roledehoje = _gerador(role);
      return widget.roledehoje;
    } else {
      setState(() {
        _imagereturn();
        widget.varia = _gerador(role);
        widget.roledehoje = widget.varia;
      });
      return widget.varia;
    }
  }

  _imagereturn() {
    setState(() {
      switch (widget.role) {
        case 'rolefamilia':
          setState(() {
            widget.img = 'img/senhora.gif';
            widget.frase = 'Pegue a sugestao da Dona Cleusa';
          });

          break;
        case 'roleanimal':
          setState(() {
            widget.img = 'img/cachorro.gif';
            widget.frase = 'AuAu! traduzido  em sugestao';
          });

          break;
        case 'rolenamoro':
        case 'roleamigos':
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //String a = '';
    MediaQueryData query = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(actions: []),
      backgroundColor: Colors.white,
      body: SizedBox(
        width: query.size.width,
        height: query.size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 20)),
              SizedBox(
                width: query.size.width,
                child: Card(
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 10.0,
                  child: Column(children: [
                    Center(
                      child: Text(
                        widget.frase,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                        width: 300,
                        height: 150,
                        child: Image.asset(widget.img)),
                    const Padding(padding: EdgeInsets.only(top: 3))
                  ]),
                ),
              ),

              //const Padding(padding: EdgeInsets.only(top: 68)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: query.size.width,
                    height: 130,
                    child: Card(
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 9.0,
                      child: Row(
                        children: [
                          const Padding(padding: EdgeInsets.only(left: 12)),
                          SizedBox(
                            width: 226,
                            child: Column(
                              children: [
                                const Padding(
                                    padding: EdgeInsets.only(top: 13)),
                                const Center(
                                  child: Text(
                                    "Voce",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const Center(
                                  child: Text(
                                    "Pode",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    _variavel(),
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(left: 66)),
                          SizedBox(
                              width: 80,
                              height: 100,
                              child: Card(
                                elevation: 15.0,
                                child: IconButton(
                                    color: Colors.green[900],
                                    enableFeedback: true,
                                    onPressed: () {
                                      _variavel();
                                      setState(() {
                                        widget.cont++;
                                      });
                                    },
                                    icon: const Icon(Icons.refresh)),
                              )),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(padding: EdgeInsets.only(top: 2)),
                      SizedBox(
                        width: query.size.width,
                        height: 130,
                        // ignore: deprecated_member_use
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/');
                          },
                          child: Card(
                              elevation: 2,
                              child: Image.asset(
                                'img/evento.png',
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(left: 1)),
                      SizedBox(
                        width: query.size.width,
                        height: 75,
                        // ignore: deprecated_member_use
                        child: Card(
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 8.0,
                          child: FlatButton(
                            autofocus: true,
                            textColor: Colors.white,
                            color: Colors.green[900],
                            onPressed: () async {
                              await share();
                              // Share.share('Hoje e dia de' + widget.roledehoje);
                            },
                            child: const Text('COMPARTILHE O ROLE DE HOJE'),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 100, //ANUNCIO
                        width: query.size.width,
                      ),
                      SizedBox(
                        width: 200,
                        height: 80,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          autofocus: true,
                          textColor: Colors.white,
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pushNamed(context, '/');
                          },
                          child: const Text(
                            'Voltar',
                            style: TextStyle(color: Colors.black, fontSize: 22),
                          ),
                        ),
                      ),
                      //const Padding(padding: EdgeInsets.only(top: 52)),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _geradorFamilia() {
    int index = 0;
    var random = Random();
    List<String> lista = [
      'Ir ao parque em familia',
      'Jogar Uno com a familia',
      'Ver um filme de comedia',
      'Ver filme de Terror',
      'Andar de bicicleta',
      'Caminhar em familia',
      'Ir em alguma cachoeira',
      'Fazer churrasco',
      'Meditar em familia',
    ];
    index = random.nextInt(lista.length);

    return lista[index];
  }

  _gerador(String role) {
    switch (role) {
      case 'rolefamilia':
        return _geradorFamilia();
      case 'roleanimal':
        return _geradorFamilia();
      case 'rolenamoro':
      case 'roleamigos':
    }
  }
}
