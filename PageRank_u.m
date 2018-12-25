function s = PageRank_u(A,d,tol)
% PageRank: Perfrom PageRank algorithm to rank node.
% Ref: Brin S, Page L. The anatomy of a large-scale hypertextual web search
%      engine. Comput Netw ISDN Sys, 1998, 30: 107¨C117
%      http://dx.doi.org/10.1016/S0169-7552(98)00110-X
% See also: LeaderRank CumNom EigenCentrality
% Version 2017.02.14
%%  Inputs:
%     A - The adjacent matrix of a complex network. The (i,j) entity is 1
%     if node i points to node j.
%     d - (optional) Damping factor. Defult: 0.85.
%     tol - (optional) The tolerance of error. Defult: 1e-3.
%%  Outputs:
%     s - The pagerank score.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Complex Network Centrality:                              %
%                                                          %
% Copyright (C) 2017 Shuang Xu. All rights reserved.       %
%                    henuxs@foxmail.com                    %
%                    b.sawako@outlook.com                  %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Code begins
if nargin<=2
    tol = 1e-4;
end
if nargin<=1
    d = 0.85;
end

A = sparse(A);
N = length(A(:,1));
OutDegree = sum(A,2);
ind=find(OutDegree==0);
A(ind,ind)=1;
OutDegree = sum(A,2);
K=sparse(0);
for i=1:N
    K(i,i)=OutDegree(i);
end
M=(K^(-1)*A)';

s = ones(N,1); sn = s; err=1;

while err > tol
    sn = d*M*s+(1-d)/N;
    err = norm(s-sn);
    s = sn;
end
s = full(s);
