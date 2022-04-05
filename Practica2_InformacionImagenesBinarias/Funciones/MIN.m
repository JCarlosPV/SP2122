function v = MIN(Matriz, Entero)
    
    [nF, nC] = size(Matriz);
    aux = inf;
    for i = 1:nF
        for j = 1:nC
            if Matriz(i, j)<aux && Matriz(i, j) ~= 0
                aux = Matriz(i, j);
            end
        end
    end
    v = min(aux, Entero);
end
