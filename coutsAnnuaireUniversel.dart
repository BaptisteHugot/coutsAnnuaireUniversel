/**
 * @file coutsAnnuaireUniversel.dart
 * @brief Calcule les coûts recouvrables pour un opérateur pour l'annuaire universel
 */

/**
 * Coûts d'investissement pour la collecte des abonnés résidentiels
 * @param nombreAbonnesResidentiels Nombre d'abonnés résidentiels
 * @return coûts d'investissement pour la collecte des abonnés résidentiels
 */
double coutsInvestissementCollecteResidentiels(int nombreAbonnesResidentiels){
  return (0.089*nombreAbonnesResidentiels);
}

/**
 * Coûts d'investissement pour la collecte des abonnés professionnels
 * @param nombreAbonnesProfessionnels Nombre d'abonnés professionnels
 * @return coûts d'investissement pour la collecte des abonnés professionnels
 */
double coutsInvestissementCollecteProfessionnels(int nombreAbonnesProfessionnels){
  return (0.893*nombreAbonnesProfessionnels);
}

/**
 * Coûts récurrents pour la collecte des abonnés résidentiels
 * @param nombreAbonnesResidentiels Nombre d'abonnés résidentiels
 * @return coûts récurrents pour la collecte des abonnés résidentiels
 */
double coutsRecurrentsCollecteResidentiels(int nombreAbonnesResidentiels){
  return (0.073*nombreAbonnesResidentiels);
}

/**
 * Coûts récurrents pour la collecte des abonnés professionnels
 * @param nombreAbonnesProfessionnels Nombre d'abonnés professionnels
 * @return coûts récurrents pour la collecte des abonnés professionnels
 */
double coutsRecurrentsCollecteProfessionnels(int nombreAbonnesProfessionnels){
  return (0.725*nombreAbonnesProfessionnels);
}

/**
 * Coûts pour la collecte des abonnés
 * @param nombreAbonnesResidentiels Nombre d'abonnés résidentiels
 * @param nombreAbonnesProfessionnels Nombre d'abonnés professionnels
 * @return coûts pour la collecte des abonnés
 */
double coutsCollecte(int nombreAbonnesResidentiels, int nombreAbonnesProfessionnels){
  return coutsInvestissementCollecteResidentiels(nombreAbonnesResidentiels)+coutsInvestissementCollecteProfessionnels(nombreAbonnesProfessionnels)+coutsRecurrentsCollecteResidentiels(nombreAbonnesResidentiels)+coutsRecurrentsCollecteProfessionnels(nombreAbonnesProfessionnels);
}

/**
 * Coûts d'investissement pour l'élaboration de la liste des abonnés
 * @param nombreAbonnesResidentiels Nombre d'abonnés résidentiels
 * @param nombreAbonnesProfessionnels Nombre d'abonnés professionnels
 * @return coûts d'investissement pour l'élaboration de la liste des abonnés
 */
double coutsInvestissementElaboration(int nombreAbonnesResidentiels, int nombreAbonnesProfessionnels){ // Modifier par une variable unique dans le main
  int nombreAbonnes = nombreAbonnesResidentiels+nombreAbonnesProfessionnels;

  if(nombreAbonnes < 10000) {
    return 0.859 * nombreAbonnes + 2711;
  }else if(nombreAbonnes < 200000) {
    return 0.182 * nombreAbonnes + 9474;
  }else if(nombreAbonnes < 2000000) {
    return 0.025 * nombreAbonnes + 41036;
  }else return 90156;
}

/**
 * Coûts récurrents pour l'élaboration de la liste des abonnés
 * @param nombreAbonnesResidentiels Nombre d'abonnés résidentiels
 * @param nombreAbonnesProfessionnels Nombre d'abonnés professionnels
 * @return coûts récurrents pour l'élaboration de la liste des abonnés
 */
double coutsRecurrentsElaboration(int nombreAbonnesResidentiels, int nombreAbonnesProfessionnels){
  int nombreAbonnes = nombreAbonnesResidentiels+nombreAbonnesProfessionnels;

  if(nombreAbonnes < 10000) {
    return 0.236 * nombreAbonnes + 712;
  }else if(nombreAbonnes < 200000) {
    return 0.091 * nombreAbonnes + 2159;
  }else if(nombreAbonnes < 2000000) {
    return 0.013 * nombreAbonnes + 17747;
  }else
    return 44059;
}

