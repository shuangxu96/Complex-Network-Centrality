function s = INK(A,alpha)
% INK: Perform the improved neighbors' k-core (INK) to rank node. 
% Ref: Lin, J.H., et al. Identifying the node spreading influence with
%      largest k-core value. Physics Letters A, 378(2014):3279-3284.
%      http://dx.doi.org/10.1016/j.physleta.2014.09.054
% Ref2: Xu, S., et al (2017). Iterative Neighbour-Information Gathering for
%       Ranking Nodes in Complex Networks. Scientific Reports, 7.
%       http://www.nature.com/articles/srep41321
% See also: Ing
% Version 2017.02.14
%% Inputs:
%   A         - The adjacency matrix of the network. a_{ij}=1 if node i connect
%               with node j.
%   alpha     - (optional) A parameter. 1 corresponds to the sum of
%               neighbors's k-core value. Default is 1.
%% Outputs:
%   s    - The vector of INK centrality. 

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
    alpha = 1;
end
core = OutCoreness(A);
core = core.^alpha;
s = Ing(A,'A',core,1);