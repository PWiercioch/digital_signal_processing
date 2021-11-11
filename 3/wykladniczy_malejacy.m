function output = wykladniczy_malejacy(t, X0, alfa)
    output = [];
    
    for n=1:1:length(t)
        if t >= 0
            output(n) = X0*exp(-alfa*t(n));
        else
            output(n) = 0;
        end
    end
    
end

