xValues = ones(1,99); % a place to store the xValues (aka the 0.01 to 0.99).
yValues = ones(1,99); % a place to store the result of each simulation
yCalcValues = ones(1,99); % a place to store the result of each calculated point
KValues = [1, 5, 10];
Colors = ["r", "black", "g", "b", "m", "y"]; % the colors of the results.
P1Values = [0.1, 0.6, 0.1, 0.6, -1, -1];
P2Values = [0.6, 0.1, -1, -1, 0.1, 0.6];
P3Values = [-1, -1, 0.6, 0.1, 0.6, 0.1];

for i = 1:6
    p1 = P1Values(i);
    p2 = P2Values(i);
    p3 = P3Values(i); % Get the value of p.
    for j = 1:3
        K = KValues(j);
    
        for k = 1:99
            p = k/100;
            xValues(k) = p;
            % p = -1 is the signifier that that is the one to do 1-99% on.
            if P1Values(i) == -1
                p1 = p;
            end
            if P2Values(i) == -1
                p2 = p;
            end
            if P3Values(i) == -1
                p3 = p;
            end

            % Get the simulated and calculated values.
            yValues(k) = runCustomCompoundNetworkSim(K, p1, p2, p3, 1000);
            yCalcValues(k) = K / (( 1 - p1 * p2) * (1-p3)); 
        end

        % Draw the chart.
        figure(i);
        title("Custom Compound Figure "+i)
        ylabel("# of Transmissions")
        if P1Values(i) == -1
            xlabel("p1: 1-99% p2: "+(p2*100)+"% p3: "+(p3*100)+"%")
        end
        if P2Values(i) == -1
            xlabel("p1: "+(p1*100)+"% p2: 1-99% p3: "+(p3*100)+"%")
        end
        if P3Values(i) == -1
            xlabel("p1: "+(p1*100)+"% p2: "+(p2*100)+"% p3: 1-99%")
        end
        
        set(gca,"YScale", "log");
        hold on
        plot(xValues, yValues, 'o', "Color", Colors(i));
        plot(xValues, yCalcValues, "Color", Colors(i));
        hold off
    end
end