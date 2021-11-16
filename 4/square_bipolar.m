function output = square_bipolar(A, f, t, n)
    output = 0;
    for n=1:1:n
        output = output + (4*A)/pi * 1/(2*n-1)*sin(2*pi*t * (2*n - 1)*f);
    end
end

