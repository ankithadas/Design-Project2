clear
clc

mr = 0.257;
mp = 0.127;
Lr = 0.085;
Lp = 0.129;
Jr = 0.0020;
Jp = 0.0012;
Kt = 0.042;
Rm = 8.40;
Dr = 0.0015;
Dp = 0.0005;
k = 0.017;
g = 9.81;
ng = 0.9;
nm = 0.69;
Kg = 70;
Kt = 7.68e-3;
km = 7.68e-3;
n = ng*nm;
%%
JT = Jp * mp * Lr^2 + Jr* Jp + 1/4*Jr*mp*Lp^2;

A = 1/JT *[zeros(2,2),JT*eye(2,2);...
    0 ,1/4 * mp^2 *Lp^2*Lr*g, -(Jp + 1/4 *mp*Lp^2)*Dr, -1/2*mp*Lr*Lp*Dp;...
    0,1/2 *mp*Lp*g*(Jr + mp*Lr^2),-1/2*mp*Lp*Lr*Dr, -(Jr +mp*Lr^2)*Dp];
B = 1/JT * [0;0; Jp+1/4*mp*Lp^2;1/2 * mp*Lp *Lr];
C = eye(2,4);
D = zeros(2,1);
A(3,3) = A(3,3) - nm*ng*Kg^2*Kt*km/Rm*B(3);
A(4,3) = A(4,3) - nm*ng*Kg^2*Kt*km/Rm*B(4);
B = ng*nm*Kg*Kt /Rm *B;
model = ss(A,B,C,D);
%step(model)

%%
p = [-2 + 2.04j,-2 - 2.04j,-30,-40];
K = place(A,B,p);

L = place(A',C',[-4,-4.5,-5,-5.5])';

%%
t = out.lin.time;
lin = out.lin.signals.values(:,1:2);
noLi = out.noLi.signals.values(:,1:2);

figure(1)
plot(t,lin(:,2),'Linewidth',1.5);
hold on
plot(t,noLi(:,2),'Linewidth',1.5);
grid on 
legend('Linear','Non-Linear');
ylabel('\alpha [rad]');
xlabel('Time [s]');

%% Printing and making figures 
% noLi = out.noLi.signals.values(:,1:2);
% t = out.noLi.time;
% rsig = out.ref.signals.values(:,1);
% figure(1)
% plot(t,rsig*180/pi,'k--');
% hold on
% plot(t,noLi(:,1),'Linewidth',1.5);
% 
% plot(t,noLi(:,2),'Linewidth',1.5);
% legend('Reference','\theta','\alpha','Location','southeast');
% grid on 
% ylabel('Angle [deg]');
% xlabel('Time [s]');
% 
% figure(2)
% cont = out.cont.signals.values;
% plot(t,cont,'Linewidth',1.5);
% grid on
% ylabel('Voltage [V]');
xlabel('Time [s]');