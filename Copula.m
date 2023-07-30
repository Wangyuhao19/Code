%--------------------------------------------------------------------------
%                         Copula���ۼ�Ӧ��ʵ��
%--------------------------------------------------------------------------

%******************************��̬�Լ���***********************************
% �ֱ����jbtest��kstest��lillietest������X������̬�Լ���
[h,p] = jbtest(X)  % Jarque-Bera����
[h,p] = kstest(X,[X,normcdf(X,mean(X),std(X))])  % Kolmogorov-Smirnov����
[h, p] = lillietest(X)  % Lilliefors����

% �ֱ����jbtest��kstest��lillietest������Y������̬�Լ���
[h,p] = jbtest(Y)  % Jarque-Bera����
[h,p] = kstest(Y,[Y,normcdf(Y,mean(Y),std(Y))])  % Kolmogorov-Smirnov����
[h, p] = lillietest(Y)  % Lilliefors����


%****************************����ֲ�����ֵ*******************************
% ����ecdf������X��Y�ľ���ֲ���

%***********************��Copula�в����Ĺ���ֵ******************************
% ����copulafit�������ƶ�Ԫ��̬Copula�е�������ز���
rho_norm = copulafit('Gaussian',[U(:), V(:)])
% ����copulafit�������ƶ�Ԫt-Copula�е�������ز��������ɶ�
[rho_t,nuhat,nuci] = copulafit('t',[U(:), V(:)])
%Gumbel��Clayton��Frank
paramhat1 = copulafit('Gumbel',[U(:), V(:)])
paramhat2 = copulafit('Clayton',[U(:), V(:)])
paramhat3 = copulafit('Frank',[U(:), V(:)])
%********************����Copula���ܶȺ����ͷֲ�����ͼ************************
[Udata,Vdata] = meshgrid(linspace(0,1,50));  % Ϊ��ͼ��Ҫ�������µ���������
% ����copulapdf��������������ϵĶ�Ԫ��̬Copula�ܶȺ���ֵ
Cpdf_norm = copulapdf('Gaussian',[Udata(:), Vdata(:)],rho_norm);
% ����copulacdf��������������ϵĶ�Ԫ��̬Copula�ֲ�����ֵ
Ccdf_norm = copulacdf('Gaussian',[Udata(:), Vdata(:)],rho_norm);
% ����copulapdf��������������ϵĶ�Ԫt-Copula�ܶȺ���ֵ
Cpdf_t = copulapdf('t',[Udata(:), Vdata(:)],rho_t,nuhat);
% ����copulacdf��������������ϵĶ�Ԫt-Copula�ֲ�����ֵ
Ccdf_t = copulacdf('t',[Udata(:), Vdata(:)],rho_t,nuhat);
[Udata,Vdata] = meshgrid(linspace(0,1,50));  % Ϊ��ͼ��Ҫ�������µ���������
% ����copulapdf��������������ϵĶ�Ԫ��̬Copula�ܶȺ���ֵ
Cpdf_Gumbel = copulapdf('Gumbel',[Udata(:), Vdata(:)],paramhat1);
% ����copulacdf��������������ϵĶ�Ԫ��̬Copula�ֲ�����ֵ
Ccdf_Gumbel = copulacdf('Gumbel',[Udata(:), Vdata(:)],paramhat1);
% ����copulapdf��������������ϵĶ�Ԫt-Copula�ܶȺ���ֵ
[Udata,Vdata] = meshgrid(linspace(0,1,50));  % Ϊ��ͼ��Ҫ�������µ���������
Cpdf_Clayton = copulapdf('Clayton',[Udata(:), Vdata(:)],paramhat2);
% ����copulacdf��������������ϵĶ�Ԫt-Copula�ֲ�����ֵ
Ccdf_Clayton = copulacdf('Clayton',[Udata(:), Vdata(:)],paramhat2);
[Udata,Vdata] = meshgrid(linspace(0,1,50));  % Ϊ��ͼ��Ҫ�������µ���������
% ����copulapdf��������������ϵĶ�Ԫt-Copula�ܶȺ���ֵ
Cpdf_Frank = copulapdf('Frank',[Udata(:), Vdata(:)],paramhat3);
% ����copulacdf��������������ϵĶ�Ԫt-Copula�ֲ�����ֵ
Ccdf_Frank = copulacdf('Frank',[Udata(:), Vdata(:)],paramhat3);

%**************��Kendall�����ϵ����Spearman�����ϵ��***********************


