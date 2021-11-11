function output = my_convolution(input1, input2)
    output = zeros(1, 2*length(input1)-1);

    for n = 1:1:length(output)
        if n <= length(input1)
            for i = n:-1:1
                output(n) = output(n) + input2(i) * input1(n-i+1);
            end
        else
            input1(1) = []
            input2(1) = []
            for i = 1:1:length(input1)
                output(n) = output(n) + input1(i) * input2(end-i+1)
            end
        end
    end
end

