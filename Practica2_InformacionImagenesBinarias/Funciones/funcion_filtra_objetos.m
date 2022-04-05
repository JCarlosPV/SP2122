function IbFilt = funcion_filtra_objetos (Ib , numPix)
    [IEtiq N] = funcion_etiquetar(Ib);
    areas = funcion_calcula_areas(IEtiq, N);
    IbFilt = IEtiq;
    
    for i = 1:N
       if areas(i) < numPix 
           IbFilt(IEtiq==i) = 0;
       end
    end
end
