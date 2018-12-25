function HI_list = InHindexCN(A,order)
% HindexCN: To compute the in H-index of a complex network. 
% Ref: L¨¹ L, et al. The H-index of a network node and its relation to
%      degree and coreness[J]. Nature communications, 2016, 7.
% See also: Hindex, HindexCN, OutHindexCN 
% Version 2017.02.13
%%  Inputs: 
%     A - The adjacent matrix of a complex network. The (i,j) entity is 1
%     if node i points to node j.
%     order - (optional) The order of H-index. Defult: 1. 
%%  Outputs:
%     HI_list - The in H-index of a complex network. 
%%  Example:
% If we have a complex network with adjacent matrix A, we can run following
% code to obtain the in H-index.
% ###########code############
% h = InHindexCN(A); 
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
if nargin==1;
    order=1;
end

A = sparse(A);
Degree_All = Degree(A);
InDegree = Degree_All(:,2);
N = length(InDegree);

for j=1:order
    for i=1:N
        InNeighborIndex = logical(A(i,:));
        InNeighborDegree = InDegree(InNeighborIndex);
        NodeHindex(i,1) = Hindex(InNeighborDegree);
    end
    InDegree = NodeHindex;
end

HI_list = NodeHindex;