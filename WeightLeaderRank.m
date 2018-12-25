function s = WeightLeaderRank(A,alpha,tol)
% WeightLeaderRank: To perform the WeightLeaderRank algorithm to rank node.
% Ref: Li Q,et al. Identifying influential spreaders by weighted leaderrank
%      [J]. Physica A 2014, 404: 47-55.
% See also: LeaderRank AdaptiveLeaderRank
% Version 2017.02.13
%%  Inputs:
%     A - The adjacent matrix of a complex network. The (i,j) entity is 1
%     if node i points to node j.
%     alpha - (optional) A tunable parameter (positive or negative).
%     Defult: 1.
%     tol - (optional) The tolerance of error. Defult: 1e-3.
%%  Outputs:
%     s - The WeightLeaderRank score.
%%  Example:
% If we have a complex network with adjacent matrix A, we can run following
% code to obtain the WeightLeaderRank score.
% ###########code############
% h = WeightLeaderRank(A);
% ###########code############

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Complex Network Centrality:                              %
%                                                          %
% Copyright (C) 2017 Shuang Xu. All rights reserved.       %
%                    henuxs@foxmail.com                    %
%                    b.sawako@outlook.com                  %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Code begins
if nargin<=2;
    tol=1;
end
if nargin<=1;
    alpha=1;
end

A = sparse(A);
N = length(A(:,1));
InDegree = sum(A,1).^alpha;
G = A;
G(:,N+1)=1; G(N+1,:)=[InDegree,0];
OutDegree = sum(sparse(G),2);
for i=1:N+1;
    W(:,i) = G(i,:)/OutDegree(i);
end

s = [ones(N,1);0]; sn = s; err=1;iteration=0;
W=sparse(W);s=sparse(s);
while err>tol & iteration<3000
    sn = W*s;
    err = norm(s-sn);
    s = sn;
    iteration=iteration+1;
end

s = sn(1:end-1); 
s=full(s);