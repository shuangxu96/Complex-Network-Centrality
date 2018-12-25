function coreness = Coreness(A)
% Coreness: To compute the coreness of a complex network, based on H-index 
%           update algorithm. 
% Ref: L¨¹ L, et al. The H-index of a network node and its relation to
%      degree and coreness[J]. Nature communications, 2016, 7.
% See also: InCoreness, OutCoreness, Hindex
% Version 2017.02.13
%%  Inputs: 
%     A - The adjacent matrix of a complex network. The (i,j) entity is 1
%     if node i points to node j.
%%  Outputs:
%     coreness - The coreness of a complex network. The first column is
%     coreness; the second column is out coreness; the third column is in
%     coreness.
%%  Example:
% If we have a complex network with adjacent matrix A, we can run following
% code to obtain the coreness.
% ###########code############
% h = Coreness(A); 
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
A = sparse(A);
Degree_All = Degree(A);
Deg = Degree_All(:,1);
OutDeg = Degree_All(:,2);
InDeg = Degree_All(:,3);
N = length(Deg);

err = [1,1,1];
while sum(err)~=0
    for i=1:N
        OutNeighborIndex = logical(A(i,:));
        InNeighborIndex = logical(A(:,i))';
        AllNeighborIndex = logical(OutNeighborIndex+InNeighborIndex);
        
        OutNeighborDegree = OutDeg(OutNeighborIndex);
        InNeighborDegree = InDeg(InNeighborIndex);
        NeighborDegree = Deg(AllNeighborIndex);
        
        NodeHindex(i,1) = Hindex(NeighborDegree);
        NodeHindex(i,2) = Hindex(OutNeighborDegree);
        NodeHindex(i,3) = Hindex(InNeighborDegree);
    end
    err(1) = sum(Deg-NodeHindex(:,1));
    err(2) = sum(OutDeg-NodeHindex(:,2));
    err(3) = sum(InDeg-NodeHindex(:,3));
    Degree_All = NodeHindex;
    Deg = Degree_All(:,1);
    OutDeg = Degree_All(:,2);
    InDeg = Degree_All(:,3);
end

coreness = NodeHindex;