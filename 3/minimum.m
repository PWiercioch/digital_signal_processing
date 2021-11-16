function output = minimum(input)
    output = input(1);
    for n=2:1:length(input)
        if input(n) < output
           output = input(n);
        end
    end
end