/**
 * Coûts pour l'élaboration de la liste des abonnés
 * @param nombreAbonnesResidentiels Nombre d'abonnés résidentiels
 * @param nombreAbonnesProfessionnels Nombre d'abonnés professionnels
 * @return coûts pour l'élaboration de la liste des abonnés
 */
double coutsElaboration(int nombreAbonnesResidentiels, int nombreAbonnesProfessionnels){
  return coutsInvestissementElaboration(nombreAbonnesResidentiels, nombreAbonnesProfessionnels)+coutsRecurrentsElaboration(nombreAbonnesResidentiels, nombreAbonnesProfessionnels);
}

/**
 * Coûts d'investissement pour la mise à disposition de la liste des abonnés
 * @param nombreAbonnesResidentiels Nombre d'abonnés résidentiels
 * @param nombreAbonnesProfessionnels Nombre d'abonnés professionnels
 * @return coûts d'investissement pour la mise à disposition de la liste des abonnés
 */
double coutsInvestissementDisposition(int nombreAbonnesResidentiels, int nombreAbonnesProfessionnels){ // Modifier par une variable unique dans le main
  int nombreAbonnes = nombreAbonnesResidentiels+nombreAbonnesProfessionnels;

  if(nombreAbonnes < 10000) {
    return 0.214 * nombreAbonnes + 715;
  }else if(nombreAbonnes < 200000) {
    return 0.015 * nombreAbonnes + 2708;
  }else if(nombreAbonnes < 2000000) {
    return 0.0016 * nombreAbonnes + 5400;
  }else return 8576;
}

/**
 * Coûts récurrents pour la mise à disposition de la liste des abonnés
 * @param nombreAbonnesResidentiels Nombre d'abonnés résidentiels
 * @param nombreAbonnesProfessionnels Nombre d'abonnés professionnels
 * @return coûts récurrents pour la mise à disposition de la liste des abonnés
 */
double coutsRecurrentsDisposition(int nombreAbonnesResidentiels, int nombreAbonnesProfessionnels){
  int nombreAbonnes = nombreAbonnesResidentiels+nombreAbonnesProfessionnels;

  if(nombreAbonnes < 10000) {
    return 0.148 * nombreAbonnes + 492;
  }else if(nombreAbonnes < 200000) {
    return 0.010 * nombreAbonnes + 1865;
  }else if (nombreAbonnes < 2000000) {
    return 0.0011 * nombreAbonnes + 3719;
  }else
    return 5906;
}

/**
 * Coûts pour la mise à disposition de la liste des abonnés
 * @param nombreAbonnesResidentiels Nombre d'abonnés résidentiels
 * @param nombreAbonnesProfessionnels Nombre d'abonnés professionnels
 * @return coûts pour la mise à disposition de la liste des abonnés
 */
double coutsDisposition(int nombreAbonnesResidentiels, int nombreAbonnesProfessionnels){
  return coutsInvestissementDisposition(nombreAbonnesResidentiels, nombreAbonnesProfessionnels)+coutsRecurrentsDisposition(nombreAbonnesResidentiels, nombreAbonnesProfessionnels);
}

/**
 * Coûts recouvrables pour la gestion de la liste des abonnés
 * @param nombreAbonnesResidentiels Nombre d'abonnés résidentiels
 * @param nombreAbonnesProfessionnels Nombre d'abonnés professionnels
 * @return coûts recouvrables pour la gestion de la liste des abonnés
 */
double coutsTotaux(int nombreAbonnesResidentiels, int nombreAbonnesProfessionnels){
  return coutsElaboration(nombreAbonnesResidentiels, nombreAbonnesProfessionnels) + coutsCollecte(nombreAbonnesResidentiels, nombreAbonnesProfessionnels) + coutsDisposition(nombreAbonnesResidentiels, nombreAbonnesProfessionnels);
}