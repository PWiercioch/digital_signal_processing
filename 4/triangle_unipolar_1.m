function output = triangle_unipolar_1(A, f, t, n)
    output = A/2;
    for k=0:1:n
        output = output - (4*A)/pi^2 * 1/(2*k + 1)^2 * cos((2*k + 1) * 2*pi*f*t);
    end
end

