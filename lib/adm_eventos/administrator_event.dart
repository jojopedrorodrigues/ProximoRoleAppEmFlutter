import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'package:proximorole/adm_eventos/add_eventos/add_eventospage.dart';

class AdministratorEvent extends StatefulWidget {
  AdministratorEvent({
    Key? key,
    required User user,
  })  : _user = user,
        super(key: key);
  final User _user;
  String? nome;

  @override
  _AdministratorEventState createState() => _AdministratorEventState();
}

class _AdministratorEventState extends State<AdministratorEvent> {
  @override
  Widget build(BuildContext context) {
    _getName() {
      if (widget._user != null) {
        setState(() {
          widget.nome = widget._user.displayName.toString();
        });
        return widget.nome;
      }
      return widget.nome;
      ;
    }

    MediaQueryData query = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        _backGroundCamada(query),
        _cabecalhoInicio(query, widget._user),
        Padding(
          padding: const EdgeInsets.only(top: 50, left: 18),
          child: SizedBox(
            width: query.size.width,
            height: 150,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _adicionarCreditoPost(widget._user),
                  const Padding(padding: EdgeInsets.only(left: 33)),
                  _adicionarEvento(widget._user, context),
                  const Padding(padding: EdgeInsets.only(left: 33)),
                  _atualizarDados(widget._user),
                  const Padding(padding: EdgeInsets.only(left: 33)),
                  _excluaEvento(widget._user)
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 170, left: 0, right: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                  padding: EdgeInsets.only(
                top: 23,
              )),
              Text(
                '  STATUS DO EVENTO PUBLICADO',
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              const Padding(padding: EdgeInsets.only(top: 8)),
              Card(
                elevation: 7,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.50),
                ),
                child: SizedBox(
                  height: 155,
                  width: query.size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(padding: EdgeInsets.only(top: 11)),
                      _nomeEvento(query),
                      const Padding(padding: EdgeInsets.only(top: 8)),
                      _viewsEvento(query),
                      const Padding(padding: EdgeInsets.only(top: 8)),
                      _shareEvento(query),
                      const Padding(padding: EdgeInsets.only(top: 8)),
                      _clientsEventosCont(query),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 13),
                  ),
                  _creditos(query)
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }
}

_creditos(MediaQueryData query) {
  return Row(
    children: [
      const Padding(padding: EdgeInsets.only(left: 2)),
      SizedBox(
        width: 120,
        height: 120,
        child: Card(
          elevation: 8,
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 11)),
              Text(
                'Creditos',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              Text(
                '0',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
      _suporte(query),
    ],
  );
}

_suporte(MediaQueryData query) {
  return SizedBox(
    height: 120,
    width: query.size.width - 125,
    child: Card(
      elevation: 7,
      child: Stack(children: [
        SizedBox.expand(
          child: Opacity(
            opacity: 0.5,
            child: FittedBox(
              fit: BoxFit.fill,
              child: SizedBox(
                width: 100,
                child: Image.asset('img/wpp.png'),
              ),
            ),
          ),
        ),
      ]),
    ),
  );
}

_nomeEvento(MediaQueryData query) {
  return SizedBox(
    width: query.size.width,
    child: Row(
      children: [
        const Padding(padding: EdgeInsets.only(left: 11)),
        Text(
          'Evento: ',
          style: const TextStyle(fontWeight: FontWeight.w800),
        ),
        Text('Mariana City '),
      ],
    ),
  );
}

_viewsEvento(MediaQueryData query) {
  return SizedBox(
    width: query.size.width,
    child: Row(
      children: [
        const Padding(padding: EdgeInsets.only(left: 11)),
        Text(
          'Pessoas que viram o evento: ',
          style: const TextStyle(fontWeight: FontWeight.w800),
        ),
        Text('0'),
      ],
    ),
  );
}

_shareEvento(MediaQueryData query) {
  return SizedBox(
    width: query.size.width,
    child: Row(
      children: [
        const Padding(padding: EdgeInsets.only(left: 11)),
        Text(
          'Compartilharam o local: ',
          style: const TextStyle(fontWeight: FontWeight.w800),
        ),
        Text('0'),
      ],
    ),
  );
}

_clientsEventosCont(MediaQueryData query) {
  return SizedBox(
    width: query.size.width,
    child: Row(
      children: [
        const Padding(padding: EdgeInsets.only(left: 11)),
        Text(
          'Possiveis clientes: ',
          style: const TextStyle(fontWeight: FontWeight.w800),
        ),
        Text('0'),
      ],
    ),
  );
}

_adicionarCreditoPost(User _user) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CircleAvatar(
        //radius: 40,
        child: SizedBox(
          height: 90,
          width: 90,
          child: ClipOval(
            child: Image.asset('img/credits.png'),
          ),
        ),
      ),
      const Text(
        'Adicione creditos',
        style: TextStyle(fontSize: 11),
      ),
    ],
  );
}

_excluaEvento(User _user) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CircleAvatar(
        //radius: 40,
        child: SizedBox(
          height: 90,
          width: 90,
          child: ClipOval(
            child: Image.asset('img/delete.png'),
          ),
        ),
      ),
      const Text(
        'Excluir Evento',
        style: TextStyle(fontSize: 11),
      ),
    ],
  );
}

_atualizarDados(User _user) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CircleAvatar(
        //radius: 40,
        child: SizedBox(
          height: 90,
          width: 90,
          child: ClipOval(
            child: Image.asset('img/atualizar.png'),
          ),
        ),
      ),
      const Text(
        'Atualizar Metricas',
        style: TextStyle(fontSize: 11),
      ),
    ],
  );
}

_adicionarEvento(User _user, BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      GestureDetector(
        child: CircleAvatar(
          //radius: 40,
          child: SizedBox(
            height: 90,
            width: 90,
            child: ClipOval(
              child: Image.asset('img/public.png'),
            ),
          ),
        ),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddEvent()));
        },
      ),
      const Text(
        'Publique eventos',
        style: TextStyle(fontSize: 11),
      ),
    ],
  );
}

_cabecalhoInicio(MediaQueryData query, User _user) {
  return SizedBox(
    width: query.size.width,
    height: 180,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
            padding: EdgeInsets.only(
          left: 3,
        )),
        Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 3.9)),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.logout_rounded,
                size: 25,
              ),
            ),
          ],
        ),
        const Padding(
            padding: EdgeInsets.only(
          left: 10,
        )),
        SizedBox(
          //width: 180,
          height: 50,
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 16)),
              Text(
                'Olá, ' + _user.displayName.toString(),
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              Text(
                'ID: ' + _user.uid,
                style: TextStyle(
                    color: Colors.black,
                    //fontWeight: FontWeight.bold,
                    fontSize: 10),
              ),
            ],
          ),
        ),
        const Padding(padding: EdgeInsets.only(left: 78)),
        Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.only(top: 9)),
            CircleAvatar(
              //radius: 40,
              child: SizedBox(
                height: 70,
                width: 70,
                child: ClipOval(
                  child: Image.network(
                    _user.photoURL.toString(),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}

_backGroundCamada(MediaQueryData query) {
  return SizedBox.expand(
    child: Opacity(
      opacity: 0.3,
      child: FittedBox(
        fit: BoxFit.fill,
        child: SizedBox(
            width: query.size.width,
            height: query.size.height,
            child: Container(
              color: Colors.white,
            )),
      ),
    ),
  );
}
