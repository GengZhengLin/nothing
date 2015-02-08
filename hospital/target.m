function y=target()
% global M V;
% [M V]=splitX(X);
% simulate();
% y=cal_target1();
test();
y=0;
end

function [M V]=splitX(X)
global K Z;
half=K*Z;
M=reshape(X(1:half),K,Z);
V=reshape(X(half+1:2*half),K,Z);
end

function y=cal_target1()
global T N i1 i2 fi;
y=N.*(i1(T+1:Z)+i2(T+1:Z)+fi*i2(T:Z-1));
end

function test(X)
global K Z;
K=5;
Z=2;
M=reshape([1:10],5,2)
V=reshape([11:20],5,2)
X=[reshape(M,K*Z,1);reshape(V,K*Z,1)]
[m v]=splitX(X)
end