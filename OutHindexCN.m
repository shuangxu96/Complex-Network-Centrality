function HI_list = OutHindexCN(A,order)
% HindexCN: To compute the out H-index of a complex network. 
% Ref: L¨¹ L, et al. The H-index of a network node and its relation to
%      degree and coreness[J]. Nature communications, 2016, 7.
% See also: Hindex, HindexCN, InHindexCN 
% Version 2017.02.13
%%  Inputs: 
%     A - The adjacent matrix of a complex network. The (i,j) entity is 1
%     if node i points to node j.
%     order - (optional) The order of H-index. Defult: 1. 
%%  Outputs:
%     HI_list - The out H-index of a complex network. 
%%  Example:
% If we have a complex network with adjacent matrix A, we can run following
% code to obtain the out H-index.
% ###########code############
% h = OutHindexCN(A); 
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
OutDegree = Degree_All(:,2);
N = length(OutDegree);

for j=1:order
    for i=1:N
        OutNeighborIndex = logical(A(i,:));
        OutNeighborDegree = OutDegree(OutNeighborIndex);
        NodeHindex(i,1) = Hindex(OutNeighborDegree);
    end
    OutDegree = NodeHindex;
end

HI_list = NodeHindex;