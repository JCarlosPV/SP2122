function [IEtiq, N] = funcion_etiquetar(Ib)
    [NLINEAS, NPIXELES] = size(Ib);
    IEtiq = zeros(NLINEAS+2, NPIXELES+2);
    IEtiq(2:NLINEAS+1, 2:NPIXELES+1) = Ib;

    N = 1;
    for L = 2:NLINEAS+1
        for P = 2:NPIXELES+1
            if Ib(L-1, P-1) == 1
               IEtiq(L, P) = N;
               N = N + 1;
            else
                IEtiq(L, P) = 0;
            end
        end
    end
    
    CAMBIO = 0;
    while CAMBIO == 0
        CAMBIO = 1;
        for L = 2:NLINEAS+1
            for P = 2:NPIXELES+1
                if IEtiq(L, P) ~= 0
                    aux = IEtiq(L-1:L, P-1:P); %Realiza matrices 2x2 de [0 0; 0 1] esta forma
                    aux = min(aux(aux>0)); %De los posibles valores de la matriz mayores que 0, 
                                           %coge el mínimo
                    M = min(aux, IEtiq(L, P));
                    if M ~= IEtiq(L, P)
                       CAMBIO = 0;
                       IEtiq(L, P) = M; 
                    end
                end
            end
        end
        
        for L = NLINEAS+1:-1:2
            for P = NPIXELES+1:-1:2
                if IEtiq(L, P) ~= 0
                    aux = IEtiq(L:L+1, P:P+1); %Realiza matrices 2x2 de [0 0; 0 1] esta forma
                    aux = min(aux(aux>0)); %De los posibles valores de la matriz mayores que 0, 
                                           %coge el mínimo
                    M = min(aux, IEtiq(L, P));
                    if M ~= IEtiq(L, P)
                       CAMBIO = 0;
                       IEtiq(L, P) = M; 
                    end
                end
            end
        end
    end
    
    Iaux = unique(IEtiq); %Vector columna de números únc
    NLINEAS = size(Iaux, 1);
    N = NLINEAS - 1;
    etiqueta=1;
    
    for L = 2:NLINEAS
        numero = IEtiq == Iaux(L, 1);
        IEtiq(numero) = etiqueta;
        etiqueta = etiqueta + 1;
    end 
end
