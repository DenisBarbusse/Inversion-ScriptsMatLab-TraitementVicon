%Ce code a pour but de découper un fichier matlab contenant le signal en
%continu de mouvements de pointage successifs en un fichier par mouvement.

% subject_folder = {uigetdir};

%extraire la colonne correspondant à la dimension z de l'extrémité du bras

z = C3D.Cinematique.Donnees(:,18);

%%%z = z(1:4100,1);

indice_Z = 1:length(z);
indice_Z = indice_Z';

%calculer v 
v = derive(z,1);
v = abs(v); 

%calculer sa médiane
M = min(v)+ ((max(v)-min(v))/2);

%touver l'index de chaque passage de v par sa médiane et les stocker

%k = 1;
indice_a = [];
for j = 2 : length(v)
    if v(j-1,1)<= M && v(j,1)>= M
        indice_a = [indice_a 
            j];
        %indice_a(k,1) = j;
        %k=k+1;
    end
end

%k = 1;
indice_d = [];
for j = 2 : length(v)
    if v(j-1,1)>= M && v(j,1)<= M
        indice_d = [indice_d 
            j];
        %indice_d(k,1) = j;
        %k=k+1;
    end
end

%dérterminer le nombre d'essais
%Q_of_try = length(indice_a);

%calculer vmax comprise entre un indice_up et un indice_down consécutifs

vmax = [];
indice_vmax = [];

o = 1;
for i = 1 : length(indice_a)
    [X Y] = max (v(indice_a(o,1):indice_d(o,1),1));
    vmax = [vmax 
        X];
    Y = Y + indice_a(o,1) - 1;
    indice_vmax = [indice_vmax 
        Y];

%à partir de vmax, déterminer le début et la fin du mouvement
    h = Y;
    while v(h,1) > 0.1*vmax
    h = h-1;
    end
    onset = h-30;
    
    k = Y;
    while v(k,1) > 0.1*vmax
    k = k+1;
    end
    if length(v)-k > 30;
        offset = k+30;
    else length(v)-k <= 30;
        offset = length(v);
    end
    
%créer une matrice contenant toutes les données comprises dans un
%mouvement puis les sauvegarder dans un fichier par mouvement
    Trial = z(onset:offset,1);
    indice_T = indice_Z(onset:offset,1);
    Z = [indice_T Trial];
    T = [indice_T C3D.Cinematique.Donnees(onset:offset,:)];
    
    save (['Try' num2str(o) '.mat'],'Z' ,'T');
    
    o = o+1;
end
