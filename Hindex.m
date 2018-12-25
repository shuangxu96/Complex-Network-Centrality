function h = Hindex(citations)
% Hindex: To compute the H-index of a scholar. The definition of the index 
%         is that a scholar with an index of h has published h papers each 
%         of which has been cited in other papers at least h times.
% Ref: L¨¹ L, et al. The H-index of a network node and its relation to
%      degree and coreness[J]. Nature communications, 2016, 7.
% Version 2017.02.13
%%  Inputs: 
%     citations - The citations of a scholar's papers.
%%  Outputs:
%     h - The H-index of the scholar.
%%  Example:
% If we have a researcher with 5 publications A, B, C, D, and E with 10, 8,
% 5, 4, and 3 citations, respectively, we can run following code to obtain 
% his/her H-index.
% ###########code############
% citations = [10,8,5,4,3];
% h = Hindex(citations); 
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
N = max(max(citations),max(length(citations)));
paper = zeros(N+1,1);
if isempty(citations)==1
    h = 0;
else
    for i=0:N;
        paper(i+1)=sum(logical(citations>=i));
    end
    i = N+1;
    H = 0:N;
    while H(i) > paper(i)
        i=i-1;
    end
    h = H(i);
end