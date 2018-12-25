function s = ClusterRank(A)
% Cluster: Perform ClusterRank algorithm to rank node.
% Ref: Chen D-B, et al. (2013) Identifying Influential Nodes in Large-Scale
%      Directed Networks: The Role of Clustering. PLoS ONE 8(10): e77455.
%      doi:10.1371/journal.pone.0077455
% See also: Cluster
% Version 2017.02.13
%%  Inputs:
%     A - The adjacent matrix of a complex network. The (i,j) entity is 1
%     if node i points to node j.
%%  Outputs:
%     s - The ClusterRank score.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Complex Network Centrality:                              %
%                                                          %
% Copyright (C) 2017 Shuang Xu. All rights reserved.       %
%                    henuxs@foxmail.com                    %
%                    b.sawako@outlook.com                  %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Code begins 
OutDeg = OutDegree(A);
N = length(OutDeg);
c = Cluster(A);

s1 = sparse(A)*OutDeg;
s1 = s1+OutDeg;
f = 10.^(-c);
s = s1.*f;