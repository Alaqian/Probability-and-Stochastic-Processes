% Set the probability for each number will get when throwing 1 dice
D1 = 1/6*ones(1,6); 
D2 = D1; D3 = D2;
% Use conv to calculate the probability for throwing 2 dice.
d1d2 = conv(D1,D2,'full');
% Do another convolution to calculate the probability for throwing 3 dice.
d = conv(d1d2,D3,'full');
% Display table.
Probabilty = [d';sum(d)]; 
Combinations = zeros(1,16)';
for i = 1:6
    for j = 1:6
        for k = 1:6
            Combinations(i+j+k-2) = 1 + Combinations(i+j+k-2);
        end
    end
end
Combinations = [Combinations;sum(Combinations)]; 
Totals = [3:18,"Totals"]';
disp(table(Totals,Combinations, Probabilty))
%Plot the result.
plot ([3:1:18],d,'*');
grid on;
xlabel('Sum of all 3 dice sides');
ylabel('Probability');
title('Probability of Sums');