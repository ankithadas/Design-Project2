function dz = thrust(x,u)
    dz = zeros(6,1);
    dz(1:3) = x(4:6);
    Fe = u(1);
    Fs = u(2);
    psi = u(3);
    m = 10;
    g = 9.81;
    J = 5;
    l1 = 1;
    l2 = 1;
    ln = 0.1;
    dz(4) = (Fe*sin(x(3) + psi) + Fs * cos(x(3)))/m;
    if x(3) < 0
        dz(5) = 0;
    else
        dz(5) = (Fe*cos(x(3) + psi) - Fs*sin(x(3)) - m*g)/g;
    end
    dz(6) = (-Fe*sin(psi)*(l1 + ln*cos(psi)) + l2*Fs)/J;
end

