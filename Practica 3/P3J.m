%Ejercicio 1
video=videoinput('winvideo',2,'RGB24_320x240');


I=getsnapshot(video);

[nf,nc,m]=size(I);

MIntensidad=uint8(255*zeros(nf,nc));

for i=1:nf
    for j=1:nc
    MIntensidad(i,j)=(double(I(i,j,1))+double(I(i,j,2))+double(I(i,j,3)))/3;
    end
end

I70=MIntensidad>70;

I140=MIntensidad>140;

I210=MIntensidad>210;

I1=funcion_visualiza(I,I70,[255,255,0],false);
I2=funcion_visualiza(I,I140,[255,255,0],false);
I3=funcion_visualiza(I,I210,[255,255,0],false);

subplot(2,2,1),imshow(I),title('Imagen original');
subplot(2,2,2),imshow(I1),title('Zonas con pixeles>70');
subplot(2,2,3),imshow(I2),title('Zonas con pixeles>140');
subplot(2,2,4),imshow(I3),title('Zonas con pixeles>210');

%Ejercicio 2
for i=1:3
    if i==1
        variable=I70;
        show=I1;
    elseif i==2
        variable=I140;
        show=I2;
    else
        variable=I210;
        show=I3;
    end

    [IEtiq, N]=bwlabel(variable);
    stats=regionprops(IEtiq,'Area','Centroid');
    areas=cat(1,stats.Area);
    [areas_ord ind]=sort(areas,'descend');
    centroides=cat(1,stats.Centroid);

        subplot(2,2,1),imshow(I),title('Imagen original');
subplot(2,2,2),imshow(I1),title('Zonas con pixeles>70');
subplot(2,2,3),imshow(I2),title('Zonas con pixeles>140');
subplot(2,2,4),imshow(I3),title('Zonas con pixeles>210');

    [nfind,ncind]=size(ind);

    if nfind>5
        for i=1:5
            x_media=centroides(ind(i,1),1);
            y_media=centroides(ind(i,1),2);

            if i==1
                hold on,plot(x_media,y_media,'*r');
            else
                hold on,plot(x_media,y_media,'*b');
            end
        end
    end

end

%General para los ejercicios de video
video=videoinput('winvideo',2,'RGB24_320x240');
video.TriggerRepeat=5;

video.FramesPerTrigger=10;
video.FrameGrabInterval=3;
N=((video.TriggerRepeat+1)*video.FramesPerTrigger);
%Ejercicio 3
start(video)

M=getdata(video,1);
for i=4:-0.05:0
Im_aux=imadjust(M,[],[],i);
imshow(Im_aux);
end

stop(video);

%Ejercicio 4

start(video)
M=getdata(video,1);

[nf,nc,m]=size(M);

MIntensidad=uint8(255*zeros(nf,nc));

for i=1:nf
    for j=1:nc
    MIntensidad(i,j)=(double(M(i,j,1))+double(M(i,j,2))+double(M(i,j,3)))/3;
    end
end

for i=0:1:255
Im_umbral=MIntensidad>i;
imshow(Im_umbral);
end
stop(video);

%Ejercicio 5.1

start(video);
Primer_Frame=getdata(video,1);

for i=1:N-1
Im_capturada=getdata(video,1);
Dif=imabsdiff(Im_capturada,Primer_Frame);
Primer_Frame=Im_capturada;
imshow(Dif);
end

stop(video);

%Ejercicio 5.2

start(video);
M=getdata(video,1);

for i=1:N-1
  Imagen_capturada=getdata(video,1);
DifIntensidad=imabsdiff(Imagen_capturada,M);

[nf,nc,m]=size(DifIntensidad);

for i=1:nf
    for j=1:nc
        MIntensidad(i,j)=(double(DifIntensidad(i,j,1))+double(DifIntensidad(i,j,2))+double(DifIntensidad(i,j,3)))/3;
    end
end

ImagenUmbral=MIntensidad>100;
M=Imagen_capturada;
imshow(ImagenUmbral);
end
stop(video);

%Ejercicio 5.3
start(video);
M=getdata(video,1);

for i=1:N-1
  Imagen_capturada=getdata(video,1);
DifIntensidad=imabsdiff(Imagen_capturada,M);

[nf,nc,m]=size(DifIntensidad);
MIntensidad=uint8(255*zeros(nf,nc));

for i=1:nf
    for j=1:nc
        MIntensidad(i,j)=(double(DifIntensidad(i,j,1))+double(DifIntensidad(i,j,2))+double(DifIntensidad(i,j,3)))/3;
    end
end

ImagenUmbral=MIntensidad>100;
[IEtiq,Na]=bwlabel(ImagenUmbral);
stats=regionprops(IEtiq,'Area','Centroid');
areas=cat(1,stats.Area);
centroides=cat(1,stats.Centroid);
[areasOrd,ind]=sort(areas,'descend');
x=centroides(ind(1),1);
y=centroides(ind(1),2);
M=Imagen_capturada;
imshow(ImagenUmbral),hold on, plot(x,y,'*r')
end
stop(video);