function deg = Degree(A)
% Degree: To compute the degree and out/in degree of a complex network. 
% See also: OutDegree, InDegree, Degree_un
% Version 2017.02.13
%%  Inputs: 
%     A - The adjacent matrix of a complex network. The (i,j) entity is 1
%     if node i points to node j.
%%  Outputs:
%     deg - The degree of a complex network. From the first to the third 
%     columns, there are degree, out-degree and in-degree, i.e. for node a,
%     deg(a,1) is its degree, deg(a,2) is its out-degree, deg(a,3) is its
%     in- degree.

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
outdeg = sum(A,2);
indeg = sum(A,1)';

B = A+A'; B(B~=0) = 1;
totaldeg = sum(B,2);

deg = [totaldeg,outdeg,indeg];
deg = full(deg);