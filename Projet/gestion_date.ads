WITH Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
USE Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
PACKAGE Gestion_Date IS



   TYPE T_Date IS
      RECORD
         Jour  : Integer RANGE 1 .. 31;
         Mois  : Integer RANGE 1 .. 12;
         Annee : Integer;
      END RECORD;

   PROCEDURE Test;
   FUNCTION Bisextile (Annee : Integer) RETURN Boolean;
   FUNCTION Jours_Par_Mois (Mois : Integer; Annee : Integer) RETURN Integer;
   FUNCTION Date_Valide (D : T_Date) RETURN Boolean;
   procedure Ajouter_Jours (D : in out T_Date; Nb_Jours : Integer) ;
   PROCEDURE Saisir_Date (D : OUT T_Date);
   function Difference_En_Jours (D1, D2 : T_Date) return Integer ;
END Gestion_Date;

