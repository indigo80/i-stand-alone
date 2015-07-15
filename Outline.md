# Lista #

  * Engine klasa
  * Sprite klasa
  * Audio klasa
  * Network klasa
  * Tilemap klasa


## Scene ##
  * SceneManager klasa
  * BaseScene klasa
  * TitleScene klasa
  * OptionsScene klasa
  * GameScene klasa
  * NetworkScene klasa


## Ostali resursi ##

  * Grafika
  * Audio

# Detaljno #

## Engine klasa ##

Treba da ima sve funkcije koje rade direktno sa aplikacijom ukljucujuci i glavnu petlju programa koja ce se izvsavati.

[Dodjeljeno - Aleksandar ](.md)

## Sprite klasa ##

Treba da ima funkcije poput sirina, visina, x, y, koordinate, sprite slika, animacioni frame.

[Dodjeljeno - Igor ](.md)

## Audio klasa ##

Treba da sadrzi funkcije za rad sa zvukom, pustanje/zaustavljanje/pauziranje muzike, pustanje/zaustavljanje/pauziranje sfx (zvucnih efekata).
Formati koje treba podrzavati su OGG i WAV.

[Dodjeljeno - ?? ](.md)

## Network klasa ##

Treba da sadrzi funkcije za upravljanje, kreiranje servera/klienata i direknu interakciju preko socketa. Koristiti UDP konekciju.

[Dodjeljeno - ?? ](.md)

## Tilemap klasa ##

Treba da sadrzi funkcije za prikazivanje mape, sirina, visina, x, y, i layere (listu sprite-ova) za prikazivanje.

[Dodjeljeno - ?? ](.md)

## SceneManager klasa ##

Klasa koja je menadzer svih scena i izvrsava trenutnu scenu i vrsi prebacivanje scena.

[Dodjeljeno - ?? ](.md)

## BaseScene klasa ##

Klasa koja ce imati osnovne funkcije scene koju ce ostale scene nasljediti kao naziv scene.

[Dodjeljeno - ?? ](.md)

## TitleScene klasa ##

Klasa koja nasljedjuje BaseScene klasu i koja ce imati prikaz osnovnog menija sa logo-om i funkcijama igre.

[Dodjeljeno - ?? ](.md)

## OptionsScene klasa ##

Klasa koja nasledjuje BaseScene klasu i koja ce imati prikaz osnovnih opcija kojima ce se namjestati igra. Opcije kao zvuk, tastatura, fullscreen, vsync i druge ce trebaju biti ovdje.

[Dodjeljeno - ?? ](.md)

## GameScene klasa ##

Klasa koja nasledjuje BaseScene klasu i koja ce imati glavni prikaz igre sa HUD-om i tilemapom i likom.

[Dodjeljeno - ?? ](.md)

## NetworkScene klasa ##

Klasa koja nasledjuje BaseScene klasu i koja ce imati glavni prikaz mreze i igara koje se trenutno igraju za ovu igricu sa mogucnostima kreiranja igre, pridruzivanja serveru i drugo.

[Dodjeljeno - ?? ](.md)

## Grafika ##

Grafika koja ce se koristiti u ovoj igri, sav UI dizajn ukljucujuci sprite slike likova, oruzija i tilemape ce biti prebacen ovdje.

[Dodjeljeno - Ilija, Aleksandar ](.md)

## Audio ##

Sva muzika od pozadinske do zvucnih efekata u ovoj igri.

[Dodjeljeno - ?? ](.md)