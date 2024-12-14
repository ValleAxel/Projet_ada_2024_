WITH Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO,Gestion_date;
USE Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO,Gestion_date;
PROCEDURE Main IS   D1, D2 : T_Date; -- Deux dates pour les comparaisons et calculs
   Nb_Jours : Integer;
BEGIN

   Test;
--   -- Saisie des informations pour la date--   Put_Line("=== V�rification Ann�e Bissextile ===");
--   Put("Entrez le jour (1 � 31) : ");
--   Get(D1.Jour);
--   Put("Entrez le mois (1 � 12) : ");
--   Get(D1.Mois);
--   Put("Entrez l'ann�e : ");
--   Get(D1.Annee);




   Saisir_date(D1) ;

   ------- V�rification si l'ann�e est bissextile et affichage--------------------
   if Bisextile(D1.annee) then
      Put_Line("L'annee est bissextile.");
   else
      Put_Line("L'annee n'est pas bissextile.");
   END IF;

   ----------- Affichage du nombre de jours dans le mois de la premi�re date-------
   Put("Le mois ");
   Put(D1.Mois);
   Put(" de l'annee ");
   Put(D1.Annee);
   Put(" contient ");
   Put(Jours_Par_Mois(D1.Mois, D1.Annee));
   Put_Line(" jours.");


  ------------------ Ajout de jours � la premi�re date--------------------
   Put("Combien de jours voulez-vous ajouter a cette date ? ");
   Get(Nb_Jours);
   Ajouter_Jours(D1, Nb_Jours);
   Put("Nouvelle date apres ajout : ");
   Put(D1.Jour);
   Put("/");
   Put(D1.Mois);
   Put("/");
   Put(D1.Annee);new_line;

   ------------test de calcul de diff�rence en jours ente les deux date--------
   -- Saisie et validation de la deuxi�me date
   Put_Line("=== Saisie de la deuxieme date ===");
   Saisir_Date(D2);

   -- Calcul de la diff�rence en jours entre les deux dates
   Put("La difference en jours entre les deux dates est de : ");
   Put(Difference_En_Jours(D1, D2));new_line;



END Main;


