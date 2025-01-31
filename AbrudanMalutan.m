clc
close all
clear all
%incarcarea fisierelor cu datele primite
load('iddata-11.mat')
load('proj_fit_11.mat')

% afisarea seturilor de date
figure;
mesh(id.X{1},id.X{2},id.Y)
title('Datele de identificare');
figure;
mesh(val.X{1},val.X{2},val.Y)
title('Datele de validare');

%dezvoltarea unui model folosind aproximatorul polinomial
m=18;
idN=length(id.X{1})*length(id.X{2});
valorimseid=zeros(1,m);
valN=length(val.X{1})*length(val.X{2});
valorimseval=zeros(1,m);

for l=1:m
   %creez vectorul phi pentru datele de identificare
   phi1=polinom_generat(id.X{1},id.X{2},l);
   phimatrice=phi1;
   Y=reshape(id.Y,[],1);
   theta=phimatrice\Y;
   yaproximat=phimatrice*theta;

   suma1=0;
   for i=1:idN
      suma1=suma1+(yaproximat(i)-Y(i)).^2;
   end
   id_mse=(1/idN)*suma1;
   valorimseid(l)=id_mse;
   
   %creez vectorul phi pentru datele de validare
   phi2=polinom_generat(val.X{1},val.X{2},l);
   validarephimatrice=phi2;
   valY=reshape(val.Y,[],1);
   validare_yaproximat=validarephimatrice*theta;
   
   suma2=0;
   for i=1:valN
       suma2=suma2+(validare_yaproximat(i)-valY(i)).^2;
   end
   val_mse=(1/valN)*suma2;
   valorimseval(l)=val_mse;

end

%afisarea valorilor MSE 
disp('Eroarea medie patratica pe datele de identificare:');
disp(id_mse);
disp('Eroarea medie patratica pe datele de validare:');
disp(val_mse);

%afisarea graficelor ce contin valorile MSE pe ambele seturi de date
figure;
plot(1:m, valorimseid, 'r')
hold on;
plot(1:m,valorimseval,'b')
legend('Eroare id', 'Eroare val');
title('MSE pe ambele seturi de date');

%suprapunerea rezultatului dat de aproximatorul polinomial pentru datele de identificare
figure;
mesh(id.X{1},id.X{2},id.Y);
hold on;
mesh(id.X{1},id.X{2},reshape(yaproximat,length(id.X{1}),length(id.X{2})),'EdgeColor','magenta');
legend('Iesirea sistemului','Iesirea modelului');
title("Aproximatorul polinomial pe datele de identificare");

%suprapunerea rezultatului dat de aproximatorul polinomial pentru datele de validare
figure;
mesh(val.X{1},val.X{2},val.Y);
hold on;
mesh(val.X{1}, val.X{2}, reshape(validare_yaproximat,length(val.X{1}),length(val.X{2})),'EdgeColor','red');
legend('Iesirea sistemului','Iesirea modelului');
title('Aproximatorul polinomial pe datele de validare');

%afisarea rezultatului dat de aproximator pe datele de identificare
figure;
subplot(211)
mesh(id.X{1},id.X{2},id.Y);
subplot(212)
mesh(id.X{1},id.X{2},reshape(yaproximat,length(id.X{1}),length(id.X{2})));
title("Aproximarea pentru datele de identificare");

%afisarea rezultatului dat de aproximator pe datele de validare
figure;
subplot(211)
mesh(val.X{1},val.X{2},val.Y);
subplot(212)
mesh(val.X{1}, val.X{2}, reshape(validare_yaproximat,length(val.X{1}),length(val.X{2})));
title('Aproximarea pentru datele de validare');