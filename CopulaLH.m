clear
clc
close all
X = [454.8	662.1	479.1	475.2	457.2	527	472.7	497.8	504.9	563.9	493.8	520	530.3	467.6	526.5	542.3
]';
[muhat1,sigmahat1] = normfit(X);%��̬�ֲ����
[H1,P1,KSSTAT1,cv1] = kstest(X,[X normcdf(X,muhat1,sigmahat1)],0.05);%������̬����ֲ��ĺ�����
[parmhat2] = wblfit(X);%Τ���ֲ����
% parmhat2one = parmhat2(1);parmhat2two = parmhat2(2);
[H2,P2,KSSTAT2,cv2] = kstest(X,[X wblcdf(X,parmhat2(1),parmhat2(2))],0.05);%����Τ������ֲ��ĺ�����
[parmhat3] = gevfit(X);%���弫ֵ�ֲ����
[H3,P3,KSSTAT3,cv3] = kstest(X,[X gevcdf(X,parmhat3(1),parmhat3(2),parmhat3(3))],0.05);%������弫ֵ����ֲ��ĺ�����
% H=0,˵������ֲ����Խ��ܣ�PֵԽ���ʾԽ�ӽ���Ϻ���
P = [P1,P2,P3];
if max(P)==P1
        U = normcdf (X,muhat1,sigmahat1);
    elseif max(P)==P2
        U = wblcdf(X,parmhat2(1),parmhat2(2));
    else
        U = gevcdf(X,parmhat3(1),parmhat3(2),parmhat3(3));
end