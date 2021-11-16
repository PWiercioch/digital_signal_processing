function output = square_unipolar_filled(A, f, t, n, tau)
    T = (1/f);
    output = A/T*tau;
    for k=1:1:n
        output = output + (2*A*tau)/T * sin(pi * k *tau/T)/(pi * k *tau/T) * cos(k*2*pi*f*t);
    end
end
