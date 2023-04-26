r = 0.1;
k = 20;
i1 = 0.1;

f = @(t,y) r*y*log(k/y);
f2 = @(t,y) r.*y.*log(k/y).*(-1*(t-k)^(1/3));

[tsol1, ysol1] = ode45(f, [0,40], i1);
plot(tsol1, ysol1, "Linewidth", 2);
hold on;
[tsol2, ysol2] = ode45(f2, [0,40], i1);
plot(tsol2, ysol2, "Linewidth", 2);

legend(["Gompertz Numerical" "Additional Term Gompertz"]);
xlabel("Time (t)"); ylabel("Tumor Volume");