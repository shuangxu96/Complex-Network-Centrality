function [a, h] = HITs(A,tol)
% HITs: Perfrom HITs algorithm to rank node. 
% Ref: Kleinberg J M. Authoritative sources in a hyperlinked environment. 
%      JACM, 1999, 46: 604¨C632 
%      https://doi.org/10.1145/324133.324140
% See also: PageRank
% Version 2017.02.14
%%  Inputs:
%     A - The adjacent matrix of a complex network. The (i,j) entity is 1
%     if node i points to node j.
%     tol - (optional) The tolerance of error. Defult: 1e-3.
%%  Outputs:
%     a - The authority score.
%     h - The hub score.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Complex Network Centrality:                              %
%                                                          %
% Copyright (C) 2017 Shuang Xu. All rights reserved.       %
%                    henuxs@foxmail.com                    %
%                    b.sawako@outlook.com                  %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Code begins
if nargin<=1
    tol = 1e-3;
end

A = sparse(A);
N = length(A(:,1));
a = ones(N,1); 
h = ones(N,1);
err=[1,1];

while mean(err) > tol
    an = A*h;
    hn = A*an;
    an = an/sum(an);
    hn = hn/sum(hn);
    err(1) = norm(a-an,1);
    err(2) = norm(h-hn,1);
    a = an;
    h = hn;
end