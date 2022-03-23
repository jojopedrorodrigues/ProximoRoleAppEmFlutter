import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      },
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
    );
  }
}

String tipo = '';

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

    _controller.setLooping(true);
    _controller.play();
    if (_contador == 0) {
      setState(() {
        tipo = 'Familia';
        _contador++;
      });
    }

    super.initState();
  }

  _UpdateScreen() {
    if (_contador == 1) {
      setState(() {
        _controller = VideoPlayerController.asset('img/namoro.mp4');
        _controller.initialize().then((_) {
          setState(() {});
        });

        _controller.setLooping(true);
        _controller.play();
      });
      setState(() {
        _contador++;
        tipo = 'Namoro';
      });

      return 0;
    }
    if (_contador == 2) {
      setState(() {
        _controller = VideoPlayerController.asset('img/amigos.mp4');
        _controller.initialize().then((_) {
          setState(() {});
        });

        _controller.setLooping(true);
        _controller.play();
      });
      setState(() {
        tipo = 'Amigos';
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

        _controller.setLooping(true);
        _controller.play();
      });
      setState(() {
        tipo = 'Animal';
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

        _controller.setLooping(true);
        _controller.play();
      });
      setState(() {
        tipo = 'Familia';
        _contador++;
      });
      return 0;
    }
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
          _iconsInicio(),
          inicioLayout(query, tipo),
          const Padding(padding: EdgeInsets.only(top: 25)),
          _buttonAtualizar(query, _UpdateScreen)
        ]),
      ),
    );
  }
}

_iconsInicio() {
  return Expanded(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.horizontal_split_outlined,
              color: Colors.white,
              size: 28,
            ))
      ],
    ),
  );
}

_buttonAtualizar(MediaQueryData query, _UpdateScreen) {
  assert(query != null);
  return Expanded(
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
                onPressed: () {
                  _UpdateScreen();
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
                onPressed: () {},
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
            children: [
              const SizedBox(
                height: 70,
                child: Icon(
                  Icons.location_on_rounded,
                  size: 22,
                  color: Colors.white,
                ),
              ),
              const Text(
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

_update(String new_role, BuildContext context) {
  role = new_role;
  _new_page(context);
}

_new_page(BuildContext context) async {
  Navigator.pushNamed(context, '/segundo');
}

Widget _blocoRole(BuildContext context) {
  String new_role = 'rolegrupo';

  return GestureDetector(
    onTap: () => _update(new_role, context),
    child: Card(
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Decida o role em grupo',
              style: TextStyle(color: Colors.black, fontSize: 17.5),
            ),
          ],
        ),
      ),
      color: Colors.white,
      elevation: 2.0,
    ),
  );
}

Widget _blocoNamoro(BuildContext context) {
  const String new_role = 'rolenamoro';
  return GestureDetector(
    onTap: () => _update(new_role, context),
    child: Card(
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 141,
              child: Image.asset(
                'img/namorop.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
      color: Colors.white,
      elevation: 1.0,
    ),
  );
}

Widget _blocoFamilia(BuildContext context) {
  const String new_role = 'rolefamilia';
  return GestureDetector(
    onTap: () => _update(new_role, context),
    child: Card(
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: InkWell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 141,
                child: Image.asset(
                  'img/familiap.png',
                  fit: BoxFit.cover,
                )),
          ],
        ),
      ),
      elevation: 2.0,
    ),
  );
}

Widget _blocoAmigos(BuildContext context) {
  MediaQueryData query = MediaQuery.of(context);
  const String new_role = 'roleamigos';
  return GestureDetector(
    onTap: () => _update(new_role, context),
    child: Card(
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(2.0),
      ),
      color: Colors.red[900],
      child: SizedBox(
        height: 141,
        child: Image.asset(
          'img/amigosr.png',
          fit: BoxFit.cover,
        ),
      ),
      elevation: 1.0,
    ),
  );
}

Widget _blocoAnimal(BuildContext context) {
  const String new_role = 'roleanimal';
  return Card(
    shape: BeveledRectangleBorder(
      borderRadius: BorderRadius.circular(2.0),
    ),
    child: InkWell(
      onTap: () => _update(new_role, context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 141,
            child: Image.asset(
              'img/animalp.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    ),
    color: Colors.white,
    elevation: 1.0,
  );
}
