%%%%%%%% Estructura %%%%%%%%
01_GeneracionDatos
    DatosGenerados
        conjunto_datos.mat
        conjunto_datos_estandarizados.mat
        datos_estandarizacion.mat --> medias y desviaciones
        nombresProblema.mat
    Funciones --> Las generadas para esta parte
    Paso1_GeneracionConjuntoDatos --> X(90x23) Y(90x1)
    Paso2_RepresentacionDatos
    Paso3_EstandarizacionDatos
02_FaseEnrenamiento --> Diseño de clasificadores
    CASO1_LDA_clases2a2
        01_CirculoCuadrado
            01_SeleccionDescriptores
                DatosGenerados
                    espacio_ccas_circ_cuad.mat
                Funciones
                SeleccionDescriptores_CircCuad.m
            02_DisegnoClasificador
                ...
        02_CirculoTriangulo
    
        03_
03_FaseTest
Imagenes


%%%%%%%%

%%%%%%
nombreDescriptores{1} = 'Compacticidad';
nombreDescriptores{2} = 'Excentricidad';
nombreDescriptores{3} = '..'
nombreDescriptores{22} = 'DF Numero 10';

simboloClases{1} = '*r';
simboloClases{2} = '*g';
simboloClases{3} = '*b';

%%%%%%

IbinFilt = funcion_elimina_rigusidades();
if sum(IbinFilt(:)) > 0 %Si es mayor de 0 significa que hay cosas con las que trabajar
    ...
end


%% Repreentacion de datos
funcion_representa_datos(X, Y, nombreProblemas ,espacioCcas);

for i=1:2:numDescriptores - 1 - 1 %No representamos numEuler
    espacioCcas = [i i+1];
    funcion_representa_datos(X, Y, espacioCcas, nombresProblema)
    %
    
end

%% Estandarizacion de Datos
%QDA LDA y KNN evaluan distancia entre dos puntos, si los valores de cada
%descriptor son muy dispares 


Medias = [mean(x1) std(x1); mean(x2), std(x2)];

%Estandarización
%Al dividir por su desviación tipica, se moveran en torno a 1.
%Al restarle su media, se moveran en torno a 0.
x1n = (x1 - mean(x1))/std(x1);
x2n = (x2 - mean(x2))/std(x1);


%Calcular matriz estanderizada (Z) --> Cogemos las columnas de los datos y
%les calculamos la media y std (desviacion tipica)

medias = mean(X);
desv = std(X);
Z = X;

for i = 1:22 %
    Z(i) = ((Z(i) - medias(i))/desv(i)) + eps
end

%% Ejercicios a parte
%Separabilidad Circulos-Triangulos

espacioCcas = [1 4 10];
XoI = X(:, espacioCcas); YoI = Y;
XoI(Y == 2, :) = [];
YoI(Y == 2, :) = [];

indiceJ(XoI, YoI);

%% Seleccion descriptores practica
%Mejores descriptores individualmente
valoresJ = zeros(1, numDescriptores);
for i = 1:numDescriptores
    XoI = X(:, i);
    valoresJ(1, i) = indiceJ(XoI, Y);
end

sort(valoresJ, 'Descend'); %Y coger los 3 que sean mas grandes.

%Mejores descriptores
combinaciones = combnk(1:numDescriptores, 3); 














