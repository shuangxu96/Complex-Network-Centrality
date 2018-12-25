function outdegree = OutDegree(A)
% Degree: To compute the out degree of a complex network. 
% See also: Degree, InDegree, Degree_un
% Version 2017.02.13
%%  Inputs: 
%     A - The adjacent matrix of a complex network. The (i,j) entity is 1
%     if node i points to node j.
%%  Outputs:
%     outdegree - The out degree of a complex network. 

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
outdegree = sum(A,2);