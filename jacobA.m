function [A,B] = jacobA(x,u)

    % Constants
    mr = 0.257;
    mp = 0.127;
    Lr = 0.085;
    Lp = 0.129;
    Jr = 0.0020;
    Jp = 0.0012;
    Kt = 0.042;
    Rm = 8.40;
    Br = 0.0015;
    Bp = 0.0005;
    k = 0.017;
    g = 9.81;
    ng = 0.9;
    nm = 0.69;
    Kg = 70;
    Kt = 7.68e-3;
    km = 7.68e-3;
    n = ng*nm;

    % These matrices were computed in mathematica 
    A = [0,0,1,0;0,0,0,1;0,Lp.*mp.*Rm.^(-1).*((-4).*Lp.^2.*Lr.^2.*mp.^2.*cos(x(2)).^2+(4.*Jp+Lp.^2.*mp).*(4.*(Jr+Lr.^2.*mp)+Lp.^2.*mp.*sin(x(2)).^2)).^(-2).*((1/2).*Rm.*((-4).*Lp.^2.*Lr.^2.*mp.^2.*cos(x(2)).^2+(4.*Jp+Lp.^2.*mp).*(4.*(Jr+Lr.^2.*mp)+Lp.^2.*mp.*sin(x(2)).^2)).*(Lp.*Lr.*mp.*(8.*g.*cos(2.*x(2))+Lp.*(cos(x(2))+3.*cos(3.*x(2))).*x(3).^2)+4.*((-1).*Lr.*(4.*Jp+Lp.^2.*mp).*cos(x(2))+4.*Bp.*Lr.*sin(x(2))+(-1).*Lp.*(4.*Jp+Lp.^2.*mp).*cos(2.*x(2)).*x(3)).*x(4))+(-1).*Lp.*(4.*Jp+(Lp.^2+4.*Lr.^2).*mp).*sin(2.*x(2)).*(Lp.^3.*Lr.*mp.^2.*Rm.*cos(x(2)).*sin(2.*x(2)).*x(3).^2+(-2).*Lp.*Lr.*mp.*Rm.*((-1).*g.*Lp.*mp.*sin(2.*x(2))+(4.*Bp.*cos(x(2))+(4.*Jp+Lp.^2.*mp).*sin(x(2))).*x(4))+(-1).*(4.*Jp+Lp.^2.*mp).*x(3).*(4.*Kg.^2.*km.*Kt.*n+4.*Br.*Rm+Lp.^2.*mp.*Rm.*sin(2.*x(2)).*x(4))+4.*Kg.*Kt.*(4.*Jp+Lp.^2.*mp).*n.*u)),Rm.^(-1).*((-4).*Lp.^2.*Lr.^2.*mp.^2.*cos(x(2)).^2+(4.*Jp+Lp.^2.*mp).*(4.*(Jr+Lr.^2.*mp)+Lp.^2.*mp.*sin(x(2)).^2)).^(-1).*(4.*Lp.^3.*Lr.*mp.^2.*Rm.*cos(x(2)).^2.*sin(x(2)).*x(3)+(-1).*(4.*Jp+Lp.^2.*mp).*(4.*Kg.^2.*km.*Kt.*n+4.*Br.*Rm+Lp.^2.*mp.*Rm.*sin(2.*x(2)).*x(4))),(-1).*Lp.*mp.*((-4).*Lp.^2.*Lr.^2.*mp.^2.*cos(x(2)).^2+(4.*Jp+Lp.^2.*mp).*(4.*(Jr+Lr.^2.*mp)+Lp.^2.*mp.*sin(x(2)).^2)).^(-1).*(8.*Bp.*Lr.*cos(x(2))+2.*Lr.*(4.*Jp+Lp.^2.*mp).*sin(x(2))+Lp.*(4.*Jp+Lp.^2.*mp).*sin(2.*x(2)).*x(3));0,Lp.*mp.*Rm.^(-1).*((-4).*Lp.^2.*Lr.^2.*mp.^2.*cos(x(2)).^2+(4.*Jp+Lp.^2.*mp).*(4.*(Jr+Lr.^2.*mp)+Lp.^2.*mp.*sin(x(2)).^2)).^(-2).*(((-4).*Lp.^2.*Lr.^2.*mp.^2.*cos(x(2)).^2+(4.*Jp+Lp.^2.*mp).*(4.*(Jr+Lr.^2.*mp)+Lp.^2.*mp.*sin(x(2)).^2)).*(2.*g.*Rm.*cos(x(2)).*(4.*(Jr+Lr.^2.*mp)+3.*Lp.^2.*mp.*sin(x(2)).^2)+8.*Lr.*(Kg.^2.*km.*Kt.*n+Br.*Rm).*sin(x(2)).*x(3)+(1/2).*Lp.*Rm.*((8.*Jr+(Lp.^2+8.*Lr.^2).*mp).*cos(2.*x(2))+(-1).*Lp.^2.*mp.*cos(4.*x(2))).*x(3).^2+(-1).*Lp.*Rm.*(4.*(Lr.^2.*mp.*cos(2.*x(2))+Bp.*sin(2.*x(2)))+Lp.*Lr.*mp.*(cos(x(2))+3.*cos(3.*x(2))).*x(3)).*x(4)+(-8).*Kg.*Kt.*Lr.*n.*sin(x(2)).*u)+(-1).*Lp.*(4.*Jp+(Lp.^2+4.*Lr.^2).*mp).*sin(2.*x(2)).*(Lp.^2.*mp.*Rm.*(Lp.^2.*mp.*cos(x(2)).*sin(x(2)).^3+2.*(Jr+Lr.^2.*mp).*sin(2.*x(2))).*x(3).^2+(-4).*Rm.*(4.*Bp.*(Jr+Lr.^2.*mp)+Lp.^2.*mp.*sin(x(2)).*(Lr.^2.*mp.*cos(x(2))+Bp.*sin(x(2)))).*x(4)+(-2).*Lp.*Lr.*mp.*cos(x(2)).*x(3).*(4.*Kg.^2.*km.*Kt.*n+4.*Br.*Rm+Lp.^2.*mp.*Rm.*sin(2.*x(2)).*x(4))+2.*Lp.*mp.*(g.*Rm.*sin(x(2)).*(4.*Jr+4.*Lr.^2.*mp+Lp.^2.*mp.*sin(x(2)).^2)+4.*Kg.*Kt.*Lr.*n.*cos(x(2)).*u))),Lp.*mp.*Rm.^(-1).*cos(x(2)).*((-4).*Lp.^2.*Lr.^2.*mp.^2.*cos(x(2)).^2+(4.*Jp+Lp.^2.*mp).*(4.*(Jr+Lr.^2.*mp)+Lp.^2.*mp.*sin(x(2)).^2)).^(-1).*(Lp.*Rm.*(8.*Jr+Lp.^2.*mp+8.*Lr.^2.*mp+(-1).*Lp.^2.*mp.*cos(2.*x(2))).*sin(x(2)).*x(3)+(-2).*Lr.*(4.*Kg.^2.*km.*Kt.*n+4.*Br.*Rm+Lp.^2.*mp.*Rm.*sin(2.*x(2)).*x(4))),(-4).*((-4).*Lp.^2.*Lr.^2.*mp.^2.*cos(x(2)).^2+(4.*Jp+Lp.^2.*mp).*(4.*(Jr+Lr.^2.*mp)+Lp.^2.*mp.*sin(x(2)).^2)).^(-1).*(4.*Bp.*(Jr+Lr.^2.*mp)+Lp.^2.*mp.*sin(x(2)).*(Lr.^2.*mp.*cos(x(2))+Bp.*sin(x(2)))+Lp.^3.*Lr.*mp.^2.*cos(x(2)).^2.*sin(x(2)).*x(3))];

    B = [0;0;4.*Kg.*Kt.*(4.*Jp+Lp.^2.*mp).*n.*Rm.^(-1).*((-4).*Lp.^2.* Lr.^2.*mp.^2.*cos(x(2)).^2+(4.*Jp+Lp.^2.*mp).*(4.*(Jr+ Lr.^2.*mp)+Lp.^2.*mp.*sin(x(2)).^2)).^(-1);8.*Kg.*Kt.* Lp.*Lr.*mp.*n.*Rm.^(-1).*cos(x(2)).*((-4).*Lp.^2.* Lr.^2.*mp.^2.*cos(x(2)).^2+(4.*Jp+Lp.^2.*mp).*(4.*(Jr+ Lr.^2.*mp)+Lp.^2.*mp.*sin(x(2)).^2)).^(-1)];
end
