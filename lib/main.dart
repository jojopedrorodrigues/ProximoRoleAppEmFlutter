import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proximorole/adm_eventos/login_screen.dart';
import 'package:video_player/video_player.dart';

import 'page_role/page.dart';

String role = 'AAA';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //COLOCAR ONLY PORTAIET NAO ESQUECEEEEE

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Proximo Role',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/segundo': (context) => Page_(role: role),
        '/admlogin': (context) => LoginAdm(),
      },
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
    );
  }
}

var tipo = '';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late VideoPlayerController _controller;
  late int _contador = 0;

  @override
  void initState() {
    _controller = VideoPlayerController.asset('img/family.mp4');
    _controller.initialize().then((_) {
      setState(() {});
    });

    _controller.setLooping(false);
    _controller.play();
    if (_contador == 0) {
      setState(() {
        role = "familia";
        tipo = 'Familia';
        _contador++;
      });
    }

    super.initState();
  }

  // ignore: non_constant_identifier_names
  Future<int> _UpdateScreen() async {
    if (_contador == 1) {
      setState(() {
        _controller = VideoPlayerController.asset('img/namoro.mp4');
        _controller.initialize().then((_) {
          setState(() {});
        });

        _controller.setLooping(false);
        _controller.play();
      });
      setState(() {
        _contador++;
        tipo = 'Crush';
        role = "namoro";
      });

      return 0;
    }
    if (_contador == 2) {
      setState(() {
        _controller = VideoPlayerController.asset('img/amigos.mp4');
        _controller.initialize().then((_) {
          setState(() {});
        });

        _controller.setLooping(false);
        _controller.play();
      });
      setState(() {
        tipo = 'Amigos';
        role = "amigos";
        _contador++;
      });
      return 0;
    }
    if (_contador == 3) {
      setState(() {
        _controller = VideoPlayerController.asset('img/animal.mp4');
        _controller.initialize().then((_) {
          setState(() {});
        });

        _controller.setLooping(false);
        _controller.play();
      });
      setState(() {
        tipo = 'Animal';
        role = "amigos";
        _contador = 0;
      });
      return 0;
    }
    if (_contador == 0) {
      setState(() {
        _controller = VideoPlayerController.asset('img/family.mp4');

        _controller.initialize().then((_) {
          setState(() {});
        });

        _controller.setLooping(false);
        _controller.play();
      });
      setState(() {
        tipo = 'Familia';
        role = "familia";
        _contador++;
      });
      return 0;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData query = MediaQuery.of(context);

    //double valor = query.size.height - 22;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: query.size.width,
        height: query.size.height,
        child: Stack(children: [
          SizedBox.expand(
            child: Opacity(
              opacity: 0.3,
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
          _iconsInicio(context),
          inicioLayout(query, tipo),
          const Padding(padding: EdgeInsets.only(top: 25)),
          _buttonAtualizar(query, _UpdateScreen, context)
        ]),
      ),
    );
  }
}

_iconsInicio(BuildContext context) {
  return Row(
    children: [
      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/admlogin');
                },
                icon: const Icon(
                  Icons.horizontal_split_outlined,
                  color: Colors.white,
                  size: 28,
                ))
          ],
        ),
      ),
    ],
  );
}

// ignore: non_constant_identifier_names
_buttonAtualizar(MediaQueryData query, UpdateScreen, BuildContext context) {
  assert(UpdateScreen != null);
  return Row(
    children: [
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(children: [
              Center(
                child: SizedBox(
                  width: query.size.width - 100,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black, // background
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: () async {
                      await UpdateScreen();
                    }, //_UpdateScreen(),
                    child: const Text(
                      'Trocar',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(left: 3)),
              Center(
                child: SizedBox(
                  width: 97,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white, // background
                      onPrimary: Colors.black, // foreground
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "/segundo");
                    },
                    child: const Icon(
                      Icons.arrow_circle_right,
                      color: Colors.black,
                      size: 22,
                    ),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    ],
  );
}

inicioLayout(MediaQueryData query, String tipo) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        width: query.size.width,
        child: const Center(
          child: Text(
            'Hoje o role vai ser com quem?',
            style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.normal),
          ),
        ),
      ),
      SizedBox(
        width: query.size.width,
        child: Center(
          child: Text(
            tipo,
            style: const TextStyle(
                fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Center(
          child: SizedBox(
        width: query.size.width,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              SizedBox(
                height: 70,
                child: Icon(
                  Icons.location_on_rounded,
                  size: 22,
                  color: Colors.white,
                ),
              ),
              Text(
                'Mariana MG',
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ]),
      )),
    ],
  );
}
