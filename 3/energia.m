function output = energia(sygnal)
    suma = 0;
    for n=1:1:length(sygnal)
        suma = suma + sygnal(n)^2;
    end
    
    output = suma;
end

