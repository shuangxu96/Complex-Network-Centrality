function HI_list = HindexCN(A,order)
% HindexCN: To compute the H-index of a complex network. In complex network
%           , the definition of the 1-order H-index is that a node whose 
%           H-index is h has h neighbors, each of which has degre at least 
%           h. Actually, we can view degree as 0-order H-index. High-order
%           H-index can be defined similarly. As order growing, it will 
%           converge to coreness. 
% Ref: L¨¹ L, et al. The H-index of a network node and its relation to
%      degree and coreness[J]. Nature communications, 2016, 7.
% See also: Hindex, OutHindexCN, InHindexCN 
% Version 2017.02.13
%%  Inputs: 
%     A - The adjacent matrix of a complex network. The (i,j) entity is 1
%     if node i points to node j.
%     order - (optional) The order of H-index. Defult: 1. 
%%  Outputs:
%     HI_list - The H-index of a complex network. The first column is
%     H-index; the second column is out H-index; the third column is in
%     H-index.
%%  Example:
% If we have a complex network with adjacent matrix A, we can run following
% code to obtain the H-index.
% ###########code############
% h = HindexCN(A); 
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
Deg = Degree_All(:,1);
OutDegree = Degree_All(:,2);
InDegree = Degree_All(:,3);
N = length(Deg);


for j=1:order
    for i=1:N
        OutNeighborIndex = logical(A(i,:));
        InNeighborIndex = logical(A(:,i))';
        AllNeighborIndex = logical(OutNeighborIndex+InNeighborIndex);
        
        OutNeighborDegree = OutDegree(OutNeighborIndex);
        InNeighborDegree = InDegree(InNeighborIndex);
        NeighborDegree = Deg(AllNeighborIndex);
        
        NodeHindex(i,1) = Hindex(NeighborDegree);
        NodeHindex(i,2) = Hindex(OutNeighborDegree);
        NodeHindex(i,3) = Hindex(InNeighborDegree);
    end
    Degree_All = NodeHindex;
    Deg = Degree_All(:,1);
    OutDegree = Degree_All(:,2);
    InDegree = Degree_All(:,3);
end

HI_list = NodeHindex;