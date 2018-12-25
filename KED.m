function f = KED(A)
% KED: Perfrom Path diversity algorithm to rank node. 
% Ref: Chen D B, et al. Path diversity improves the identification of 
%      influential spreaders. EPL, 2014, 104(6): 68006.
%      https://doi.org/10.1209/0295-5075/104/68006
% See also: 
% Version 2017.02.14
%% Inputs:
%   A - The adjacency matrix of undirected network, where a_{ij}=1 
%       if node i connect with node j. 
%%  Outputs:
%     f - The KED score.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Complex Network Centrality:                              %
%                                                          %
% Copyright (C) 2017 Shuang Xu. All rights reserved.       %
%                    henuxs@foxmail.com                    %
%                    b.sawako@outlook.com                  %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Code begins
N = length(A(:,1));
OutDegree = sum(A,2);
k = OutDegree;
P = (ones(N,1)*OutDegree')./(A*OutDegree*ones(1,N));
H = -P.*log(P);
E = ((A.*H)*ones(N,1))./log(OutDegree);
E(logical(k==1))=0;
E=E+1;
NeighborDegree = A*OutDegree;
D = exp(NeighborDegree/max(NeighborDegree));
f = k.*E.*D;