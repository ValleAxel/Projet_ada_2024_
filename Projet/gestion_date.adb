WITH Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
USE Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
PACKAGE BODY Gestion_Date IS
   PROCEDURE Test IS
   BEGIN
      Put("Test :D");
   END Test;




----------------------------------année bissextile---------------------------
   FUNCTION Bisextile (Annee : Integer) RETURN Boolean IS
   BEGIN      IF (Annee mod 4 = 0 AND THEN Annee mod 100 /= 0) OR ELSE (Annee mod 400 = 0) THEN
         RETURN(True) ;
      ELSE
         RETURN(False);
      END IF;
   END Bisextile;



----------------------------------calcul du nombre de jour par mois---------------------------

FUNCTION Jours_Par_Mois (Mois : Integer; Annee : Integer) RETURN Integer IS
   BEGIN
         case Mois is
            when 1 | 3 | 5 | 7 | 8 | 10 | 12 => return 31;
            when 4 | 6 | 9 | 11 => return 30;
            when 2 =>
               if Bisextile(Annee) then
                  return 29;
               else
                  return 28;
               end if;
            when others =>
               Put("mauvaise valeur");
         end case;
   END Jours_Par_Mois;


-------------------------------vérifier si la date existe---------------------------

   function Date_Valide (D : T_Date) return Boolean is
   begin
      if D.Mois < 1 or else D.Mois > 12 then
         return False;
      elsif D.Jour < 1 or else D.Jour > Jours_Par_Mois(D.Mois, D.Annee) then
         return False;
      else
         return True;
      end if;
   END Date_Valide;

procedure Ajouter_Jours (D : in out T_Date; Nb_Jours : Integer) is
begin
   for I in 1 .. Nb_Jours loop
      D.Jour := D.Jour + 1;
      if D.Jour > Jours_Par_Mois(D.Mois, D.Annee) then
         D.Jour := 1;
         D.Mois := D.Mois + 1;
         if D.Mois > 12 then
            D.Mois := 1;
            D.Annee := D.Annee + 1;
         end if;
      end if;
   end loop;
end Ajouter_Jours;


----------------------------------Saisie de la date---------------------------


   PROCEDURE Saisir_Date (D : OUT T_Date) IS
   BEGIN
      LOOP
         Put("Entrez le jour (1 à 31) : ");
         Get(D.Jour);
         Put("Entrez le mois (1 à 12) : ");
         Get(D.Mois);
         Put("Entrez l'année : ");
         Get(D.Annee);

         if Date_Valide(D) then
            Exit; -- Sort de la boucle si la date est valide
         else
            Put_Line("La date saisie est invalide. Veuillez réessayer !");
         end if;
      END LOOP;
   END Saisir_Date;




-- Fonction qui calcule la différence en jours entre deux dates
function Difference_En_Jours (D1, D2 : T_Date) return Integer is
   Diff : Integer := 0;
BEGIN
   IF ((D1.Annee * 365)+(D1.Mois*30)+D1.Jours) > ((D2.Annee * 365)+(D2.Mois*30)+D2.Jours)
      if D1.Annee /= D2.Annee then
         Diff := (D2.Annee - D1.Annee) * 365;
      end if;

      if D1.Mois /= D2.Mois then
         Diff := Diff + (D2.Mois - D1.Mois) * 30; -- Approximation pour le moment, je chnage apres
      END IF;
   return Diff + (D2.Jour - D1.Jour);


   ELSIF ((D1.Annee * 365)+(D1.Mois*30)+D1.Jours) > ((D2.Annee * 365)+(D2.Mois*30)+D2.Jours)
      if D2.Annee /= D1.Annee then
         Diff := (D1.Annee - D2.Annee) * 365;
      end if;

      if D2.Mois /= D1.Mois then
         Diff := Diff + (D1.Mois - D2.Mois) * 30; -- Approximation pour le moment, je chnage apres
      end if;

      RETURN Diff + (D1.Jour - D2.Jour);

   ELSE
      Return (0);
end Difference_En_Jours;END Gestion_Date;