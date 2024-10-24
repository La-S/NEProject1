%% Function runCustomCompoundNetworkSim()
% Parameters
%  K - the number of packets in the application message
%  p - the probability of failure 
%  N - the number of simulations to run
%
% Returns: the average numeric result across the total simulations

function result = runCustomCompoundNetworkSim(K, p1, p2, p3, N)

        simResults = ones(1,N); % a place to store the result of each simulation
    
    for i=1:N
        txAttemptCount = 0; % transmission count
        pktSuccessCount = 0; % number of packets that have made it across
    
        while pktSuccessCount < K

            hasSucceeded = false;

            while hasSucceeded == false

                r1 = rand; % generate random number to determine if packet is successful (r > p)
                r2 = rand; % generate random number to determine if packet on second link is successful (r > p)
                txAttemptCount = txAttemptCount + 1; % count 1st attempt
          
               % while packet transmissions is not successful (both r1 & r2 < p)
                while r1 < p1 && r2 < p2
                    r1 = rand; % transmit again, generate new success check value r
                    r2 = rand;
                    txAttemptCount = txAttemptCount + 1; % count additional attempt
                end
    
                % Yay, we made the first hop. Now it's do or die...
    
                r = rand; % Let's see if we can make the second hop.
                if r >= p3
                    hasSucceeded = true;
                end

            end

            pktSuccessCount = pktSuccessCount + 1; % increase success count after success (r > p)
        end
    
        simResults(i) = txAttemptCount; % record total number of attempted transmissions before entire application message (K successful packets) transmitted
    end

    result = mean(simResults);
end