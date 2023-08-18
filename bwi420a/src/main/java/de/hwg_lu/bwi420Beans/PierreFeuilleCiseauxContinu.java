package de.hwg_lu.bwi420Beans;

import java.util.Scanner;
import java.util.Random;

public class PierreFeuilleCiseauxContinu {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		Random random = new Random();

		System.out.println("Bienvenue dans le jeu Pierre, Feuille, Ciseaux !");

		boolean continuerJeu = true;
		while (continuerJeu) {
			System.out.println("Choisissez : 0 pour Pierre, 1 pour Feuille, 2 pour Ciseaux.");
			int choixUtilisateur = scanner.nextInt();
			int choixOrdinateur = random.nextInt(3);

			String choixUtilisateurString = convertirChoixEnString(choixUtilisateur);
			String choixOrdinateurString = convertirChoixEnString(choixOrdinateur);

			System.out.println("Vous avez choisi : " + choixUtilisateurString);
			System.out.println("L'ordinateur a choisi : " + choixOrdinateurString);

			//String resultat = determinerResultat(choixUtilisateur, choixOrdinateur);

			//System.out.println(resultat);

			System.out.println("Voulez-vous continuer ? (oui/non)");
			String reponse = scanner.next();
			continuerJeu = reponse.equalsIgnoreCase("oui");
		}
	}

	public static String convertirChoixEnString(int choix) {
		if (choix == 0) {
			return "Pierre";
		} else if (choix == 1) {
			return "Feuille";
		} else {
			return "Ciseaux";
		}
	}
	
	
	String determinerResultat(int choixUtilisateur, int choixOrdinateur) {
		if(choixUtilisateur == choixOrdinateur) {
			return "Égalité !";
		} else if((choixUtilisateur == 0 && choixOrdinateur == 2) || (choixUtilisateur == 1 && choixOrdinateur == 0) || (choixUtilisateur == 2 && choixOrdinateur == 1)) {
			return "Vous avez gagné !";
		}
		else {
			return "L'ordinateur a gagne";
		}
	}

	
}
