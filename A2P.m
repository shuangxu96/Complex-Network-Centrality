function P=A2P(A);
% A2P: To obtain the transit probability matrix. 
% See also: 
% Version 2017.02.14
%% Inputs:
%   A - The adjacency matrix of undirected network, where a_{ij}=1 
%               if node i connect with node j. 
%%  Outputs:
%     P - The transit probability matrix.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Complex Network Centrality:                              %
%                                                          %
% Copyright (C) 2017 Shuang Xu. All rights reserved.       %
%                    henuxs@foxmail.com                    %
%                    b.sawako@outlook.com                  %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Code begins
outdegree=sum(A,2);
P=A;
N=length(A);
for i=1:N
    if outdegree(i)~=0;
    P(i,:)=P(i,:)/outdegree(i);
    end
end