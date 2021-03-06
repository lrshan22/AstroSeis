function [B11,B12,B13,B21,B22,B23,B31,B32,B33]=Bmat_func(vp,vs,rho,w,...
    x,y,z,x0,y0,z0)
im = complex(0,1); 
R = sqrt( (x-x0).^2 + (y-y0).^2 + (z-z0).^2); 
g1 = (x-x0)./R; 
g2 = (y-y0)./R; 
g3 = (z-z0)./R; 
kp = w/vp; 
ks = w/vs;
Gs=exp(im*ks*R)./(4*pi*R);
Gp=exp(im*kp*R)./(4*pi*R);
%%
B11=R.^(-2).*(Gp.*(1+(sqrt(-1)*(-1)).*kp.*R+g1.^2.*((-3)+(sqrt(-1)*3) ...
  .*kp.*R+kp.^2.*R.^2))+Gs.*((-1)+sqrt(-1).*ks.*R+ks.^2.*R.^2+(-1).* ...
  g1.^2.*((-3)+(sqrt(-1)*3).*ks.*R+ks.^2.*R.^2))).*rho.^(-1).*w.^( ...
  -2);

B12=g1.*g2.*R.^(-2).*(Gp.*((-3)+(sqrt(-1)*3).*kp.*R+kp.^2.*R.^2)+(-1) ...
  .*Gs.*((-3)+(sqrt(-1)*3).*ks.*R+ks.^2.*R.^2)).*rho.^(-1).*w.^(-2);

B13=g1.*g3.*R.^(-2).*(Gp.*((-3)+(sqrt(-1)*3).*kp.*R+kp.^2.*R.^2)+(-1) ...
  .*Gs.*((-3)+(sqrt(-1)*3).*ks.*R+ks.^2.*R.^2)).*rho.^(-1).*w.^(-2);

B21=B12;

B22=R.^(-2).*(Gp.*(1+(sqrt(-1)*(-1)).*kp.*R+g2.^2.*((-3)+(sqrt(-1)*3) ...
  .*kp.*R+kp.^2.*R.^2))+Gs.*((-1)+sqrt(-1).*ks.*R+ks.^2.*R.^2+(-1).* ...
  g2.^2.*((-3)+(sqrt(-1)*3).*ks.*R+ks.^2.*R.^2))).*rho.^(-1).*w.^( ...
  -2);

B23=g2.*g3.*R.^(-2).*(Gp.*((-3)+(sqrt(-1)*3).*kp.*R+kp.^2.*R.^2)+(-1) ...
  .*Gs.*((-3)+(sqrt(-1)*3).*ks.*R+ks.^2.*R.^2)).*rho.^(-1).*w.^(-2);

B31=B13;

B32=B23;

B33=R.^(-2).*(Gp.*(1+(sqrt(-1)*(-1)).*kp.*R+g3.^2.*((-3)+(sqrt(-1)*3) ...
  .*kp.*R+kp.^2.*R.^2))+Gs.*((-1)+sqrt(-1).*ks.*R+ks.^2.*R.^2+(-1).* ...
  g3.^2.*((-3)+(sqrt(-1)*3).*ks.*R+ks.^2.*R.^2))).*rho.^(-1).*w.^( ...
  -2);

end