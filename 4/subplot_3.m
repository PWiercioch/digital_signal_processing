function subplot3(t, input1, input2, input3)
    figure()
    subplot(3,1,1)
    plot(t,input1)
    title("n = 5")
    grid on
    subplot(3,1,2)
    plot(t,input2)
    title("n = 50")
    grid on
    subplot(3,1,3)
    plot(t,input3)
    title("n = 100")
    grid on
end
