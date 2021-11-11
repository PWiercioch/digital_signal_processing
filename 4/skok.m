function output = skok(input)
    for n = 1:1:length(input)
        if input(n) < 0
            output(n) = 0;
        elseif input(n) == 0
            output(n) = 0.5;
        else 
            output(n) = 1;
        end
    end
end

