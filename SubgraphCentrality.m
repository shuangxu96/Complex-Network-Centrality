function SC = SubgraphCentrality(A)
% SubgraphCentrality: Perfrom Subgraph Centrality algorithm to rank node.
%                     Notice that the definition of subgraph here is
%                     different from that in classic graph theory.
% Ref: Estrada E, Rodriguez-Velazquez J A. Subgraph centrality in complex 
%      networks. Phys Rev E, 2005, 71: 056103
%      https://doi.org/10.1103/PhysRevE.71.056103
% See also: Katz
% Version 2017.02.14
%%  Inputs:
%     A - The adjacent matrix of a complex network. The (i,j) entity is 1
%     if node i points to node j.
%%  Outputs:
%     SC - The subgraph centrality.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Complex Network Centrality:                              %
%                                                          %
% Copyright (C) 2017 Shuang Xu. All rights reserved.       %
%                    henuxs@foxmail.com                    %
%                    b.sawako@outlook.com                  %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Code begins
[vector,value] = eig(A);
value = diag(value);
SC = (vector.^2) * exp(value);