function v = VECINOS(L, P, Ibin)
    v = [Ibin(L-1:2:L+1, P)' Ibin(L, P-1:2:P+1)];
end