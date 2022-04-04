datos = imaqhwinfo;
datos = imaqhwinfo('winvideo');
video = videoinput('winvideo', 1, 'MJPG_320x240');
preview(video);
Ic = getsnapshot(video);

R = Ic(:, :, 1);
G = Ic(:, :, 2);
B = Ic(:, :, 3);
umbrales = [70, 140, 210];

Irgb = uint8((double(R)+double(G)+double(B))/3);
color = [255 255 0];
subplot(2,2,1),imshow(Ic),hold on;
title('Original');
for i = 1:length(umbrales)
    
    Iv = funcion_visualiza(Irgb, Irgb > umbrales(i), color, false);
    subplot(2, 2, i + 1); imshow(Iv);
    title("Umbral > " + umbrales(i));
end

hold off;

%2.-

Ib70 = Irgb > 70;
[IEtiq70 N70] = bwlabel(Ib70);
Ib140 = Irgb > 140;
[IEtiq140 N140] = bwlabel(Ib140);
Ib210 = Irgb > 210;
[IEtiq210 N210] = bwlabel(Ib210);

stats70 = regionprops(IEtiq70, 'Area', 'Centroid');
stats140 = regionprops(IEtiq140, 'Area', 'Centroid');
stats210 = regionprops(IEtiq210, 'Area', 'Centroid');

areas70 = cat(1, stats70.Area);
centroid70 = cat(1, stats70.Centroid);
areas140 = cat(1, stats140.Area);
centroid140 = cat(1, stats140.Centroid);
areas210 = cat(1, stats210.Area);
centroid210 = cat(1, stats210.Centroid);

ord70 = sort(areas70, 'descend');
ord140 = sort(areas140, 'descend');
ord210 = sort(areas210, 'descend');

ord70 = sort(areas70, 'descend');
ord140 = sort(areas140, 'descend');
ord210 = sort(areas210, 'descend');

Ib70_5=bwareaopen(Ib70, ord70(5));
Ib140_5 = bwareaopen(Ib140, ord140(5));
Ib210_5 = bwareaopen(Ib210, ord210(5));

figure, hold on, subplot(2, 2, 1), imshow(Ic), title("Original"), subplot(2, 2, 2), imshow(Ib70_5), title("Umbral 70 > 5");
subplot(2, 2, 3), imshow(Ib140_5), title("Umbral 140 > 5"); subplot(2, 2, 4), imshow(Ib210_5), title("Umbral 210 > 5");
hold off;

%Mejorar con bucle for y funcion_visualiza para mostrar otro color.
funcion_visualiza(Irgb, Ib70_5, color, true);
funcion_visualiza(Irgb, Ib140_5, color, true);
funcion_visualiza(Irgb, Ib210_5, color, true);













































