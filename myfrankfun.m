function siranhanshu=myfrankfun(theta,U,V,W)
%frank    .*Xpdf.*Ypdf.*Zpdf    ,Xpdf,Ypdf,Zpdf
%自己推导的 c(u,v,w)   h=((theta^2.*exp(-theta.*U).*exp(-theta.*V).*exp(-theta.*W))./((exp(-theta) - 1).^2.*(((exp(-theta.*U) - 1).*(exp(-theta.*V) - 1).*(exp(-theta.*W) - 1))./(exp(-theta) - 1).^2 + 1)) - (3*theta^2.*exp(-theta.*U).*exp(-theta.*V).*exp(-theta.*W).*(exp(-theta.*U) - 1).*(exp(-theta.*V) - 1).*(exp(-theta.*W) - 1))./((exp(-theta) - 1).^4.*(((exp(-theta.*U) - 1).*(exp(-theta.*V) - 1).*(exp(-theta.*W) - 1))./(exp(-theta) - 1)^2 + 1).^2) + (2*theta^2.*exp(-theta.*U).*exp(-theta.*V).*exp(-theta.*W).*(exp(-theta.*U) - 1).^2.*(exp(-theta.*V) - 1).^2.*(exp(-theta.*W) - 1).^2)./((exp(-theta) - 1)^6.*(((exp(-theta.*U) - 1).*(exp(-theta.*V) - 1).*(exp(-theta.*W) - 1))./(exp(-theta) - 1).^2 + 1).^3)).*Xpdf.*Ypdf.*Zpdf;
%m=exp(-theta.*U).*exp(-theta.*V).*exp(-theta.*W);
%n=(exp(-theta.*U) - 1).*(exp(-theta.*V) - 1).*(exp(-theta.*W) - 1);
%h=((theta^2.*m)./((exp(-theta) - 1)^2.*((n)./(exp(-theta) - 1).^2 + 1)) - (3*theta^2.*m.*n)./((exp(-theta) - 1).^4.*((m)./(exp(-theta) - 1)^2 + 1).^2) + (2*theta^2.*m.*(exp(-theta.*U) - 1).^2.*(exp(-theta.*V) - 1).^2.*(exp(-theta.*W) - 1).^2)./((exp(-theta) - 1)^6.*((n)./(exp(-theta) - 1)^2 + 1).^3)).*Xpdf.*Ypdf.*Zpdf;
%k=prod(h);
%siranhanshu=0-(k);   
m=exp(-theta.*U).*exp(-theta.*V).*exp(-theta.*W);
n=(exp(-theta.*U) - 1).*(exp(-theta.*V) - 1).*(exp(-theta.*W) - 1);
h=((theta^2.*m.*(exp(-theta) - 1).^2.*((exp(-theta) - 1).^2-n))./(((exp(-theta) - 1).^2+n).^3));
k=prod(h);
siranhanshu=0-(k);
end

