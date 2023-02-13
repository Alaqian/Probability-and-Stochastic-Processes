% Input: n = # peg rows, m = # simulations, output is a plot. 
% Set up counters for each location.
n = 12; m = 3000;
count = zeros(1,n+1);
% Do m simluations, p tracks the location of the ball; starts at 1.
for k=1:m 
  p = 1; 
  for j=1:n 
      if rand > 0.5
          p = p+1; % at each peg go right (p=p+1) or left (p=p)
      end
  end
  count(p) = count(p)+1; % ball at bottom, location p, add to count(p)
end
% Compute the expected values according to the formula.
count2 = zeros(1,n+1);
for j=0:n
  count2(j+1) = factorial(n)/(2^n*factorial(j)*factorial(n-j));
end
% Produce a plot of simulation against probabilities. 
% Note: divide simulations by total number of balls.
x = 1:n+1; 
plot(x,count/m,'*',x,count2,'-')
grid on;
title('Galtonts Board Simulation');
ylabel('Probability');
xlabel('Peg Row');
xlim([1,n+1])