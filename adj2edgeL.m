function edge=adj2edgeL(A)
% adj2edgeL: Map adjacent matrix A to edge list. 
% See also: 
% Version 2017.02.15
%%  Inputs:
%     A - The adjacent matrix of a complex network. The (i,j) entity is 1
%     if node i points to node j.
%%  Outputs:
%     edge - The edge list. First column: source node. Second column:
%     target node. Third column: edge weight.

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
[s,t] = find(A>0); % indices of all edges
M = size(s,1);

edge = [];
for e = 1:M
  edge=[edge; s(e) t(e) A(s(e),t(e))];
end