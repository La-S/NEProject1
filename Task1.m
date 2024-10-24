xValues = ones(1,99); % a place to store the result of each simulation
yValues = ones(1,99); % a place to store the result of each simulation
yCalcValues = ones(1,99); % a place to store the result of each simulation
KValues = [1, 5, 15, 50, 100];
Colors = ["r", "black", "g", "b", "m"];
for i = 1:5
    K = KValues(i);
    for j = 1:99
        p = j/100; % prob of failure
        xValues(j) = p;
        yValues(j) = runSingleLinkSim(K, p, 1000);
        yCalcValues(j) = K/((1-p));
    end
    figure(i);
    set(gca,"YScale", "log");
    hold on
    plot(xValues, yValues, 'o', "Color", Colors(i));
    plot(xValues, yCalcValues, "Color", Colors(i));
    hold off
    figure(6);
    hold on;
    plot(xValues, yValues, 'o', "Color", Colors(i));
    plot(xValues, yCalcValues, "Color", Colors(i));
end
figure(6);
set(gca,"YScale", "log");
hold off;
% Goal: 6 plots. 5 -- 1 for each individual. 1 -- all the rest.