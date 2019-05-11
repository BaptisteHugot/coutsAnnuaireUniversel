/**
 * @file main.dart
 * @brief Exemple d'application utilisant Flutter
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'coutsAnnuaireUniversel.dart';

/**
 * Fonction principale du programme
 */
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Home()
    );
  }
}

class Home extends StatelessWidget {
  TextEditingController controleurNombreAbonnesResidentiels = TextEditingController();
  TextEditingController controleurNombreAbonnesProfessionnels = TextEditingController();

  /**
   * Fonction servant à afficher une fenêtre d'alerte
   * @param context Contexte
   * @param message Le message qui sera affiché dans la fenêtre d'alerte
   */
  Future showAlert(BuildContext context, String message) async {
    return showDialog(
        context: context,
        builder: (_) => new AlertDialog(
          title: new Text(message),
          actions: <Widget>[
            new FlatButton(onPressed: () => Navigator.pop(context), child: new Text('OK'))
          ],
        )

    );
  }

  /**
   * Fonction exécutée lorsque l'utilisateur clique sur le bouton "Vérifiez"
   * @return la phrase qui sera affichée à l'utilisateur dans la fenêtre d'alerte
   */
  String actionVerification() {
    String nombreAbonnesResidentielsTemporaire = controleurNombreAbonnesResidentiels.text;
    String nombreAbonnesProfessionnelsTemporaire = controleurNombreAbonnesProfessionnels.text;

    int nombreAbonnesResidentiels = 0;
    int nombreAbonnesProfessionnels = 0;

    if(!nombreAbonnesResidentielsTemporaire.isEmpty){
      nombreAbonnesResidentiels = int.parse(nombreAbonnesResidentielsTemporaire);
    }else if(!nombreAbonnesProfessionnelsTemporaire.isEmpty){
      nombreAbonnesProfessionnels = int.parse(nombreAbonnesProfessionnelsTemporaire);
    }

    return "Les coûts totaux à recouvrer sont de "+coutsTotaux(nombreAbonnesResidentiels,nombreAbonnesProfessionnels).toStringAsFixed(2)+" €.";
  }

  /**
   * Fonction exécutée lorsque l'utilisateur clique sur le bouton "Effacez"
   */
  void actionEffacement() {
    controleurNombreAbonnesResidentiels.text = '';
    controleurNombreAbonnesProfessionnels.text = '';
  }

  /**
   * Définit le widget qui sera affiché
   * @param context Contexte
   */
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coûts de l\'annuaire universel',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Coûts de l\'annuaire universel'),
        ),
        body: Center(
          child: Column(

            children: [
              Text('Entrez le nombre d\'abonnés résidentiels :'),
              TextField(controller: controleurNombreAbonnesResidentiels,
                maxLength: 10,
                inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Nombre d\'abonnés résidentiels'
                ),
                onChanged: (v) => controleurNombreAbonnesResidentiels.text = v,),
              Text('Entrez le nombre d\'abonnés professionnels :'),
              TextField(controller: controleurNombreAbonnesProfessionnels,
                maxLength: 10,
                inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Nombre d\'abonnés professionnels'
                ),
                onChanged: (v) => controleurNombreAbonnesProfessionnels.text = v,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    onPressed: () => showAlert(context, actionVerification()),
                    child: const Text('Vérifiez'),
                  ),
                  RaisedButton(
                    onPressed: () => actionEffacement(),
                    child: const Text('Effacez'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}