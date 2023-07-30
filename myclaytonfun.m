function siranhanshu=myclaytonfun(theta,U,V,W)
%clayton .*Xpdf.*Ypdf.*Zpdf   ,Xpdf,Ypdf,Zpdf
%自己推导的 c(u,v,w)  h=((theta^2*(1/theta + 1)*(1/theta + 2))./(U.^(theta + 1).*V.^(theta +1).*W.^(theta + 1).*(1./U.^theta + 1./V.^theta + 1./W.^theta - 2).^(1/theta +3))).*Xpdf.*Ypdf.*Zpdf;

h=(U.^(-(theta+1)).*V.^(-(theta+1)).*W.^(-(theta+1)).*(1+theta).*(1+2*theta).*(U.^(-theta)+V.^(-theta)+W.^(-theta)-2).^(-(1/theta+3)));
k=prod(h);
siranhanshu=0-(k);

end