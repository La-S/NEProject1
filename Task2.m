xValues = ones(1,99); % a place to store the xValues (aka the 0.01 to 0.99).
yValues = ones(1,99); % a place to store the result of each simulation
yCalcValues = ones(1,99); % a place to store the result of each calculated point
KValues = [1, 5, 15, 50, 100];
Colors = ["r", "black", "g", "b", "m"];
for i = 1:5
    K = KValues(i);
    for j = 1:99
        p = j/100; % prob of failure
        xValues(j) = p;
        yValues(j) = runDoubleLinkSim(K, p, 1000);
        yCalcValues(j) = K/((1-p)^2);
    end

    % Make the chart look good & draw to the individual graph
    figure(i);
    title("K = " + K);
    ylabel("# of Transmissions")
    xlabel("% packets lost")
    set(gca,"YScale", "log");
    hold on
    plot(xValues, yValues, 'o', "Color", Colors(i));
    plot(xValues, yCalcValues, "Color", Colors(i));
    hold off

    % Make the chart look good & draw to the combined graph
    figure(6);
    set(gca,"YScale", "log");
    title("All Values of K");
    ylabel("# of Transmissions")
    xlabel("% packets lost")
    hold on;
    plot(xValues, yValues, 'o', "Color", Colors(i));
    plot(xValues, yCalcValues, "Color", Colors(i));
end