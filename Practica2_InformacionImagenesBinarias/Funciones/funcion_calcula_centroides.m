function centroides = funcion_calcula_centroides (IEtiq, N)
    
    x_N = IEtiq == 1;
    [nF, nC] = find(x_N);
    X = mean(nC); Y = mean(nF);
    centroides = [X, Y];
    
    for i = 2:N
        x_N = IEtiq == i;
        [nF, nC] = find(x_N);
        X = mean(nC); Y = mean(nF);
        centroides = [centroides; X, Y]; 
    end
end