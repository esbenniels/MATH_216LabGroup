% Agreed Solution for Gompertz Equation: 
% y = k*e^(-Ce^(-rt))
figure(1);
t = 0:.01:100;
r1 = 0.1;
k = 20;
C = -log(20);
% Gompertz Exact
hold on
y1 = k.*exp(C.*exp(-1*r1.*t));
plot(t, y1);

r2 = 0.05;
y2 = k.*exp(C.*exp(-1*r2.*t));
plot(t, y2);

r3 = 0.025;
y3 = k.*exp(C.*exp(-1*r3.*t));
plot(t, y3);

r4 = 0.0125;
y4 = k.*exp(C.*exp(-1*r4.*t));
plot(t, y4);

axis([0 100 0 20]);
title("Gompertz Exact Solution with Hindered Rate of Growth");
xlabel("Time (t)");
ylabel("Tumor Volume");

legend(["r = 0.1" "r = 0.05" "r = 0.025" "r = 0.0125"]);