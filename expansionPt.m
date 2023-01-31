r = 0.1;
k = 20;
i1 = 0.1;
i2 = 1;
i3 = 10;
i4 = k;

f1 = @(t,y) r*i1*log(k/i1) + r*(log(k/i1)-1).*(y-i1);
f2 = @(t,y) r*i2*log(k/i2) + r*(log(k/i2)-1).*(y-i2);
f3 = @(t,y) r*i3*log(k/i3) + r*(log(k/i3)-1).*(y-i3);
f4 = @(t,y) r*i4*log(k/i4) + r*(log(k/i4)-1).*(y-i4);
f5 = @(t,y) r*y*log(k/y);

[tsol1, ysol1] = ode45(f1, [0,40], 0.1);
plot(tsol1, ysol1, "Linewidth", 2);
hold on;
[tsol2, ysol2] = ode45(f2, [0,40], 0.1);
plot(tsol2, ysol2, "Linewidth", 2);
[tsol3, ysol3] = ode45(f3, [0,40], 0.1);
plot(tsol3, ysol3, "Linewidth", 2);
[tsol4, ysol4] = ode45(f4, [0,40], 0.1);
plot(tsol4, ysol4, "Linewidth", 2);
[tsol5, ysol5] = ode45(f5, [0,40], 0.1);
plot(tsol5, ysol5, "Linewidth", 2);
axis([0 40 0 20]);
legend(["T(a=0.1)" "T(a=1)" "T(a=10)" "T(a=k)" "Gompertz"]);
xlabel("Time (t)"); ylabel("Tumor Volume");
title("Linear Taylor of Various Expansion Points vs Gompertz");