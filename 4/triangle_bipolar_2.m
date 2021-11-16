function output = square_bipolar_2(A, f, t, n)
    output = 0;
    for n=1:1:n
        if rem(n,2) == 0
            output = output + (2*A)/pi * 1/n*sin(2*pi*t * n*f);
        else
            output = output - (2*A)/pi * 1/n*sin(2*pi*t * n*f);
        end
    end
end

