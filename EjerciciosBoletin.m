%% Cargar datos
load datos_...
X1 = datos;
Y1 = clases;

load datos...
X2 = datos;
Y2 = clases;

%% Comprobar que tenga 2 o 3 dimensiones.
funcion_representa_muestras_clasificacion_binaria(X1, Y1);
title ...
funcion_representa_muestras_clasificacion_binaria(X2, Y2);
titel ...
    
%% LDA

%Si no hay correlación entre las variables(X1 y X2 son independientes) 
%no hace falta tener en cuenta la matriz de covarianza. Se podría hacer
%distancia euclidea.

X = datos;
Y = clases;

%Ajuste LDA
[vectorMedias, mCov, probabilidadPriori] = funcion_ajusta_LDA(X, Y);

%Aplicación LDA
valoresClases = unique(Y);
[YP, d] = funcion_aplica_LDA(X, vectorMedias, mCob, probabilidadPriori, valoresClases);

%Medimos tasa de Acierto
error = Y - YP;
numAciertos = sum(error==0);
Acc = numAciertos/ (length(error));

%Representamos frontera decision
[d1 d2, d12, coeficientes_d12] = funcion_calcula_hiperplanoLDA_2clases_2_3_Dim(X, Y);
close all;
funcion_representa_muestras_clasificacion_binaria(X, Y);
hold on;
funcion_representa_hiperplano_separacion(coeficiente_d12, X)

%% QDA

%Ajusta QDA
[vectorMedias, matricesConvarianzas, probabilidadPriori] = funcion_ajusta_QDA(X, Y);

%Aplicación QDA
valoresClases = unique(Y);
[YP, d] = funcion_aplica_QDA(X, vectorMedias, mCob, probabilidadPriori, valoresClases);

%Medimos tasa de Acierto
error = Y - YP;
numAciertos = sum(error==0);
Acc = numAciertos/ (length(error));


%% Ejercicio 5
%Cargar datos
load ...

numDatos = size(X,1);
porcentajeTrain = 0.7;
numDatosTrain = round(porcentajeTrain*numDatos);
numerosMuestrasTrain = randsample(numDatos,numDatosTrain);
numerosMuestrasTest = find(not(ismember(1:numDatos,numerosMuestrasTrain)));
% Conjunto de Train
XTrain = X(numerosMuestrasTrain,:);
YTrain = Y(numerosMuestrasTrain);
% Conjunto de Test
XTest = X(numerosMuestrasTest,:);
YTest = Y(numerosMuestrasTest);

%Reprensetamos muestra
funcion_repersenta_muestras_clasificacion_binaria(XTest, YTest);


%% KNN

%YP = funcion_knn (XTest, XTrain, YTrain, k,'Euclidea');
YP = funcion_knn (XTest, XTrain, YTrain, 5,'Euclidea');
k = 5;
for i = 1:size(XTest, 1)
   XTest_i = XTest(i, :)';
   %Calcular la distancia desde XTest_i a todos los punos de XTrain
   XTrain = XTrain';
   numDatosTrain = size(XTrain, 2);
   XTest_i_amp = repmat(XTest_i, 1, numDatosTrain)
   
   vectorDistancia = sqrt( sum((XTest_i_amp - XTrain).^2));
   
   [vectorDistanciaOrd, ind] = sort(vectorDistancia, 'descend');
   
   YTrainOrd = YTrain(ind);
   clasesKNN = YTrainOrd(1:k);
   
   valoresClasesKNN = uinque(clasesKNN);
   conteoValoresClasesKNN = zeros(size(valoresClasesKNN));
   
   for j = 1:length(valoresClasesKNN)
       conteoValoresClasesKNN(j) = sum(calsesKNN == valorsClasesKNN(j));
   end
   
   [valor, ind] = max(conteoValoresClasesKNN)
   

end

%% Decidir el valor de K - hiperparámetro del modelo





















