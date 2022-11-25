function[final] = weighted_avg(x, L)
    w=gausswin(L);
    s=sum(w,'all');
    bk=w/s;
    final = filter(bk,1,x);
end

%x=1:length(final);
%plot(x,final)
%plot(win_arr,sad,'b*-', 'LineWidth', 2);
%grid on;