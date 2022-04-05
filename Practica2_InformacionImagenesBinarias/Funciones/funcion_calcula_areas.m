function areas = funcion_calcula_areas (IEtiq, N)
    for i = 1:N
       x_N = IEtiq == i;
       areas(i) = sum(x_N(:));
    end
    areas = areas';
end
