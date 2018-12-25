function [s,y]=invpower(A,x0,tol,n)
if nargin<=3
    n=100;
end
if nargin<=2
        tol=1e-3;
end
if nargin<=1;
    x0=ones(size(A,1));
end
k=1;
r=0;
y=x0/max(abs(x0));
[L,U]=lu(A);
z=L\y;
x=U\z;
u=max(x);
s=1/u;
if abs(u-r)<tol
    return
end
while abs(u-r)>eps & k<n
    k=k+1;
    r=u;
    y=x/max(abs(x));
    z=L\y;
    x=U\z;
    u=max(x);
end
[m,index]=max(abs(x));
s=1/x(index);
