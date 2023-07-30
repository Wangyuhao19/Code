%--------------------------------------------------------------------------
%                         Copula理论及应用实例
%--------------------------------------------------------------------------

%******************************正态性检验***********************************
% 分别调用jbtest、kstest和lillietest函数对X进行正态性检验
[h,p] = jbtest(X)  % Jarque-Bera检验
[h,p] = kstest(X,[X,normcdf(X,mean(X),std(X))])  % Kolmogorov-Smirnov检验
[h, p] = lillietest(X)  % Lilliefors检验

% 分别调用jbtest、kstest和lillietest函数对Y进行正态性检验
[h,p] = jbtest(Y)  % Jarque-Bera检验
[h,p] = kstest(Y,[Y,normcdf(Y,mean(Y),std(Y))])  % Kolmogorov-Smirnov检验
[h, p] = lillietest(Y)  % Lilliefors检验


%****************************求经验分布函数值*******************************
% 调用ecdf函数求X和Y的经验分布函

%***********************求Copula中参数的估计值******************************
% 调用copulafit函数估计二元正态Copula中的线性相关参数
rho_norm = copulafit('Gaussian',[U(:), V(:)])
% 调用copulafit函数估计二元t-Copula中的线性相关参数和自由度
[rho_t,nuhat,nuci] = copulafit('t',[U(:), V(:)])
%Gumbel、Clayton、Frank
paramhat1 = copulafit('Gumbel',[U(:), V(:)])
paramhat2 = copulafit('Clayton',[U(:), V(:)])
paramhat3 = copulafit('Frank',[U(:), V(:)])
%********************绘制Copula的密度函数和分布函数图************************
[Udata,Vdata] = meshgrid(linspace(0,1,50));  % 为绘图需要，产生新的网格数据
% 调用copulapdf函数计算网格点上的二元正态Copula密度函数值
Cpdf_norm = copulapdf('Gaussian',[Udata(:), Vdata(:)],rho_norm);
% 调用copulacdf函数计算网格点上的二元正态Copula分布函数值
Ccdf_norm = copulacdf('Gaussian',[Udata(:), Vdata(:)],rho_norm);
% 调用copulapdf函数计算网格点上的二元t-Copula密度函数值
Cpdf_t = copulapdf('t',[Udata(:), Vdata(:)],rho_t,nuhat);
% 调用copulacdf函数计算网格点上的二元t-Copula分布函数值
Ccdf_t = copulacdf('t',[Udata(:), Vdata(:)],rho_t,nuhat);
[Udata,Vdata] = meshgrid(linspace(0,1,50));  % 为绘图需要，产生新的网格数据
% 调用copulapdf函数计算网格点上的二元正态Copula密度函数值
Cpdf_Gumbel = copulapdf('Gumbel',[Udata(:), Vdata(:)],paramhat1);
% 调用copulacdf函数计算网格点上的二元正态Copula分布函数值
Ccdf_Gumbel = copulacdf('Gumbel',[Udata(:), Vdata(:)],paramhat1);
% 调用copulapdf函数计算网格点上的二元t-Copula密度函数值
[Udata,Vdata] = meshgrid(linspace(0,1,50));  % 为绘图需要，产生新的网格数据
Cpdf_Clayton = copulapdf('Clayton',[Udata(:), Vdata(:)],paramhat2);
% 调用copulacdf函数计算网格点上的二元t-Copula分布函数值
Ccdf_Clayton = copulacdf('Clayton',[Udata(:), Vdata(:)],paramhat2);
[Udata,Vdata] = meshgrid(linspace(0,1,50));  % 为绘图需要，产生新的网格数据
% 调用copulapdf函数计算网格点上的二元t-Copula密度函数值
Cpdf_Frank = copulapdf('Frank',[Udata(:), Vdata(:)],paramhat3);
% 调用copulacdf函数计算网格点上的二元t-Copula分布函数值
Ccdf_Frank = copulacdf('Frank',[Udata(:), Vdata(:)],paramhat3);

