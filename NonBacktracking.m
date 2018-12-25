function [NB_C,NB] = NonBacktracking(A)
% NonBacktracking: Perform NonBacktracking to rank node. 
% See also: 
% Version 2017.02.15
%%  Inputs:
%     A - The adjacent matrix of a complex network. The (i,j) entity is 1
%     if node i points to node j.
%%  Outputs:
%     NB_C - The non-backtracking centrality.
%     NB  - The non-backtracking matrix of a complex network. The (a,b) 
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
N = size(A,1);
edge = adj2edgeL(A);
M = size(edge,1);
edgeIndex = [ [1:M]', edge];
stage1 = 1; 
for i = 1:N
    if i>=stage1*N/10;disp(['Stage I:',num2str(100*i/N),'%']),stage1 = stage1+1; end
    edge_index = find(edge(:,1)==i);
    node_index = edge(edge_index,2);
    TargetIndex{i} = [edge_index,node_index];
end

NB = sparse(0); NB(M,M) = 0;
stage2 = 1; 

for a = 1:M
    if a>=stage2*M/10;disp(['Stage II:',num2str(100*a/M),'%']),stage2 = stage2+1;save 'WikiBooks_fr_NB_NB&aa.mat';
    end
    source = edge(a,1);
    target = edge(a,2);
    target_info = TargetIndex{target};
    non_backtracking_edgeindex = target_info(:,1);
    non_backtracking_nodeindex = target_info(:,2);
    flag = find(non_backtracking_nodeindex==source);
    if isempty(flag)==0 % if flag is not empty
        non_backtracking_edgeindex(flag) = [];
    end
    NB(a,non_backtracking_edgeindex) = 1;
    
end

[vector] = myeig(NB);
NB_C = zeros(N,1);
for i=1:N
    node_info = TargetIndex{i};
    node_s_edge = node_info(:,1);
    NB_C(i) = sum(vector(node_s_edge));
end