% ����copulastat�������Ԫ��̬Copula��Ӧ��Kendall�����ϵ��
Kendall_Gumbel = copulastat('Gumbel',paramhat1)
% ����copulastat�������Ԫ��̬Copula��Ӧ��Spearman�����ϵ��
Spearman_Gumbel = copulastat('Gumbel',paramhat1,'type','Spearman')
% ����copulastat�������Ԫt-Copula��Ӧ��Kendall�����ϵ��
Kendall_Clayton = copulastat('Clayton',paramhat2)
% ����copulastat�������Ԫt-Copula��Ӧ��Spearman�����ϵ��
Spearman_Clayton = copulastat('Clayton',paramhat2,'type','Spearman')
% ����copulastat�������Ԫt-Copula��Ӧ��Kendall�����ϵ��
Kendall_Frank = copulastat('Frank',paramhat3)
% ����copulastat�������Ԫt-Copula��Ӧ��Spearman�����ϵ��
Spearman_Frank = copulastat('Frank',paramhat3,'type','Spearman')


% ֱ�Ӹ��ݻ����������������ʵ�ԭʼ�۲����ݣ�����corr������Kendall�����ϵ��
Kendall = corr([X,Y],'type','Kendall')
% ֱ�Ӹ��ݻ����������������ʵ�ԭʼ�۲����ݣ�����corr������Spearman�����ϵ��
Spearman = corr([X,Y],'type','Spearman')


%******************************ģ������*************************************
% ����ecdf������X��Y�ľ���ֲ�����
[fx, Xsort] = ecdf(X);
[fy, Ysort] = ecdf(Y);
% ����spline����������������ֵ����ԭʼ�����㴦�ľ���ֲ�����ֵ
U = spline(Xsort(2:end),fx(2:end),X);
V = spline(Ysort(2:end),fy(2:end),Y);
% ���徭��Copula����C(u,v)
C = @(u,v)mean((U <= u).*(V <= v));
% Ϊ��ͼ����Ҫ�������µ���������
[Udata,Vdata] = meshgrid(linspace(0,1,50));
% ͨ��ѭ�����㾭��Copula�������²���������㴦�ĺ���ֵ
for i=1:numel(Udata)
    CopulaEmpirical(i) = C(Udata(i),Vdata(i));
end

figure;  % �½�ͼ�δ���
% ���ƾ���Copula�ֲ�����ͼ��
surf(Udata,Vdata,reshape(CopulaEmpirical,size(Udata)))
xlabel('U');  % ΪX��ӱ�ǩ
ylabel('V');  % ΪY��ӱ�ǩ
zlabel('Empirical Copula C(u,v)');  % Ϊz��ӱ�ǩ

% ͨ��ѭ�����㾭��Copula������ԭʼ�����㴦�ĺ���ֵ
CUV = zeros(size(U(:)));
for i=1:numel(U)
    CUV(i) = C(U(i),V(i));
end
% ����������ز���Ϊ0.9264�Ķ�Ԫ��̬Copula������ԭʼ�����㴦�ĺ���ֵ
%rho_norm = 0.9264;
Cgau = copulacdf('Gaussian',[U(:), V(:)],rho_norm);
% ����������ز���Ϊ0.9325�����ɶ�Ϊ4�Ķ�Ԫt-Copula������ԭʼ�����㴦�ĺ���ֵ
rho_t = 0.9325;
k = 4.0089;
Ct = copulacdf('t',[U(:), V(:)],rho_t,k);
% ����������ز���Ϊ0.9264�Ķ�Ԫ��̬Copula������ԭʼ�����㴦�ĺ���ֵ
Cgum = copulacdf('Gumbel',[U(:), V(:)],paramhat1);
% ����������ز���Ϊ0.9264�Ķ�Ԫ��̬Copula������ԭʼ�����㴦�ĺ���ֵ
Ccla = copulacdf('Clayton',[U(:), V(:)],paramhat2);
% ����������ز���Ϊ0.9264�Ķ�Ԫ��̬Copula������ԭʼ�����㴦�ĺ���ֵ
Cfra = copulacdf('Frank',[U(:), V(:)],paramhat3);
% ����ƽ��ŷ�Ͼ���
dgau2 = (CUV-Cgau)'*(CUV-Cgau)
dt2 = (CUV-Ct)'*(CUV-Ct)
dgum2 = (CUV-Cgum)'*(CUV-Cgum)
dcla2 = (CUV-Ccla)'*(CUV-Ccla)
dfra2 = (CUV-Cfra)'*(CUV-Cfra)

