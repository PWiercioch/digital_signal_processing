function output = srednia(t, sygnal)
    suma = 0;
    for n=1:1:length(sygnal)
        suma = suma + sygnal(n);
    end
    
    output = suma/(t(end) - t(1));
end

