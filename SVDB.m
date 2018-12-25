function [r,c,step]=SVDB(A)

A=sparse(A);
[r_n,c_n]=size(A);
x=ones(c_n,1);
y=ones(r_n,1);
err=[1,1];
step=0;
while sum(mean(abs(err)))>1e-3
    yy=A*x;
    yy=yy/sum(yy);
    err(2)=norm(y-yy,1);
    y=yy;
    xx=y'*A;
    xx=xx/sum(xx);
    err(1)=norm(x-xx',1);
    x=xx';
    step=step+1;
end

r=y;
c=x;