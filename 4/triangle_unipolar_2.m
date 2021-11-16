function output = triangle_unipolar_2(A, f, t, n)
    output = A/2;
    for k=1:1:n
        output = output - A/pi * sin(k * 2*pi*f*t)/k;
    end
end

