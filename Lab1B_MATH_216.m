%Lab 1b: Jacob Cooper 09934300, Esben Nielsen 24610241, Lance Smar 38742026

%% Exercise 1
% Agreed Solution for Gompertz Equation: 
% y = k*e^(-Ce^(-rt))
figure(1);
t = 0:.01:40;
r = 0.1;
k = 20;
C = -log(20);
% Gompertz Exact
y = k.*exp(C.*exp(-1*r.*t));
plot(t, y);
axis([0 40 0 20]);

% Gompertz Numerical
f = @(t,y) r*y.*log(k./y);
[tsol, ysol] = ode45(f, [0,40], 1);
hold on;
plot(tsol, ysol);

% Linear Approximation Exact
t = 0:.01:40;
r = 0.1;
k = 20;
C = -19;
y = C.*exp(-r.*t) + k;
plot(t, y);

% Linear Numerical
f = @(t,y) -r * (y - k);
[tsol, ysol] = ode45(f, [0,40], 1);
plot(tsol, ysol);

legend(["Gompertz Exact" "Gompertz ode45" "Linear Exact" "Linear ode45"]);

% We see minimal to zero difference between our exact solution to the
% Gompertz equation and linear approximation and the numerically generated 
% solutions by ode45. This does give us confidence in the accuracy of the 
% solutions numerically generated by ode45. 

%% Exercise 2
t = 0:.01:40;
r = 0.1;
k = 20;
figure(2);

% Exact Solution to Gompertz when y(0) = 18
C = log(20/18);
y = k.*exp(-1*C.*exp(-1*r.*t));
plot(t, y);
axis([0 40 0 20]);
hold on;

% Exact Solution to Linear Taylor when y(0) = 18
C = -2;
y = C.*exp(-r.*t) + k;
plot(t, y);

% ODE45 of Second-Order Approximation
f = @(t,y) -r * (y - k) - (r/(2*k)).*(y-k).^2;
[tsol, ysol] = ode45(f, [0,40], 18);
plot(tsol, ysol);

legend(["Gompertz Exact" "Linear Taylor Exact" "Quadratic Taylor ode45"]);

% All three solution plots behave extremely similarly overall, from the
% initial condition until they reach y = 20. Near the equilibrium point of
% y = 20, the solutions all behave like the solution to the linear
% approximation, which was y = C*e^(-rt) + k.

%% Exercise 3
figure(3);
r = 0.1;
k = 20;
i = 10;
hold off;

% Derivation of Linear Taylor series approximation around y = 0.1
% f(y) = ryln(K/y)         f(y0) = r * y0 * ln(k/y0)
% f'(y) = r(ln(k/y) - 1)   f'(y0) = r(ln(k/y0)-1)
% f''(y) = -r/y            f''(y0) = -r/y0
% f'''(y) = r/y^2          f'''(y0) = r/y0^2
% Format for Linear Expansion: f(y0) + f'(y0)(y-y0) + 
% f''(y0)/2*(y-y0)^2 + f'''(y0)/6*(y-y0)^3
% T(n=1,r=0.1,k=20) = r*y0*ln(k/y0) + r(ln(k/y0)-1)(y-y0)
% T(n=2,r=0.1,k=20) = r*y0*ln(k/y0) + r(ln(k/y0)-1)(y-y0) - 
% (r/y0)(1/2)(y-y0)^2
% T(n=3,r=0.1,k=20) = r*y0*ln(k/y0) + r(ln(k/y0)-1)(y-y0) - 
% (r/y0)(1/2)(y-y0)^2 + (r/y0^2)(1/6)(y-y0)^3

% T(n=1)
f1 = @(t,y) r*i*log(k/i) + r*(log(k/i)-1).*(y-i);
% T(n=2)
f2 = @(t,y) r*i*log(k/i) + r*(log(k/i)-1).*(y-i) - (r/i)*(1/2).*(y-i).^2;
% T(n=3)
f3 = @(t,y) r*i*log(k/i) + r*(log(k/i)-1).*(y-i) - (r/i)*(1/2).*(y-i).^2 + (r/i^2)/6.*(y-i).^3;

% Plot of T(n=1)
[tsol1, ysol1] = ode45(f1, [0,40], 0.1);
plot(tsol1, ysol1);
hold on;
axis([0 40 0 20]);
% Plot of T(n=2)
[tsol2, ysol2] = ode45(f2, [0,40], 0.1);
plot(tsol2, ysol2);
% Plot of T(n=3)
[tsol3, ysol3] = ode45(f3, [0,40], 0.1);
plot(tsol3, ysol3);

% Gompertz Plot
f4 = @(t,y) r * y * log(k/y);
[tsol4,ysol4] = ode45(f4, [0,40], 0.1);
plot(tsol4,ysol4);

legend(["T(n=1)" "T(n=2)" "T(n=3)" "Gompertz"]);


% The three Taylor series approximations for the Gompertz differential
% equation are not good, as they all deviate significantly from the ode45
% numerical solution. The linear and cubic Taylor series approximations
% increase exponentially and are not asymptotic to the value of k, starting
% to deviate significantly from the gompertz equation around t = 10. The
% quadratic approximation is asymptotic to a value of approximately k/2,
% always underneath the gompertz solution. 

% Solving the differential equation of T(n=1):
% y' = r*y0*log(k/y0) + r*(log(k/y0)-1).*(y-y0)
% Let y0 = 0.1, r = 0.1, k = 1
% dy/dt = 0.01ln(10) + 0.1(ln(10)-1)*(y-0.1)
% dy / (0.1ln(10) + (ln(10) - 1)(y - 0.1)) = r dt
% dy / (0.1 + y(ln(10) - 1)) = r dt
% Int(dy / (0.1 + y(ln(10) - 1))) = Int(rdt)
% ln[0.1 + y(ln(10) - 1)] / (ln(10) - 1) = rt + C
% 0.1 + y(ln(10) - 1) = Ce^((ln(10) - 1)rt)
% y(ln(10) - 1) = Ce^((ln(10) - 1)rt) - 0.1
% y = [Ce^((ln(10) - 1)rt) - 0.1] / (ln(10) - 1)

% The function found here is similar to the function found in Exercise 1,
% an exponential function with horizontal and vertical shifts based on the
% k value and r value. 

% The main difference between these two functions is
% that the exponent of the function from exercise 1 is negative, while the
% exponent from exercise 3 is positive. This means that the exercise 1
% function will converge to a value as t --> infinity, while the exercise 3
% function will go to infinity or negative infinity as t --> infinity. 

% We know that the linear equation should be a good approximation to the
% solution to the full Gompertz equation when the tumor is small, because 
% the Taylor series was generated around y = 0.1 instead of y = k. So, the
% solution to the linear equation tells us that at low volumes, the tumor
% will grow slowly until it reaches a certain volume, after which it will
% grow extremely rapidly. 
