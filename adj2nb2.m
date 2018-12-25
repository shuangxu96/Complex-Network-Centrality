function NB = adj2nb2(A)
% adj2nb: Map adjacent matrix A to non-backtracking matrix NB. 
% See also: 
% Version 2017.02.15
%%  Inputs:
%     A - The adjacent matrix of a complex network. The (i,j) entity is 1
%     if node i points to node j.
%%  Outputs:
%     NB - The non-backtracking matrix of a complex network. The (a,b) 
%     entity is 1, if edge a and edge b defines a non-backtracking with
%     length 2. The definition of non-backtracking: given edge a indexes
%     i->j and edge b indexes k->m, if j=k and i~=m, we call i->j(k)->m is
%     a non-backtracking.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Complex Network Centrality:                              %
%                                                          %
% Copyright (C) 2017 Shuang Xu. All rights reserved.       %
%                    henuxs@foxmail.com                    %
%                    b.sawako@outlook.com                  %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Code begins
edge = adj2edgeL(A);
M = size(edge,1);
edgeIndex = [ [1:M]', edge];
NB = sparse(0); NB(M,M) = 0;

for a = 1:M
    source = edge(a,1);
    target = edge(a,2);
    non_backtracking_edgeindex = find(edge(:,1)==target);
    non_backtracking_nodeindex = edge(non_backtracking_edgeindex,2);
    flag = find(non_backtracking_nodeindex==source);
    if isempty(flag)==0 % if flag is not empty
        non_backtracking_edgeindex(flag) = [];
    end
    NB(a,non_backtracking_edgeindex) = 1;
end