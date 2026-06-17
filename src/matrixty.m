function [z]= matrixty(x,y,np)
z=linspace(x,y,np);
zunion=z;
    while size(z,1)<np
    z=[z;zunion];
    end
end