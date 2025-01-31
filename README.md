# Modelarea-unei-functii-necunoscute
Programarea unui aproximator de grad configurabil.

Se dă un set de date de intrare-ieșire, unde ieșirea este generată de o funcție necunoscută, neliniară, dar statică. Ieșirea este afectată de zgomot aditiv de tip Gaussian, cu medie zero. Funcția are două variabile de intrare și o singură variabilă de ieșire.

Scopul este de a dezvolta un model pentru această funcție utilizând un aproximator polinomial. Pentru validarea modelului, se furnizează un al doilea set de date, generat de aceeași funcție.

Cele două seturi de date sunt oferite într-un fișier MATLAB, fiecare fiind stocat sub forma unei structuri de date MATLAB. Structura destinată antrenării modelului este denumită id, iar cea destinată validării modelului este denumită val.
