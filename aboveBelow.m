r = 0.1;
k = 20;
i1 = 0.1;
i2 = 35;

figure(7);
f1 = @(t,y) -1*r*(y-k);
f2 = @(t,y) r*y*log(k/y);

[tsol1,ysol1] = ode45(f1, [0,40], i1);
plot(tsol1, ysol1, "Linewidth", 2);
hold on;
[tsol2,ysol2] = ode45(f1, [0,40], i2);
plot(tsol2, ysol2, "Linewidth", 2);
[tsol3,ysol3] = ode45(f2, [0,40], i1);
plot(tsol3, ysol3, "Linewidth", 2);
[tsol4,ysol4] = ode45(f2, [0,40], i2);
plot(tsol4, ysol4, "Linewidth", 2);

legend(["Linear y(0) = 0.1" "Linear y(0) = 35" "Gompertz y(0) = 0.1" "Gompertz y(0) = 35"]);
axis([0 40 0 40]);
xlabel("Time (t)"); ylabel("Tumor Volume"); title("Linear and Gompertz ode45 Solutions with Varying Initial Conditions");