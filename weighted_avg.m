function[final] = weighted_avg(x, L)
    w=gausswin(L);
    s=sum(w,'all');
    bk=w/s;
    final = filter(bk,1,x);
end