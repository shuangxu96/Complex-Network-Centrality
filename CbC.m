function s = CbC(A,Com)
% CbC: Perform Community-based-Centrality (CbC) to rank node.
% Ref: Zhao Z., et al. A Community-Based Approach to Identifying
%      Influential Spreaders. Entropy 2015, 17, 2228-2252.
% See also: AdaptiveLeaderRank WeightLeaderRank
% Version 2017.02.13
%%  Inputs:
%     A - The adjacent matrix of a complex network. The (i,j) entity is 1
%     if node i points to node j.
%     Com - The community index of each node.
%%  Outputs:
%     s - The CbC score.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Complex Network Centrality:                              %
%                                                          %
% Copyright (C) 2017 Shuang Xu. All rights reserved.       %
%                    henuxs@foxmail.com                    %
%                    b.sawako@outlook.com                  %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Code begins
A=sparse(A);
N=length(A(:,1));
Com=sparse(Com);
Com_min=min(Com);
if Com_min<=0;
    Com = Com + abs(Com_min) +1;
end
c=length(unique(Com));
Size_com=tabulate(Com);
Size_com=Size_com(:,2)/N;

s = zeros(N,1);
for i=1:N
    Neighbour=find(A(i,:));
    NeighbourCom=Com(Neighbour);
    NeighbourComD=tabulate(NeighbourCom);
    NeighbourComD(:,3)=Size_com(NeighbourComD(:,1));
    s(i)=NeighbourComD(:,2)'*NeighbourComD(:,3);
end