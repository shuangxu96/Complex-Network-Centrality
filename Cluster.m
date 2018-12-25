function c = Cluster(A)
% Cluster: To compute cluster coefficient, which is defined as c_i=
%          (the number of links between node i's neighbors)/(k^out**2-1),
%           where k^out is out-degree and **2 is second power. 
% Ref: Chen D-B, et al. (2013) Identifying Influential Nodes in Large-Scale
%      Directed Networks: The Role of Clustering. PLoS ONE 8(10): e77455.
%      doi:10.1371/journal.pone.0077455
% See also: ClusterRank
% Version 2017.02.13
%%  Inputs:
%     A - The adjacent matrix of a complex network. The (i,j) entity is 1
%     if node i points to node j.
%%  Outputs:
%     c - The cluster coefficient.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Complex Network Centrality:                              %
%                                                          %
% Copyright (C) 2017 Shuang Xu. All rights reserved.       %
%                    henuxs@foxmail.com                    %
%                    b.sawako@outlook.com                  %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Code begins
OutDeg = sum(A,2);
N = length(OutDeg);
c = zeros(N,1); % Clustering Coefficient
for i=1:N
    if OutDeg(i)<=1;
        c(i) = 0;
    else
        NeighborList = find(A(i,:)==1);
        NeighborNumber = length(NeighborList);
        e_jk=0;
        for j=1:NeighborNumber
            if OutDeg(NeighborList(j))>=1
            NeighborList_j = find(A(NeighborList(j),:)==1);
            NeighborList_Delete_j = NeighborList;
            NeighborList_Delete_j(find(NeighborList==NeighborList(j)))=[];
            InterNeighbor = intersect(NeighborList_Delete_j,NeighborList_j);
            e_jk = e_jk+length(InterNeighbor);
            end
        end
        c(i) = e_jk/(OutDeg(i)*(OutDeg(i)-1));
    end
end