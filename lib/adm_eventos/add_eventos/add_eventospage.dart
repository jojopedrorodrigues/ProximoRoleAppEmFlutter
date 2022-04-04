import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddEvent extends StatefulWidget {
  AddEvent({Key? key}) : super(key: key);

  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData query = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
          height: query.size.height,
          width: query.size.width,
          child: Column(
            children: [
              _cabecalhoBackScreen(query, context),
              const Padding(padding: EdgeInsets.only(top: 10)),
              SizedBox(
                width: query.size.width,
                height: 30,
                child: Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 22)),
                    Text(
                      "Adicionar Evento,",
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 13)),
              _cadastro_TextFields(query),
              Expanded(
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
                              'Adicionar',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

_cabecalhoBackScreen(MediaQueryData query, BuildContext context) {
  return SizedBox(
    height: 70,
    width: query.size.width,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(padding: EdgeInsets.only(left: 5)),
        IconButton(
            onPressed: () {
              Navigator.canPop(context);
            },
            icon: const Icon(Icons.arrow_back_ios))
      ],
    ),
  );
}

_cadastro_TextFields(MediaQueryData query) {
  return SizedBox(
    height: 390,
    child: Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: query.size.width - 22,
              child: TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Nome do Evento',
                  hintText: "Show no Bar Onze",
                  prefixIcon: Icon(Icons.home_work_sharp),
                  suffixIcon: Icon(
                    Icons.roundabout_left,
                    color: Colors.red,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 13)),
            SizedBox(
              width: query.size.width - 22,
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 8,
                inputFormatters: [LengthLimitingTextInputFormatter(450)],
                decoration: InputDecoration(
                  labelText: 'Descrição do Evento',
                  hintText: "Descreva o evento, horario, shows, referencia...",
                  prefixIcon: Icon(Icons.description),
                  //contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  suffixIcon: Icon(
                    Icons.arrow_back_ios_new_sharp,
                    color: Colors.red,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 13)),
            Row(
              children: [
                const Padding(padding: EdgeInsets.only(left: 13)),
                SizedBox(
                  width: query.size.width - 140,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Rua',
                      hintText: "Adicione a rua do evento",
                      prefixIcon: Icon(Icons.streetview),
                      suffixIcon: Icon(
                        Icons.roundabout_left,
                        color: Colors.red,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 5)),
                SizedBox(
                  width: 110,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelText: 'Numero',
                      hintText: "23",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 13)),
            SizedBox(
              width: query.size.width - 22,
              height: 42,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green[900], // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: () async {}, //_UpdateScreen(),
                child: const Text(
                  'Adicionar banner',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
