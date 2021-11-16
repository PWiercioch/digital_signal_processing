function output = triangle_bipolar_1(A, f, t, n)
    output = 0;
    for n=1:1:n
        if rem(n,2) == 0
            output = output + (8*A)/pi^2 * 1/(2*n-1)^2*sin(2*pi*t * (2*n - 1)*f);
        else
            output = output - (8*A)/pi^2 * 1/(2*n-1)^2*sin(2*pi*t * (2*n - 1)*f);
        end
    end
end