%**************求Kendall秩相关系数和Spearman秩相关系数***********************


% 调用copulastat函数求二元正态Copula对应的Kendall秩相关系数
Kendall_Gumbel = copulastat('Gumbel',paramhat1)
% 调用copulastat函数求二元正态Copula对应的Spearman秩相关系数
Spearman_Gumbel = copulastat('Gumbel',paramhat1,'type','Spearman')
% 调用copulastat函数求二元t-Copula对应的Kendall秩相关系数
Kendall_Clayton = copulastat('Clayton',paramhat2)
% 调用copulastat函数求二元t-Copula对应的Spearman秩相关系数
Spearman_Clayton = copulastat('Clayton',paramhat2,'type','Spearman')
% 调用copulastat函数求二元t-Copula对应的Kendall秩相关系数
Kendall_Frank = copulastat('Frank',paramhat3)
% 调用copulastat函数求二元t-Copula对应的Spearman秩相关系数
Spearman_Frank = copulastat('Frank',paramhat3,'type','Spearman')


% 直接根据沪、深两市日收益率的原始观测数据，调用corr函数求Kendall秩相关系数
Kendall = corr([X,Y],'type','Kendall')
% 直接根据沪、深两市日收益率的原始观测数据，调用corr函数求Spearman秩相关系数
Spearman = corr([X,Y],'type','Spearman')


%******************************模型评价*************************************
% 调用ecdf函数求X和Y的经验分布函数
[fx, Xsort] = ecdf(X);
[fy, Ysort] = ecdf(Y);
% 调用spline函数，利用样条插值法求原始样本点处的经验分布函数值
U = spline(Xsort(2:end),fx(2:end),X);
V = spline(Ysort(2:end),fy(2:end),Y);
% 定义经验Copula函数C(u,v)
C = @(u,v)mean((U <= u).*(V <= v));
% 为作图的需要，产生新的网格数据
[Udata,Vdata] = meshgrid(linspace(0,1,50));
% 通过循环计算经验Copula函数在新产生的网格点处的函数值
for i=1:numel(Udata)
    CopulaEmpirical(i) = C(Udata(i),Vdata(i));
end

figure;  % 新建图形窗口
% 绘制经验Copula分布函数图像
surf(Udata,Vdata,reshape(CopulaEmpirical,size(Udata)))
xlabel('U');  % 为X轴加标签
ylabel('V');  % 为Y轴加标签
zlabel('Empirical Copula C(u,v)');  % 为z轴加标签

% 通过循环计算经验Copula函数在原始样本点处的函数值
CUV = zeros(size(U(:)));
for i=1:numel(U)
    CUV(i) = C(U(i),V(i));
end
% 计算线性相关参数为0.9264的二元正态Copula函数在原始样本点处的函数值
%rho_norm = 0.9264;
Cgau = copulacdf('Gaussian',[U(:), V(:)],rho_norm);
% 计算线性相关参数为0.9325，自由度为4的二元t-Copula函数在原始样本点处的函数值
rho_t = 0.9325;
k = 4.0089;
Ct = copulacdf('t',[U(:), V(:)],rho_t,k);
% 计算线性相关参数为0.9264的二元正态Copula函数在原始样本点处的函数值
Cgum = copulacdf('Gumbel',[U(:), V(:)],paramhat1);
% 计算线性相关参数为0.9264的二元正态Copula函数在原始样本点处的函数值
Ccla = copulacdf('Clayton',[U(:), V(:)],paramhat2);
% 计算线性相关参数为0.9264的二元正态Copula函数在原始样本点处的函数值
Cfra = copulacdf('Frank',[U(:), V(:)],paramhat3);
% 计算平方欧氏距离
dgau2 = (CUV-Cgau)'*(CUV-Cgau)
dt2 = (CUV-Ct)'*(CUV-Ct)
dgum2 = (CUV-Cgum)'*(CUV-Cgum)
dcla2 = (CUV-Ccla)'*(CUV-Ccla)
dfra2 = (CUV-Cfra)'*(CUV-Cfra)

