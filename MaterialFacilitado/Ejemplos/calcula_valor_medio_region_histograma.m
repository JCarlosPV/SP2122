function [gMean, numPix] = calcula_valor_medio_region_histograma(h, gIni, gFin)
    gIni = round(gIni); gFin = round(gFin);
    
    numPix = sum(h(gIni:gFin));
    
    if numPix > 0
        aux = 0;
        %Recorre las posiciones del histograma contando todos los pixeles que
        %hay en ese determinado nivel de gris 
        for g = gIni:gFin
            aux = aux + g*h(g);
        end
        %Dividimos entre el numero de pixeles que hay en dicha zona
        gMean = aux / numPix;
    else
        gMean = [];
    end
end