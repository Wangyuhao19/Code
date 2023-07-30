function siranhanshu=mygumbelfun(theta,U,V,W)
%Gumbel    .*Xpdf.*Ypdf.*Zpdf    ,Xpdf,Ypdf,Zpdf  
% 自己推导的 c(u,v,w)  h=((exp(-((-log(U)).^theta + (-log(V)).^theta + (-log(W)).^theta).^(1/theta)).*(-log(U)).^(theta - 1).*(-log(V)).^(theta - 1).*(-log(W)).^(theta - 1).*((-log(U)).^theta + (-log(V)).^theta + (-log(W)).^theta).^(1/theta - 1).*((-log(U)).^theta + (-log(V)).^theta + (-log(W)).^theta).^(2/theta - 2))./(U.*V.*W) - (theta.*exp(-((-log(U)).^theta + (-log(V)).^theta + (-log(W)).^theta)^(1/theta))*(-log(U)).^(theta - 1).*(-log(V)).^(theta - 1).*(-log(W)).^(theta - 1)*(2/theta - 2).*((-log(U)).^theta + (-log(V)).^theta + (-log(W)).^theta).^(2/theta - 3))./(U.*V.*W) + (theta^2.*exp(-((-log(U)).^theta + (-log(V)).^theta + (-log(W)).^theta).^(1/theta)).*(-log(U)).^(theta - 1).*(-log(V)).^(theta - 1).*(-log(W)).^(theta - 1)*(1/theta - 1)*(1/theta - 2).*((-log(U)).^theta + (-log(V)).^theta + (-log(W)).^theta).^(1/theta - 3))./(U.*V.*W) - (theta.*exp(-((-log(U)).^theta + (-log(V)).^theta + (-log(W)).^theta).^(1/theta)).*(-log(U)).^(theta - 1).*(-log(V)).^(theta - 1).*(-log(W)).^(theta - 1)*(1/theta - 1).*((-log(U)).^theta + (-log(V)).^theta + (-log(W)).^theta).^(1/theta - 1).*((-log(U)).^theta + (-log(V)).^theta + (-log(W)).^theta).^(1/theta - 2))./(U.*V.*W)).*Xpdf.*Ypdf.*Zpdf;
%m=(-log(U)).^theta + (-log(V)).^theta + (-log(W)).^theta;
%n=(-log(U)).^(theta - 1).*(-log(V)).^(theta - 1).*(-log(W)).^(theta - 1);
%q=U.*V.*W;
%h=((exp(-(m).^(1/theta)).*n.*(m).^(1/theta - 1).*(m).^(2/theta - 2))./(q) - (theta.*exp(-(m).^(1/theta)).*n.*(2/theta - 2).*(m).^(2/theta - 3))./(q) + (theta^2.*exp(-(m).^(1/theta)).*n.*(1/theta - 1).*(1/theta - 2).*(m).^(1/theta - 3))./(q) - (theta.*exp(-(m).^(1/theta)).*n.*(1/theta - 1).*(m).^(1/theta - 1).*(m).^(1/theta - 2))./(q)).*Xpdf.*Ypdf.*Zpdf;
%k=prod(h);
%siranhanshu=0-(k);
m=(-log(U)).^theta + (-log(V)).^theta + (-log(W)).^theta;
h=((-log(U).*log(V).*log(W)).^(theta-1))./(U.*V.*W).*exp((-m).^(1/theta)).*(m.^(3/theta-3)+(3*theta-3).*m.^(2/theta-3)+((theta-1).*(2*theta-1).*m.^(1/theta-1)));
k=prod(h);
siranhanshu=0-(k);
end

%(exp(-((-log(u))^theta + (-log(v))^theta + (-log(w))^theta)^(1/theta))*(-log(u))^(theta - 1)*(-log(v))^(theta - 1)*(-log(w))^(theta - 1)*((-log(u))^theta + (-log(v))^theta + (-log(w))^theta)^(1/theta - 1)*((-log(u))^theta + (-log(v))^theta + (-log(w))^theta)^(2/theta - 2))/(u*v*w) - (theta*exp(-((-log(u))^theta + (-log(v))^theta + (-log(w))^theta)^(1/theta))*(-log(u))^(theta - 1)*(-log(v))^(theta - 1)*(-log(w))^(theta - 1)*(2/theta - 2)*((-log(u))^theta + (-log(v))^theta + (-log(w))^theta)^(2/theta - 3))/(u*v*w) + (theta^2*exp(-((-log(u))^theta + (-log(v))^theta + (-log(w))^theta)^(1/theta))*(-log(u))^(theta - 1)*(-log(v))^(theta - 1)*(-log(w))^(theta - 1)*(1/theta - 1)*(1/theta - 2)*((-log(u))^theta + (-log(v))^theta + (-log(w))^theta)^(1/theta - 3))/(u*v*w) - (theta*exp(-((-log(u))^theta + (-log(v))^theta + (-log(w))^theta)^(1/theta))*(-log(u))^(theta - 1)*(-log(v))^(theta - 1)*(-log(w))^(theta - 1)*(1/theta - 1)*((-log(u))^theta + (-log(v))^theta + (-log(w))^theta)^(1/theta - 1)*((-log(u))^theta + (-log(v))^theta + (-log(w))^theta)^(1/theta - 2))/(u*v*w)
 
 
      