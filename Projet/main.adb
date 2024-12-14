WITH Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO,Gestion_date;
USE Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO,Gestion_date;
PROCEDURE Main IS   D1, D2 : T_Date; -- Deux dates pour les comparaisons et calculs
   Nb_Jours : Integer;
BEGIN

   Test;
--   -- Saisie des informations pour la date--   Put_Line("=== Vérification Année Bissextile ===");
--   Put("Entrez le jour (1 à 31) : ");
--   Get(D1.Jour);
--   Put("Entrez le mois (1 à 12) : ");
--   Get(D1.Mois);
--   Put("Entrez l'année : ");
--   Get(D1.Annee);




   Saisir_date(D1) ;

   ------- Vérification si l'année est bissextile et affichage--------------------
   if Bisextile(D1.annee) then
      Put_Line("L'annee est bissextile.");
   else
      Put_Line("L'annee n'est pas bissextile.");
   END IF;

   ----------- Affichage du nombre de jours dans le mois de la première date-------
   Put("Le mois ");
   Put(D1.Mois);
   Put(" de l'annee ");
   Put(D1.Annee);
   Put(" contient ");
   Put(Jours_Par_Mois(D1.Mois, D1.Annee));
   Put_Line(" jours.");


  ------------------ Ajout de jours à la première date--------------------
   Put("Combien de jours voulez-vous ajouter a cette date ? ");
   Get(Nb_Jours);
   Ajouter_Jours(D1, Nb_Jours);
   Put("Nouvelle date apres ajout : ");
   Put(D1.Jour);
   Put("/");
   Put(D1.Mois);
   Put("/");
   Put(D1.Annee);new_line;

   ------------test de calcul de différence en jours ente les deux date--------
   -- Saisie et validation de la deuxième date
   Put_Line("=== Saisie de la deuxieme date ===");
   Saisir_Date(D2);

   -- Calcul de la différence en jours entre les deux dates
   Put("La difference en jours entre les deux dates est de : ");
   Put(Difference_En_Jours(D1, D2));new_line;



END Main;


