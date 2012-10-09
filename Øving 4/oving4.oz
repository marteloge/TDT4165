declare
%Oppgave 2

% Behandler strømmen S som en liste
% 1) Henter ut hodet, og utføer F på hodet (printer ut)
% 2) Sender Halen(T) med en rekusivt kall på StreamMap

fun lazy {StreamMap S F}
   case S of H|T then
      {F H}|{StreamMap T F}
   [] nil then nil
   end
end


%Oppgave 3

% Kan anta at strømmene er like lange
% # lager tuppel

fun lazy {StreamZip S1 S2 F}
   case S1#S2 of (H1|T1)#(H2|T2) then
      {F H1 H2}|{StreamZip T1 T2 F}
   else
      nil
   end
end


%Oppgave 4

% SF er strømmer med flyttal
% Tar hvert tall i strømmen og ganger det med en faktor.
% Må huske at faktor også må være på flyttal form (eks 2.0)

fun lazy {StreamScale SF Factor}
   case SF of H|T then
      H*Factor |{StreamScale T Factor}
   [] nil then nil
   end
end


%Oppgave 5

fun lazy {StreamAdd SF1 SF2}
   case SF1#SF2 of (H1|T1)#(H2|T2) then
      H1+H2|{StreamAdd T1 T2}
   else
      nil
   end
end


%Oppgave 6
%S = c+zum(xi*dt),    dt er den lille økningen
% gir ut integralet etterhvert som nye elementer/tall kommer
fun lazy {StreamIntegrate SF InitValue Dt}
   case SF of H|R then
      InitValue | {StreamIntegrate R (InitValue + H * Dt) Dt}
      %bruker def. av integrasjon
   []nil then
      InitValue | nil
   end
end


%Oppgave 7
%Følger tegningen/ figur 3
fun lazy {MakeRC R C Dt}
   fun {$ SF V0}
      {StreamAdd
       {StreamIntegrate {StreamScale SF (1.0/C)} V0 Dt}
       {StreamScale SF R}}
   end
end

