clear all
close all
clc

p = round(2+8*rand());
n = round(3*p+40*rand());
m = round(3*p+40*rand());
N=10000;

figure

for jjj = 1:10

[Q,R] = qr(randn(p));
R = diag(10^(-5)+10.*rand(p,1));
Sigma = Q*R*Q';

dist=[];

d1 = n-p+1;
d2 = m-p+1;

for i=1:N
    Sx=zeros(p);
    Sy=zeros(p);
    for j=1:n
    x = sqrt(diag(R)).*(Q'*randn(p,1));
    Sx=Sx+x*x';
    end
    clear j
    for j=1:m
    y = sqrt(diag(R)).*(Q'*randn(p,1));
    Sy=Sy+y*y';
    end
    Lx = chol(Sx);
    Ly = chol(Sy);
    [W,D,U]=svd(Lx'*Ly);
    U = U';
    newdist = norm(Lx-Ly*U*W');
    dist = [dist newdist];
end

histogram(dist,'Normalization','probability')
hold on
if jjj == 1
    xmax = max(dist)+0.5;
    ymax = 0.08;
end
axis([0 xmax 0 ymax])
%disp('Press any key to display next plot:')
pause(0.5);

end
disp('Press any key to delete everything:')
pause;
close all
clear all
clc