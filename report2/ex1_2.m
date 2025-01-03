%%% EX2#2
% author:   Heng Li
% date:     2021/1/3 08:16


clear;
% constant
M=100;N=20;L=1;T=1;
dx=1/N;dt=1/M;
x=0:dx:L;t=0:dt:T;
al=(dt^2)/(dx^2);
% create metrix
U=zeros(N+1,M+1);

U(:,1)=sin(pi*x)+1;
U(:,2)=sin(pi*x)+1;
U(1,:)=1;
U(N+1,:)=1;

for k=2:M
    for i=2:N
        U(i,k+1)=al*U(i-1,k)+2*(1-al)*U(i,k)+al*U(i+1,k)-U(i,k-1);
    end

end

% create grid for surf

[X, T] = meshgrid(x, t);
subplot 311
surf(X,T,U');

subplot 312
U1=cos(pi*T).*sin(pi*X)+1;
surf(X,T,U1);
subplot 313

surf(X,T,U1-U');