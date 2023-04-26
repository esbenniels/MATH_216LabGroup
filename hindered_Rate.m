figure(1);
% chosen values for r and k
r1 = 1;
r2 = 2;
r3 = 3;
r4 = 4;
k = 20;
% gompertz equation plotted with r=1 and k=3
f = @(t,y) r1*y.*log(k./y);
[tsol, ysol] = ode45(f, [0,5], 1);
plot(tsol, ysol, "Linewidth", 2)

hold on;
% gompertz equation plotted with r=2 and k=3
f = @(t,y) r2*y.*log(k./y);
[tsol, ysol] = ode45(f, [0,5], 1);
plot(tsol, ysol, "Linewidth", 2)
% gompertz equation plotted with r=1 and k=4
f = @(t,y) r3*y.*log(k./y);
[tsol, ysol] = ode45(f, [0,5], 1);
plot(tsol, ysol, "Linewidth", 2)
% gompertz equation plotted with r=2 and k=4
f = @(t,y) r4*y.*log(k./y);
[tsol, ysol] = ode45(f, [0,5], 1);
plot(tsol, ysol, "Linewidth", 2);

% Legend
legend('r=1', 'r=2', 'r=3', 'r=4');
title("Gompertz ode45 Solutions with Various r Values");
xlabel("Time (t)"); ylabel("Tumor Volume");