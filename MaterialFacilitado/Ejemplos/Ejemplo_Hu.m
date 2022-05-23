
%Calcular los momentos de Hu.
umbral = graythresh(I) %OTSU

Ibin = I < 255*umbral;
[IEtiq, N] = bwlabel(Ibin);
IbPrimeraLetra = IEtiq == 1; %Obtenemos de la imagen binaria unicamente un objeto.

m = Funcion_Calcula_Hu(IbPrimeraLetra); % Solo se le pasa un objeto en la imagen. 7 valores

%Para todas las X hacer bucle for

X = zeros(N, 7);

for i = 1 : N
   Ibin_i = IEtiq == i;
   m = Funcion_Calcula_Hu(Ibin_i)
   X(i, :) = m;
end


%Calcular en X los Momentos Hu de letras X e Y
nombreClase = [];
nombreClases{1, 1} = 'X';
nombreClases{2, 1} = 'Y';
extension = '.jpg';

X = [];
Y = [];
numClases = length(nombeClases);
codifClases = 1:numClases; %Se pued poner directamente la i en el bucle. Es lo mismo.

for i = 1:numClases
    I = imread(nombreImagen);
    umbral = graythresh(I); %Binariaza mediante OTSU
    Ibin = I < 255*umbral;
    [IEtiq, N] = bwlabel(Ibin)
    
    for j = 1 : N
        Iobjeto = IEtiq == j;
        m = Funcion_Calcula_Hu(Ibin_i); %Devuelve los momentos de Hu en vector columna
        X = [X; m'];
    end
    
    Y = [Y; codifClases(i)*ones(N, 1)];
end

%Así obtenemos los datos de XTrain YTrain de las imagenes.

funcion_representa_datos...
    (X, Y, espacioCcas, nombresProblema);

espacioCcas = [1 3];
espacioCcas = [1 5 7];

nombreDescripores = {'Hu1', 'Hu2', 'Hu3', 'Hu4', 'Hu5', 'Hu6', 'Hu7'};
nombreClases{1} = 'Letras X';
nombreClases{2} = 'Letras Y';
simbolosClases{1} = '*r';
simbolosClases{2} = '*b';

funcion_representa_datos...
    (X, Y, espacioCcas, nombreDescripores, nombreClases, simbolosClases);

nombresProblema = [];
nombresProblema.descriptores = nombreDescriptores;
nombresProblema.clases = nombreClases;
nombresProblemas.simbolos = simboloClases;

%Guardar datos en conjunto_datos.mat(X, Y) y
%nombresProblema.mat(nombreProblemas) que contene descripores, clases y
%simbolos


%% Algoritmo final
nombreImagen
funcion_Ejemplo_Calculo_Hu_reconocedor_X_Y_porHu1(nombreImagen)
%Se le pasa una imagen y va mostrando el objeto que analiza de un color
%diferente al resto y en el titulo indica si es X o Y



%% Descriptor Extent 
I = imrad
IbinObjeto = graythresh(I);
IbinObjeto = IEtiq == 1;
%1.- Calcular el boundixBox del objeto - > Rectangulo que circunscribe el objeto.
[f, c] = find(IbinObjeto);
fmin = min(f); fmax = max(f);
cmin = min(c); cmax = max(c);

%Hay que rajustar los valores de fmin, fmax, cmin, cmax par que incluya a
%todos los pixeles
fmin = fmin-0.5;
fmax = fmax+0.5;
cmin = cmin-0.5;
cmax = cmax + 0.5;

numPixBB = (cmx-cmin)*(fmax-fmin);
numPixObj = sum(IbinObjeto(:));
extentObjeto = numPixObj/numPixBB;

% Dibujar el boundin box
line([cmin, cmin], [fmin, fmax], 'Color', 'r'); %[coordenadaX, punto de inicio], [coordenadaY, punto final]
line([cmax, cmax], [fmin, fmax], 'Color', 'r');

%EN MATLA
stats = regionprops(IbinObjeto, 'Extent'); %IbinObjteo es una imagen binaria con un unico objeto.
ExtentObjeto = cat(1, stats.Extent);


stats = regionprops(IEtiq, 'Extent');
ExtentObjeto = cat(1, stats.Extent);
























