function [P_frank,Pe_frank,AIC_frank,OLS_frank]=dim_3_test(XYZ,P_frank,Pe_frank)
% ���:P_clayton������������������Ƶ�ʣ�Pe_clayton������ľ���Ƶ��,D_claytonΪ����ֵ,OLS_claytonΪ������������ƽ����  /dim_3_testΪ��������
% ���룺XYZ, copula_clayton������Ƶ�ʣ�

% x=XYZ(:,1)
% y=XYZ(:,2)
% z=XYZ(:,3)
% n=length(x);
% % ����Ƶ��
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


b=50;%bΪ��������
k=1;%��������  ������Ϊͬһ��copula�ֲ�������ֻ��һ������
% dfrank2 = (P_frank'-Pe_frank')'*(P_frank'-Pe_frank');
% OLS_frank=sqrt(dfrank2/b);
AIC_frank=b*log(1/b*sum((P_frank-Pe_frank).^2))+2*k;
OLS_frank=(1/b*sum((P_frank-Pe_frank).^2))^0.5;  
%��������


end

