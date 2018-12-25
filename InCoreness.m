function coreness = InCoreness(A)
% Coreness: To compute the in coreness of a complex network, based on 
%           H-index update algorithm. 
% Ref: L¨¹ L, et al. The H-index of a network node and its relation to
%      degree and coreness[J]. Nature communications, 2016, 7.
% See also: Coreness, OutCoreness, Hindex
% Version 2017.02.13
%%  Inputs: 
%     A - The adjacent matrix of a complex network. The (i,j) entity is 1
%     if node i points to node j.
%%  Outputs:
%     coreness - The in coreness of a complex network. 
%%  Example:
% If we have a complex network with adjacent matrix A, we can run following
% code to obtain the in coreness.
% ###########code############
% h = InCoreness(A); 
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
InDeg = InDegree(A);
N = length(InDeg);

err = [1];
while sum(err)~=0
    for i=1:N
        InNeighborIndex = logical(A(i,:));
        InNeighborDegree = InDeg(InNeighborIndex);
        NodeHindex(i,1) = Hindex(InNeighborDegree);
    end
    err = norm(InDeg-NodeHindex,1);
    InDeg = NodeHindex;
end

coreness = NodeHindex;