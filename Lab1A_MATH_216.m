%Lab 1a: Jacob Cooper 09934300, Esben Nielsen 24610241, Lance Smar 38742026
%% Excerise 1
figure(1);
% chosen values for r and k
r1 = 1;
r2 = 2;
k1 = 3;
k2 = 4;
% gompertz equation plotted with r=1 and k=3
f = @(t,y) r1*y.*log(k1./y);
[tsol, ysol] = ode45(f, [0,5], 1);
plot(tsol, ysol, "Linewidth", 2)

hold on;
% gompertz equation plotted with r=2 and k=3
f = @(t,y) r2*y.*log(k1./y);
[tsol, ysol] = ode45(f, [0,5], 1);
plot(tsol, ysol, "Linewidth", 2)
% gompertz equation plotted with r=1 and k=4
f = @(t,y) r1*y.*log(k2./y);
[tsol, ysol] = ode45(f, [0,5], 1);
plot(tsol, ysol, "Linewidth", 2)
% gompertz equation plotted with r=2 and k=4
f = @(t,y) r2*y.*log(k2./y);
[tsol, ysol] = ode45(f, [0,5], 1);
plot(tsol, ysol, "Linewidth", 2);

% Legend
legend('r=1, k=3', 'r=2, k=3', 'r=1, k=4', 'r=2, k=4');
title("Gompertz ode45 Solutions with Various r and k Values");
xlabel("Time (t)"); ylabel("Tumor Volume");
hold off
% Equilibrium Solutions:
% Answer: In each case, the equilibrium solution appears to be equal to the
% k value included in the equation.

% For function1 (r = 1, k = 3): the equilibrium solution was y = 3
% For function1 (r = 2, k = 3): the equilibrium solution was y = 3
% For function1 (r = 1, k = 4): the equilibrium solution was y = 4
% For function1 (r = 2, k = 4): the equilibrium solution was y = 4

% R determines the initial growth rate of the function, while K models the
% equilibrium value that the equation reaches. 

%% Exercise 2 
figure(2);
r = .1;
K = 20;
hold on

% Gompertz equation
f = @(t,y) r*y.*log(K ./ y);
% ode45 plots of the solution to the Gompertz equation with various
% initial conditions
[tsol, ysol] = ode45(f, [0,30], .1);
plot(tsol, ysol, "Linewidth", 2)

[tsol, ysol] = ode45(f, [0,30], 1);
plot(tsol, ysol, "Linewidth", 2)

[tsol, ysol] = ode45(f, [0,30], 8);
plot(tsol, ysol, "Linewidth", 2)

[tsol, ysol] = ode45(f, [0,30], 10);
plot(tsol, ysol, "Linewidth", 2)

[tsol, ysol] = ode45(f, [0,30], 20);
plot(tsol, ysol, "Linewidth", 2)

% Graphing the right hand side of the Gompertz equation 
rhs = @(y)r*y .* log(K./y);
yvals = 0:0.1:30;
plot(yvals, rhs(yvals), '-k', [0,30], [0 0], '--k', "Linewidth", 2);

title("Gompertz ode45 Solution with Various Initial Conditions");
xlabel("Time (t)"); ylabel("Tumor Volume");
axis([0 30 0 20]);
legend(["y0 = 0.1" "y0 = 1" "y0 = 8" "y0 = 10" "y0 = 20" "Gompertz RHS"]);

hold off;


% Yes, different initial conditions can change concavity and growth rate of
% the function. The black graph represents the derivative, and its maximum
% y value at x = 7.3 is where the solution is changing the fastest. This is
% what we see in the graph.

%% Exercise 3
figure(3);

r= 0.1;
K = 20;
hold on;
% Graphing ode45 solution to the Taylor Series approximation of the 
% Gompertz equation truncated at n = 1
f = @(t,y) -r*(y-K);
[tsol, ysol] = ode45(f, [0,50], .1);
plot(tsol, ysol, "Linewidth", 2)
i=0.1;
k=20;
f = @(t,y) r*i*log(k/i) + r*(log(k/i)-1).*(y-i);
[tsol, ysol] = ode45(f, [0,50], .1);
plot(tsol, ysol, "Linewidth", 2)
% Graphing ode45 solution to the Taylor Series approximation of the 
% Gompertz equation truncated at n = 2
%f = @(t,y) -r/(2*K)*(y-K).^2 -r*(y-K);
%[tsol, ysol] = ode45(f, [0,50], .1);
%plot(tsol, ysol)
% Graphing ode45 solution to the Gompertz equation for comparison
f = @(t,y) r*y.*log(K./y);
[tsol, ysol] = ode45(f, [0,50], .1);
plot(tsol, ysol, "Linewidth", 2)

axis([0 40 0 20]);
title("Linear Approximation ode45 Solution vs Gompertz ode45 Solution");
xlabel("Time (t)"); ylabel("Tumor Volume");
legend(["Linear ode45 a=k" "Linear ode45 a=0.1" "Gompertz ode45"]);

% Solutions are most similar close to the line y = K. The solutions are all
% the same at t=0, but with differing rates of growth. At t = 0, the 
% initial rate of growth of the Gompertz equation is much less than the 
% initial rate of growth of the approximations.

% Graphing right hand side of Gompertz Taylor series approximation with n=1
figure(4)
r = 0.1;
K = 20;
y = 0:.01:20;
plot(y, -r * (y-K), "Linewidth", 2);
hold on;
% Graphing right hand side of Gompertz Taylor series approximation with n=2
plot(y, (-r*(y-K)) - (r/2*K)*(y-K).^2, "Linewidth", 2);
% Graphing right hand side of Gompertz equation for comparison
plot(y, r.*y.*log(K./y), "Linewidth", 2);
axis([0 20 -7 7]);
title("Linear and Quadratic RHS vs Gompertz RHS");
xlabel("Time (t)"); ylabel("Tumor Volume");
legend(["RHS of Linear Series" "RHS of Quadratic Series" "RHS of Gompertz"]);

% All of the right hand sides of the equations converge at y=20. The two
% approximations are very close to each other at t = 0 while the Gompertz
% RHS starts low and increases to meet the other two curves. The
% approximations are also much closer to being constant. 