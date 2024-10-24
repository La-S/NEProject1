xValues = ones(1,99); % a place to store the result of each simulation
yValues = ones(1,99); % a place to store the result of each simulation
yCalcValues = ones(1,99); % a place to store the result of each simulation
KValues = [1, 5, 10];
Colors = ["r", "black", "g", "b", "m", "y"];
P1Values = [0.1, 0.6, 0.1, 0.6, -1, -1];
P2Values = [0.6, 0.1, -1, -1, 0.1, 0.6];
P3Values = [-1, -1, 0.6, 0.1, 0.6, 0.1];
for i = 1:6
    p1 = P1Values(i);
    p2 = P2Values(i);
    p3 = P3Values(i);
    for j = 1:3
        K = KValues(j);
    
        for k = 1:99
            p = k/100;
            xValues(k) = p;
            disp(p)
            if P1Values(i) == -1
                p1 = p;
            end
            if P2Values(i) == -1
                p2 = p;
            end
            if P3Values(i) == -1
                p3 = p;
            end

            disp("p1: "+p1+" p2: "+p2+" p3: "+p3);

            yValues(k) = runCustomCompoundNetworkSim(K, p1, p2, p3, 1000);
            yCalcValues(k) = K / (( 1 - p1 * p2) * (1-p3));
        end
        figure(i);
        set(gca,"YScale", "log");
        hold on
        plot(xValues, yValues, 'o', "Color", Colors(i));
        plot(xValues, yCalcValues, "Color", Colors(i));
        hold off
    end
end