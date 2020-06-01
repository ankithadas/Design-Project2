function dx = nonLinear(x,u)

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
    
    dx = zeros(4,1);
    theta = x(1);
    alpha = x(2);
    dtheta = x(3);
    dalpha = x(4);

    A1 = Jr+Lr^2*mp+1/4*Lp^2*mp*sin(alpha)^2;
    A2 = -(1/2)*Lp*Lr*mp*cos(alpha);
    B1 = A2;
    B2 = Jp + (Lp^2*mp)/4;

    A3 = 1/4*Lp^2*mp*sin(2*alpha) *dalpha;
    A4 = 1/2*Lp*Lr*mp*sin(alpha);
    B3 = -(1/8)*Lp^2*mp*sin(2*alpha) *dtheta;
    
    B4 = -(1/2)*g*Lp*mp*sin(alpha);

    H = [A1, A2; B1,B2];
    C = [A3, A4;B3,0];
    G = [0;B4];

    tau = ng*Kg*nm*Kt*(u - Kg*km*dtheta)/Rm;

    B = [(tau-Dr*dtheta); -Dp*dalpha];

    dx(1:2) = x(3:4);
    dx(3:4) = H \ (-C * x(3:4) - G + B);
    
end