function s = LeaderRank(A,tol)
% LeaderRank: Perform LeaderRank algorithm to rank node.
% Ref: L¨¹ L, et al. Leaders in social networks, the delicious case[J]. PloS
%      one, 2011, 6(6): e21202.
% See also: AdaptiveLeaderRank WeightLeaderRank
% Version 2017.02.13
%%  Inputs:
%     A - The adjacent matrix of a complex network. The (i,j) entity is 1
%     if node i points to node j.
%     tol - (optional) The tolerance of error. Defult: 1e-3.
%%  Outputs:
%     s - The LeaderRank score.
%%  Example:
% If we have a complex network with adjacent matrix A, we can run following
% code to obtain the LeaderRank score.
% ###########code############
% h = LeaderRank(A);
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
if nargin==1
    tol=1e-3;
end

A = sparse(A);
N = length(A(:,1));
G = A; G(:,N+1)=1; G(N+1,:)=1; G(end,end)=0;
OutDegree = sum(G,2);
for i=1:N+1;
    W(:,i) = G(i,:)/OutDegree(i);
end

s = [ones(N,1);0]; sn = s; err=1;

while err>tol
    sn = W*s;
    err = norm(s-sn);
    s = sn;
end

s = sn(1:end-1);
s = s+sn(end)/N;