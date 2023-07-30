clear
clc
close all
HCG = xlsread('C:\Users\ÍõÓîê»\Desktop\ÈýÔª.xlsx')
X = HCG(:,1)
Y = HCG(:,2)
Z = HCG(:,3)
U=gevcdf(X,0.1525,13.91,37.5925)
V=normcdf(Y,614.0506,81.5192)
W=gevcdf(Z,-0.0581,18.825,60.2256)
options=optimset('fminsearch');
options.TolX=0.0001;
options.Display='off'
[theta,fval]=fminsearch(@(theta) myfrankfun(theta,U,V,W),-1.0,options)
