function var = calcula_varianza_entre_clases(T, h, numPix, gMedio)
    gIni = 1; gFin = round(T);
    [gmean1, numPix1] = calcula_valor_medio_region_histograma(h, gIni, gFin);
    
    gIni = round(T) + 1; gFin = 256;
    [gmean2, numPix2] = calcula_valor_medio_region_histograma(h, gIni, gFin);
    
    if numPix1 * numPix2 == 0
        var = 0;
    else
        v1 = numPix1 / numPix;
        v2 = numPix2 / numPix;
        var = v1*(gmean1 - gMedio)^2 + v2*(gmean2 - gMedio)^2;
    end
end