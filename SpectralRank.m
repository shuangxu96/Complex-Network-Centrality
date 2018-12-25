function s = SpectralRank(A,tol)
% SpectralRank: Perfrom SpectralRank algorithm to rank node. 
% Ref: 
% See also: LeaderRank
% Version 2017.02.14
%%  Inputs:
%     A - The adjacent matrix of a complex network. The (i,j) entity is 1
%     if node i points to node j.
%     tol - (optional) The tolerance of error. Defult: 1e-3.
%%  Outputs:
%     s - The SpectralRank score.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Complex Network Centrality:                              %
%                                                          %
% Copyright (C) 2017 Shuang Xu. All rights reserved.       %
%                    henuxs@foxmail.com                    %
%                    b.sawako@outlook.com                  %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Code begins
if nargin<=1;
    tol=1e-3;
end
A=sparse(A);
N=length(A(:,1));
G=A; G(N+1,N+1)=0; G(:,N+1)=ones(N+1,1); G(N+1,:)=ones(1,N+1); G(N+1,N+1)=0;

s=ones(N+1,1);
err=1;

while err>tol
    s_new=G*s;
    s_new=s_new/sum(s_new);
    err=norm(s-s_new,1);
    s=s_new;
end

s=s_new(1:end-1)+s_new(end)/N; 