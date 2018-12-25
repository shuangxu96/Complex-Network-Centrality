function shell = MDD(A,lambda)
% MDD: Perform the mixed degree decomposition (MDD) procedure. It's a
%      decomposition algorithm designed for undirected network. This code
%      will return the shell or layer of each node. Remark that node shell 
%      may be no longer integer in MDD, which is different from that in 
%      k-shell decomposition.
% Ref: Zeng A, Zhang C J. Ranking spreaders by decomposing complex 
%      networks. Phys Lett A, 2013, 377(14): 1031-1035.
%      http://dx.doi.org/10.1016/j.physleta.2013.02.039
% See also: Coreness
% Version 2017.02.14
%% Inputs:
%   A - The adjacency matrix of undirected network, where a_{ij}=1
%               if node i connect with node j.
%   lambda - (optional) A tunable parameter lies in [0,1]. 1 corresponds
%             to degree and 0 corresponds to k-shell. Default is 0.7.
%% Outputs:
%  shell - The vector of node layer.

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
    lambda=0.7;
end
if isreal(lambda)==0;
    error('lambda is not a real number!')
end
if lambda>1 | lambda<0;
    warning('The value of lambda is not in [0,1], code has set it as 0.7 automatically.')
end

Anew = A; % To record the new network after removing
N = length(A(:,1));
shell = zeros(N,1);
Removed = [];% To record the removed nodes
kr = sum(A,2);% residual degree
ke = zeros(N,1);% exhausted degree
km = kr+lambda*ke;% mixed degree
km(:,2) = [1:N]'; % the 2nd column is the node ID


if issymmetric(A)==0
    while length(Removed)~=N % judge whether all nodes are assigned a shell
        MinMixedDeg = min(km(:,1));
        Position = find(km(:,1)==MinMixedDeg);
        NodeList = km(:,2); RemovedID = NodeList(Position);%removed node ID in this step
        Removed = [Removed;RemovedID]; % all removed node ID
        shell(RemovedID) = MinMixedDeg; % assign shell number
        Anew(RemovedID,:)=0; Anew(:,RemovedID)=0;
        kr = sum(Anew,2);
        ke = sum(A(Removed,:),1);%
        km = kr(:)+lambda*ke(:); km(:,2) = [1:N]';
        km(Removed,:)=[];
        while min(km(:,1))<=MinMixedDeg
            Position = find(km(:,1)<=MinMixedDeg);
            NodeList = km(:,2); RemovedID = NodeList(Position);
            Removed = [Removed;RemovedID];
            shell(RemovedID) = MinMixedDeg;
            Anew(RemovedID,:)=0; Anew(:,RemovedID)=0;
            kr = sum(Anew,2);
            ke = sum(A(Removed,:),1);
            km = kr(:)+lambda*ke(:); km(:,2) = [1:N]';
            km(Removed,:)=[];
        end
    end
else
    while length(Removed)~=N % judge whether all nodes are assigned a shell
        MinMixedDeg = min(km(:,1));
        Position = find(km(:,1)==MinMixedDeg);
        NodeList = km(:,2); RemovedID = NodeList(Position);%removed node ID in this step
        Removed = [Removed;RemovedID]; % all removed node ID
        shell(RemovedID) = MinMixedDeg; % assign shell number
        Anew(RemovedID,:)=0; Anew(:,RemovedID)=0;
        kr = sum(Anew,2);
        ke = sum(A(:,Removed),2);%
        km = kr(:)+lambda*ke(:); km(:,2) = [1:N]';
        km(Removed,:)=[];
        while min(km(:,1))<=MinMixedDeg
            Position = find(km(:,1)<=MinMixedDeg);
            NodeList = km(:,2); RemovedID = NodeList(Position);
            Removed = [Removed;RemovedID];
            shell(RemovedID) = MinMixedDeg;
            Anew(RemovedID,:)=0; Anew(:,RemovedID)=0;
            kr = sum(Anew,2);
            ke = sum(A(:,Removed),2);
            km = kr(:)+lambda*ke(:); km(:,2) = [1:N]';
            km(Removed,:)=[];
        end
    end
end