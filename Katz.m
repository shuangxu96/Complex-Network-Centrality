function katz = Katz(A,c)
% Katz: Perfrom Katz algorithm to rank node. Katz matrix is 
%       K=(I-cA)^(-1)-I, where I is identity matrix, c is a constant less
%       than 1/lambda, lambda is the largest eigenvalue of A. And Katz
%       centrality of node j is the sum of j'th column of K.
% Ref: Katz, L. A new status index derived from sociometric analysis.
%      Psychometrika (1953) 18: 39. doi:10.1007/BF02289026
% See also: SubgraphCentrality
% Version 2017.02.14
%%  Inputs:
%     A - The adjacent matrix of a complex network. The (i,j) entity is 1
%     if node i points to node j.
%     c - A constant.
%%  Outputs:
%     K - The Katz centrality.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Complex Network Centrality:                              %
%                                                          %
% Copyright (C) 2017 Shuang Xu. All rights reserved.       %
%                    henuxs@foxmail.com                    %
%                    b.sawako@outlook.com                  %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Code begins
N = size(A,1);
A = sparse(A);
I = speye(N);
K = inv((I-c*A))-I;
katz = sum(K)';
katz = full(katz);