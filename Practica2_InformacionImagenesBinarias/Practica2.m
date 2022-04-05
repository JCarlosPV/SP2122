%1.- Lee la imagen del fichero �ImagenBinaria.tif�. Comprueba que es una imagen binaria
%   en la que est�n localizados los p�xeles que integran los objetos que se muestran en la 
%   imagen.
I = imread('ImagenBinaria.tif'); imtool(I);

%2.- Genera una matriz binaria tipo double o logical donde: el valor 0 signifique p�xel de 
%   fondo; el valor 1 signifique p�xel de objeto.
Ib = I>100;

%3.-  Genera una imagen en color, donde se visualice con un color diferente los objetos 
%   presentes en la imagen (al haber 6 objetos, pueden utilizarse los colores primarios y 
%   secundarios)
color = [0 0 255];
funcion_visualiza(I, Ib, color, 1);

[IEtiq, N] = funcion_etiquetar(Ib);
Ii = uint8(255*IEtiq);

for i = 1:N
    Ib_x = IEtiq == i; 
    Color = [round(255*rand()), round(255*rand()), round(255*rand())];
    Ii = funcion_visualiza(Ii, Ib_x, Color, 1);
end

%4.- Genera una imagen donde se localicen, a trav�s de su centroide, los objetos de mayor 
%   y menor �rea (ver documentaci�n para la definici�n de �rea y centroide).
areas = funcion_calcula_areas(IEtiq, N);
centroides = funcion_calcula_centroides(IEtiq, N);
figure, imshow(Ib), hold on
[mayor NMayor] = max(areas);
Xmayor = centroides(NMayor, 1);
Ymayor = centroides(NMayor, 2);
plot(Xmayor, Ymayor, '*r');

[menor NMenor] = min(areas);
Xmenor = centroides(NMenor, 1);
Ymenor = centroides(NMenor, 2);
plot(Xmenor, Ymenor, '*g');

hold off

%5.- Genera una imagen binaria donde s�lo se visualicen los dos objetos de �rea mayor.
areas_ord = sort(areas, 'descend');
numPix = areas_ord(2);
IbFilt = funcion_filtra_objetos(Ib, numPix);
imshow(IbFilt);




