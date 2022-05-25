function T_Otsu = funcion_otsu(I)

    h = imhist(uint8(I));
    
    % Consideramo en toda la programacion niveles de grises de 1 a 256,
    % despues al resultado le restaremos una unidad
    
    gIni = 1; gFin = 256;
    [gmedio, numPix] = calcula_valor_medio_region_histograma(h, gIni, gFin);
    
    var = zeros(256, 1);%Para almacenar la varianza entre clases
    
    for i=2:255 %Los extremos no son posibles umbrales i=1 y i =256
        T = i;
        var(i) = calcula_varianza_entre_clases(T, h, numPix, gmedio);
    end

    [~, indice] = max(var);
    
    T_Otsu = indice-1;   
end