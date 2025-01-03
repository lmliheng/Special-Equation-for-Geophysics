%%% EX1#1
% author:   Heng Li
% date:     2021/1/3 08:16


clear;
% constant
M=70;
N=10;
dx=3/N;
dt=1/M;
x=0:dx:3;
t=0:dt:1;
a=3*dt/(dx^2);
% create metrix
U=zeros(N+1,M+1);
U(:,1)=x;

for k=1:M
    for i=2:N
        U(i,k+1)=a*U(i+1,k)+(1-2*a)*U(i,k)+a*U(i-1,k);
    end
    U(1,k+1)=U(2,k+1);
    U(N+1,k+1)=U(N,k+1);
end
% create grid for surf
[X, T] = meshgrid(t, x);
surf(X,T,U);