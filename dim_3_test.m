function [P_frank,Pe_frank,AIC_frank,OLS_frank]=dim_3_test(XYZ,P_frank,Pe_frank)
% 输出:P_clayton计算出的样本点的理论频率，Pe_clayton样本点的经验频率,D_clayton为检验值,OLS_clayton为计算出来的离差平方和  /dim_3_test为函数名称
% 输入：XYZ, copula_clayton（理论频率）

% x=XYZ(:,1)
% y=XYZ(:,2)
% z=XYZ(:,3)
% n=length(x);
% % 经验频率
% for j = 1:50
% nubl = 0;
% for i=1:50
%     if X(i)<=X(j) & Y(i)<=Y(j) & Z(i)<=Z(j) 
%         nubl = nubl+1
%     end
% end
%     CUVW(j) = (nubl-0.44)/(50+0.12)
% end
% CUVW


b=50;%b为样本个数
k=1;%参数个数  三变量为同一个copula分布，所以只有一个参数
% dfrank2 = (P_frank'-Pe_frank')'*(P_frank'-Pe_frank');
% OLS_frank=sqrt(dfrank2/b);
AIC_frank=b*log(1/b*sum((P_frank-Pe_frank).^2))+2*k;
OLS_frank=(1/b*sum((P_frank-Pe_frank).^2))^0.5;  
%三个变量


end

