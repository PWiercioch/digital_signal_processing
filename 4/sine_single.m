function output = sine_single(A, f, t, n)
    output =((A/pi)+(A/2)*(sin(2*pi*f*t))).*ones(1,length(t));
    for n=1:1:n
        output = output -(2*A/pi)*((cos(2*n*2*f*pi*t))/(4*n^2-1));
    end
end

