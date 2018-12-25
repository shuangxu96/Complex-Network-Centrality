function A = edgeL2adj(edge)
% edgeL2adj: Map edge list to adjacent matrix A. 
% See also: 
% Version 2017.02.15
%%  Inputs:
%     edge - The edge list. First column: source node. Second column:
%     target node. Third column: edge weight.
%%  Outputs:
%     A - The adjacent matrix of a complex network. The (i,j) entity is 1
%     if node i points to node j.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Complex Network Centrality:                              %
%                                                          %
% Copyright (C) 2017 Shuang Xu. All rights reserved.       %
%                    henuxs@foxmail.com                    %
%                    b.sawako@outlook.com                  %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Code begins
N = max(max(edge(:,1:2)));
M = size(edge,1);
A = sparse(0); A(N,N) = 0;
nodes=sort(unique([edge(:,1) edge(:,2)])); % get all nodes, sorted

for e = 1:M
    A(edge(e,1),edge(e,2)) = edge(e,3);
end