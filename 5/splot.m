function output = splot(input1, input2)
    output = zeros(1, 2*length(input1)-1);
    for n = 1:1:2*length(input1)-1
        if n < length(input1)
            for i = n:-1:1
                output(n) = output(n) + input1(i) * input2(n-i+1)
            end
        else
            n_2 = length(input1) - (n - length(input1))
            output(n) = output(n_2)
        end
    end
end

