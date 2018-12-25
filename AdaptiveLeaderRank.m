function s = AdaptiveLeaderRank(A,tol)
% AdaptiveLeaderRank: Perform AdaptiveLeaderRank algorithm to rank node.
% Ref: Xu S., et al. Identifying important nodes by adaptive LeaderRank,
%      Physica A, vol 469, pp 654-664.
%      http://dx.doi.org/10.1016/j.physa.2016.11.034.
% See also: LeaderRank WeightLeaderRank
% Version 2017.02.13
%%  Inputs:
%     A - The adjacent matrix of a complex network. The (i,j) entity is 1
%     if node i points to node j.
%     tol - (optional) The tolerance of error. Defult: 1e-3.
%%  Outputs:
%     s - The Adaptive LeaderRank score.
%%  Example:
% If we have a complex network with adjacent matrix A, we can run following
% code to obtain the Adaptive LeaderRank score.
% ###########code############
% h = AdaptiveLeaderRank(A);
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

A=sparse(A);
N = length(A(1,:));
Ground = A; Ground(N+1,:) = 1; Ground(:,N+1) = 1;
Ground(N+1,N+1) = 0;
h=OutHindexCN(A,1);h(end+1)=1;
s = ones(N,1); s(N+1) =0; sn = s;
W=sparse(0);
W(size(Ground),size(Ground))=0;
for i=1:N+1;
    W(:,i)=Ground(i,:)'.*h;
end
sumW=sum(W);
for i=1:N+1;
    W(:,i)=W(:,i)/sumW(i);
end

err=1;time=0;
while err>tol & time<100
    sn = W*s;
    err = norm(s-sn,2);
    s = sn;
    time=time+1;
end
s=sn(1:end-1);