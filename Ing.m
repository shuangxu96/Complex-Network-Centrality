function IngScore = Ing(A,L,s,n)
% Ing: Perfrom Iterative Neighbor-information Gathering algorithm to rank 
%      node. 
% Ref: Xu, S., et al (2017). Iterative Neighbour-Information Gathering for
%       Ranking Nodes in Complex Networks. Scientific Reports, 7.
%       http://www.nature.com/articles/srep41321
% See also: 
% Version 2017.02.14
%% Inputs:
%   A - The adjacency matrix of undirected network, where a_{ij}=1 
%               if node i connect with node j. 
%   L - Linear transformation. 'A' or 'W'.
%   s - The prior information (initial Ing score).
%   n - Iteration time.
%%  Outputs:
%     IngScore - The Ing score.

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
N = length(A(:,1));
IngScoreMatrix = s(:);

if L=='A';
    Matrix = A;
end
if L=='W';
    Matrix = A+speye(N);
end

for i=1:n
    IngScoreMatrix(:,i+1) = Matrix*IngScoreMatrix(:,i);
    IngScoreMatrix(:,i+1) = IngScoreMatrix(:,i+1)/max(IngScoreMatrix(:,i+1));
end

IngScore = IngScoreMatrix(:,end);