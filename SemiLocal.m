function Local = SemiLocal(A,iteration)
% SemiLocal: Perfrom Semi-Local algorithm to rank node. 
% Ref: Chen D-B, et al. Identifying influential nodes in complex networks.
%      Physica a, 2012, 391(4): 1777-1787.
%      http://dx.doi.org/10.1016/j.physa.2011.09.017
% Ref2: Xu, S., et al (2017). Iterative Neighbour-Information Gathering for
%       Ranking Nodes in Complex Networks. Scientific Reports, 7.
%       http://www.nature.com/articles/srep41321
% See also: Ing
% Version 2017.02.14
%% Inputs:
%   A - The adjacency matrix of undirected network, where a_{ij}=1 
%               if node i connect with node j. 
%   iteration - (optional) The iteration times. 2 corresponds to the semi-
%               local centrality. Default is 2.
%%  Outputs:
%     Local - The semi-local score.

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
    iteration=2;
end
N = length(A(:,1));
A = sparse(A);
for i=1:N
    NeighborLink = A(logical(A(i,:)),:);
    FirstSecondNeighbor = logical(sum(NeighborLink,1)+A(i,:));
    FirstSecondNeighbor(i) = 0;
    C(i,1) = sum(FirstSecondNeighbor); 
    % Now vector C is nearest and next nearest neighbors degree.
end

Local = Ing(A,'A',C,iteration);