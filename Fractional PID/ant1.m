clc
close all;
clear all;
%%ACO Parameters
%  n_iter=100; %number of iterationoriginal
n_iter=600; %number of iteration
NA=10; % Number of Ants
% case3
% alpha = 0.1663;beta = 0.1766; roh=0.3667;
% case4
% alpha=0.8;beta=0.2;roh=0.7; 
% case 5
% alpha=0.5;beta=0.5; roh=0.5; 
% case 6
% alpha=0.3;  beta=0.6;  roh=0.5; 
% case 7
% alpha=0.8;  beta=0.3; roh=0.6; 
% case 8
% alpha= 0.1409; beta= 0.5669;  roh=0.0506;
% case 9
% alpha= 0.2328;  beta=1.0676;  roh=0.2415;
% case 10
% % alpha= 0.7792;  beta= 0.9340;  roh=0.1299;
% %case 11
% % alpha= 0.1626; beta=0.1190;  roh=0.4984;
% % case 12
% alpha= 0.1440; beta= 1.0467; roh=1.1634;
% alpha =0.3426; beta =0.6595; roh = 0.0248;
%  alpha=0.1455; beta=1.05316; roh=1.1604;
% alpha=0.29405; beta=0.4483; roh=0.05363;
% alpha=    0.8826; beta=0.4654 ; roh=0.2023;
% alpha=0.359; beta=0.428; roh=0.403;
% alpha =0.3523; beta = 0.4093; roh =.3766;
% alpha =0.1663;beta =0.6371; roh =0.0343;
%  alpha =0.3426; beta =0.6595; roh = 0.0248;
 alpha =0.0187; beta =0.6283; roh =0.0780;
 % param_ant=rand(1,8);
% alpha=param_ant(1)
% beta=param_ant(2)
% roh=param_ant(3)
n_param=5; % Number of paramters
LB=(0.01).*ones(1,27); % lower bound
% UB=10.*ones(1,27); % upper bound
UB=1.*ones(1,27); % upper bound
 
n_node=100; % number of nodes for each param
cost_best_prev=inf;
%% Generating Nodes
T=ones(n_node,n_param).*eps; % Phormone Matrix
dT=zeros(n_node,n_param); % Change of Phormone
for i=1:n_param
    Nodes(:,i) =linspace(LB(i),UB(i),n_node); % Node generation at equal spaced points
end
%% Iteration loop
for iter=1:n_iter
  
    for tour_i=1:n_param
        prob(:,tour_i)= (T(:,tour_i).^alpha) .* ((1./Nodes(:,tour_i)).^beta);
        prob(:,tour_i)=prob(:,tour_i)./sum(prob(:,tour_i));
    end
    
    for A=1:NA
        for tour_i=1:n_param
            node_sel=rand;
            node_ind=1;
            prob_sum=0;
            for j=1:n_node
                prob_sum=prob_sum+prob(j,tour_i);
                if prob_sum>=node_sel
                    node_ind=j;
                    break
                end
            end
            ant(A,tour_i)=node_ind;
        end
        cost(A)=cost_func2ANT(Nodes(ant(A,:)),0);
        clc
        disp(['Ant number: ' num2str(A)])
        disp(['Ant Cost: ' num2str(cost(A))])
        disp(['Ant Paramters: ' num2str(Nodes(ant(A,:)))])
        if iter~=1
        disp(['iteration: ' num2str(iter)])
        disp('_________________')
        disp(['Best cost: ' num2str(cost_best)])
        disp(['Best paramters: ' num2str(Nodes(ant(cost_best_ind,:)))])
        end
        
        
    end
    [cost_best,cost_best_ind]=min(cost);
    
    % Elitsem
    if (cost_best>cost_best_prev) && (iter~=1)
        [cost_worst,cost_worst_ind]=max(cost);
        ant(cost_worst_ind,:)=best_prev_ant;
        cost_best=cost_best_prev;
        cost_best_ind=cost_worst_ind;
    else
        cost_best_prev=cost_best;
        best_prev_ant=ant(cost_best_ind,:)
    end
    
    
    
    dT=zeros(n_node,n_param); % Change of Phormone
    for tour_i=1:n_param
        for A=1:NA
            dT(ant(A,tour_i),tour_i)=dT(ant(A,tour_i),tour_i)+cost_best/cost(A);
        end
    end
    
    T= roh.*T + dT;
     %% Plots , this section will not effect the algorithem
    % you can remove it to speed up the run
  cost_mat(iter)=cost_best;
% % 
     figure(1)
    plot(cost_mat)
% %     figure(2)
%     cost_func(Nodes(ant(cost_best_ind,:)),1);
%     
%     param_mat(iter,:)=Nodes(ant(cost_best_ind,:));
%     save('ACO_data.mat','cost_mat','param_mat')
%     drawnow
end
    

