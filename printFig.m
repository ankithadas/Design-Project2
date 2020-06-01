sys = sprintf('makeFigs');
print(['-s' sys],'-dsvg','linearSysWithO');

%%
t = out.x_hat.time;
y = out.y.signals.values;
x_hat = out.x_hat.signals.values;

figure
plot(t,y(:,1),'Linewidth',0.5);
hold on
plot(t,y(:,2),'Linewidth',0.5)
plot(t,x_hat(:,1)*180/pi,'r--','Linewidth',2);
plot(t,x_hat(:,2)*180/pi,'k--','Linewidth',2)
grid on 
axis tight 
xlabel('Time [s]');
ylabel('Angle [deg]');
legend('$\theta$','$\alpha$','$\hat\theta$','$\hat\alpha$','Interpreter','latex');

%%
sys = sprintf('makeFigs');
print(['-s' sys],'-dsvg','SwingUpSystemNonLin');
%%
sys = sprintf('makeFigs/Swing\nUp\nController/Energy\nbased\nControl');
print(['-s' sys],'-dsvg','EnergyControl');

%%
sys = sprintf('makeFigs/Swing\nUp\nController');
print(['-s' sys],'-dsvg','SwingUp');

%%
t = out.y.time;
y = out.y.signals.values;
u = out.u.signals.values;
figure
plot(t,y(:,1)*180/pi,'Linewidth',2);
hold on
plot(t,y(:,2)*180/pi,'Linewidth',2)
grid on 
axis tight
legend('$\theta$','$\alpha$','Interpreter','latex');
xlabel('Time [s]');
ylabel('Angle [deg]');

%%
figure
plot(t,u,'Linewidth',1);
grid on 
axis tight
ylim([-7,7]);
xlabel('Time [s]');
ylabel('Voltage [V]');

%%
sys = sprintf('makeFigs/Non\nLinear\nObserver');
print(['-s' sys],'-dsvg','NonLinearObserver');

%%
t = out.x_hat.time;
x = out.x.signals.values;
x_hat = out.x_hat.signals.values;

figure
plot(t,x(:,1)*180/pi,'Linewidth',2);
hold on
plot(t,x(:,2)*180/pi,'Linewidth',2)
plot(t,x_hat(:,1)*180/pi,'r--','Linewidth',2);
plot(t,x_hat(:,2)*180/pi,'g--','Linewidth',2)
grid on 
axis tight 
xlabel('Time [s]');
ylabel('Angle [deg]');
legend('$\theta$','$\alpha$','$\hat\theta$','$\hat\alpha$','Interpreter','latex');
%legend('$\dot\theta$','$\dot\alpha$','$\frac{d \hat\theta}{dt}$','$\frac{d \hat\alpha}{dt}$','Interpreter','latex');
xlim([0,5]);