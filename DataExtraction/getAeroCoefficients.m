function [CD,CL,eff] = getAeroCoefficients(Fx,Fz,qS,alpha,index)

nAlpha = length(alpha);
nIdx   = length(index)+1;

alpha = deg2rad(alpha);

CD = zeros(nAlpha,nIdx);
CL = zeros(nAlpha,nIdx);

% Compute CD and CL
for i = 1:nIdx
    for j = 1:nAlpha
        CD(j, i) = (Fx(j, i)*cos(alpha(j)) + Fz(j, i)*sin(alpha(j)))/qS;
        CL(j, i) = (-Fx(j, i)*sin(alpha(j)) + Fz(j, i)*cos(alpha(j)))/qS;
    end
end

% Compute efficiency
eff = CL ./ CD;

end