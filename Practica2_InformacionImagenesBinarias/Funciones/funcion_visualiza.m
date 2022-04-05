function Io = funcion_visualiza(Ii, Ib, color, flagRepresenta)
    comp = size(Ii, 3);
    if comp == 3 
        %Puesto que es color, tiene 3 componentes y hay que tratar la
        %matriz por matriz color, por lo tanto, se divide.
        R = Ii(:, :, 1);
        G = Ii(:, :, 2);
        B = Ii(:, :, 3);
        
        R(Ib == 1) = color(1);
        G(Ib == 1) = color(2);
        B(Ib == 1) = color(3);
        
    else
        %Puesto que necesitamos una imagen con colores, necesitaremos 3
        %matrices (R, G y B) iguales a la inicial.
        R = Ii;
        G = Ii;
        B = Ii;        
        
        R(Ib == 1) = color(1);
        G(Ib == 1) = color(2);
        B(Ib == 1) = color(3);
        
    end
    
    Io = cat(3, R, G, B);
    
    if flagRepresenta
       figure, imshow(Io); 
    end

end