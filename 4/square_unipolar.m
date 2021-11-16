function output = square_unipolar(A, f, t, n)
    output = A/2;
    for n=1:1:n
        output = output + (2*A)/pi * 1/(2*n-1)*sin(2*pi*t * (2*n - 1)*f);
    end
end
