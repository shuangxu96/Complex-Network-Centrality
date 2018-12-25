function s = EigenCentrality(A,tol)
% EigenCentrality: Perfrom Eigenvector Centrality algorithm to rank node.
% Ref: Bonacich P. Factoring and weighting approaches to status scores and 
%      clique identification. J Math Sociol, 1972, 2: 113¨C120
%      http://dx.doi.org/10.1080/0022250X.1972.9989806
% See also: LeaderRank PageRank CumNom
% Version 2017.02.14
%%  Inputs:
%     A - The adjacent matrix of a complex network. The (i,j) entity is 1
%     if node i points to node j.
%     tol - (optional) The tolerance of error. Defult: 1e-3.
%%  Outputs:
%     s - The eigenvector centrality score.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Complex Network Centrality:                              %
%                                                          %
% Copyright (C) 2017 Shuang Xu. All rights reserved.       %
%                    henuxs@foxmail.com                    %
%                    b.sawako@outlook.com                  %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Code begins
if nargin == 1
    tol = 1e-3;
end
N = length(A);
s = ones(N,1);

err = 1;
while err > tol 
    s_new = A*s;
    s_new = s_new/sum(s_new);
    err = norm(s-s_new,1);
    s = s_new;
end