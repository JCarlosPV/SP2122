%Preparando cámara.
datos = imaqhwinfo;
datos = imaqhwinfo('winvideo'); 
obj = videoinput('winvideo'); %Así se puede ver el formato si no aparece con el de arriba.
video = videoinput('winvideo',1,'YUY2_320x240');
preview(video);

%1.- Utilizando la función de Matlab subplot, muestre en una misma ventana tipo figure la 
%   imagen capturada y 3 imágenes que resalten, sobre la imagen original, aquellos píxeles cuya 
%   intensidad sea mayor que un determinado umbral (asigne para esas 3 imágenes, valores de 
%   umbral: 70, 140 y 210, respectivamente). La intensidad de un píxel se calculará como la 
%   media de los niveles de gris de las componentes roja, verde y azul

I = getsnapshot(video);
imtool(I); %Se ve en el formato YCBCR
Imod = ycbcr2rgb(I); %Se cambia a formato RGB
R = Imod(:, :, 1); G = Imod(:, :, 2); B = Imod(:, :, 3);
Irgb = uint8((double(R)+double(G)+double(B))/3);
umbrales = [70, 140, 210];
color = [255, 255, 0];
figure,subplot(2, 2, 1), imshow(Imod), hold on
title("Original");
for i = 1:length(umbrales)
    Iv = funcion_visualiza(Irgb, Irgb>umbrales(i), color, false); 
    subplot(2,2,i+1), imshow(Iv)
    title("Umbral > " + umbrales(i));
end
hold off;


%2.- Para cada una de las imágenes generadas en el apartado anterior:
%   · Visualice sobre la imagen original las 5 agrupaciones mayores de píxeles conectados.
%   · Localice a través de su centroide las agrupaciones anteriores y, en otro color, el 
%   centroide de la mayor agrupación para distinguirla.
figure, hold on, subplot(2, 2, 1), imshow(Imod);
title("Original");
for i = 1:length(umbrales)
    Ib = Irgb > umbrales(i);
    [IEtiq N] = bwlabel(Ib);
    stats = regionprops(IEtiq, 'Area', 'Centroid');
    areas = cat(1, stats.Area);
    ord = sort(areas, 'descend');
    Ib_5 = bwareaopen(Ib, ord(5));  
    Iv = funcion_visualiza(Irgb, Ib_5, color, false);
    subplot(2, 2, i+1), imshow(Ib_5), title("Umbral " + umbrales(i) + " > 5");
end











