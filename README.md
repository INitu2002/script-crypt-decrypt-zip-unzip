# script-crypt-decrypt-zip-unzip
Crearea unor shell script-uri cu scopul arhivarii/dezarhivarii si comprimarii/decomprimarii si criptarii/decriptarii directoarelor continand mai multe fisiere

Pentru a rula shell script-ul, se apeleaza din linia de comanda:
  bash inc1.sh
Va aparea un meniu cu 2 optiuni: 1) criptare 2) decriptare. Se alege optiunea dorita prin tastarea numarului aferent.
Ulterior, daca s-a ales optiunea 1, se va afisa un meniu cu 3 optiuni (algoritmi de criptare), iar dupa alegerea unuia dintre ei, va fi solicitata alegerea directorului din care sa fie criptate fisierele, fie separat, fie arhivandu-le impreuna. Daca optiunea aleasa este de criptare prin arhivare, se va cere, de asemenea, numele noii arhive create.

Daca se doreste decriptarea unui director, adica s-a ales initial optiunea 2, se va cere numele directorului de unde se vor decripta fisierele. Cand se decripteaza, se verifica mai intai daca sunt arhivate si comprimate, se decomprima si dezarhiveaza, iar mai apoi se decripteaza fiecare fisier in parte.
