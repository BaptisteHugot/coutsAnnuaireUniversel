import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

import 'coutsAnnuaireUniversel.dart';

// Fonction principale du programme
void main() => runApp(MyApp());

// Classe de départ pour afficher l'application
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = "Coûts recouvrables pour la fourniture des données pour les annuaires universels";

    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: appTitle),
    );
  }
}

// Classe Stateful pour gérer la récupération et le parsing du fichier Json
class MyHomePage extends StatefulWidget{
  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// Classe d'état pour gérer la récupération et le parsing du fichier Json
class _MyHomePageState extends State<MyHomePage> {

  /// On définit les contrôleurs de texte et de formulaire
  final inputResidentialController = TextEditingController();
  final inputProfessionalController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  int inputResidential = 0; /// Nombre d'abonnés résidentiels entré
  int inputProfessional = 0; /// Nombre d'abonnés professionnels entré
  double coutRecouvrable = 0;

  /// On initialise l'état de l'application
  void initState(){
    super.initState();
  }

  /// Lorsqu'on clique sur le bouton effacer
  void _erase(){
    setState((){
      inputResidentialController.text = "";
      inputProfessionalController.text = "";
    });
  }

  /// Lorsqu'on clique sur le bouton valider
  void _validate(){
    if(_formKey.currentState!.validate()){
      setState(() {
        inputResidential = int.parse(inputResidentialController.text);
        inputProfessional = int.parse(inputProfessionalController.text);
        coutRecouvrable = coutsTotaux(inputResidential, inputProfessional);
        _showAlertDialog(inputResidential, inputProfessional, coutRecouvrable);
      });
    }else{
    }
  }

  /// Pour afficher l'alert dialog lorsque l'utilisateur clique sur le bouton "Valider"
  Future<void> _showAlertDialog(int inputResidentiel, int inputProfessional, double coutRecouvrable) async{
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Coûts à recouvrer"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("Nombre d'abonnés résidentiel entré : " + inputResidentiel.toString()),
                Text("Nombre d'abonnés professionnel entré : " + inputProfessional.toString()),
                Text("Coût total à recouvrer : " + coutRecouvrable.toStringAsFixed(2) + "€"),
              ]
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("Fermer"),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Entrez le nombre d'abonnés résidentiels"),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: inputResidentialController,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                        labelText: "Nombre d'abonnés résidentiels"
                    ),
                    validator: (value){
                      if(value != null) {
                        if (value.isEmpty) {
                          return "Entrez le nombre d'abonnés résidentiels";
                        }
                      }
                    },
                  ),
                  SizedBox(height: 5), /// On ajoute un espacement en hauteur
                  Text("Entrez le nombre d'abonnés professionnels"),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: inputProfessionalController,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                        labelText: "Nombre d'abonnés professionnels"
                    ),
                    validator: (value) {
                      if (value != null) {
                        if (value.isEmpty) {
                          return "Entrez le nombre d'abonnés professionnels";
                        }
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: (){
                          _validate();
                        },
                        child: Text("Valider"),
                      ),
                      SizedBox(width: 5), /// On ajoute un espacement entre les 2 boutons
                      ElevatedButton(
                        onPressed: (){
                          _erase();
                        },
                        child: Text("Effacer"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),// This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
