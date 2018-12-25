function s  =  CumNom(A,tol)
% CumNom: Perfrom Cumulative Nomination algorithm to rank node.
% Ref: Poulin R, Boily M C, Masse B. Dynamical systems to define centrality
%      in social networks. Soc Netw, 2000, 22: 187¨C220
%      http://dx.doi.org/10.1016/S0378-8733(00)00020-4
% See also: LeaderRank PageRank EigenCentrality
% Version 2017.02.14
%%  Inputs:
%     A - The adjacent matrix of a complex network. The (i,j) entity is 1
%     if node i points to node j.
%     tol - (optional) The tolerance of error. Defult: 1e-3.
%%  Outputs:
%     s - The cumulative nomination score.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Complex Network Centrality:                              %
%                                                          %
% Copyright (C) 2017 Shuang Xu. All rights reserved.       %
%                    henuxs@foxmail.com                    %
%                    b.sawako@outlook.com                  %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Code begins
if nargin==1
    tol=1e-3;
end

A = sparse(A);
N = length(A);
s = ones(N,1);
err = 1;
while err > tol
    s_new = s+A*s;
    s_new = s_new/sum(s_new);
    err = norm(s-s_new,1);
    s = s_new;
end