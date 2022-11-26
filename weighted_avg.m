%takes in input parameters of sampled audio file and desired window size
function[final] = weighted_avg(x, L)
    %produces the gaussian coefficient ak based on normal distribution 
    % of the window size
    w=gausswin(L);
    %sums up all the gaussian values
    s=sum(w,'all');
    %divides each gaussian value by sum total to produce final weighted
    %coefficient bk
    bk=w/s;
    %produces final output signal based on input sampled signal and bk
    %coefficient for each sample value of the input signal
    final = filter(bk,1,x);
end