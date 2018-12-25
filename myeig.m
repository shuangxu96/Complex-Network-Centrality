function [vector,value]=myeig(A)
% myeig: Compute the priciple eigenvector and eigenvalue. 
% See also: 
% Version 2017.02.15
%%  Inputs:
%     A - Matrix.
%%  Outputs:
%     vector - The eigenvector corresponding to largest eigenvalue.
%     value - The largest eigenvalue.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Complex Network Centrality:                              %
%                                                          %
% Copyright (C) 2017 Shuang Xu. All rights reserved.       %
%                    henuxs@foxmail.com                    %
%                    b.sawako@outlook.com                  %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Code begins
N=length(A);
err=1;vector=ones(N,1);
while err>1e-3
    nu=A*vector;
    value=max(nu)/max(vector);
    nu=nu/max(nu);
    err=norm(nu-vector,1);
    vector=nu;
end
