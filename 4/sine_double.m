function output = sine_double(A, f, t, n)
    output = (2*A/pi).*ones(1,length(t));;
    for n=1:1:n
        output = output -(4*A/pi)*((cos(2*n*2*f*pi*t))/(4*n^2-1));
    end
end

