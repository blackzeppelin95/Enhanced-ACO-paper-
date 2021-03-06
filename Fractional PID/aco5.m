%%ACO Parameters
%  n_iter=100; %number of iterationoriginal
tic
n_iter=50; %number of iteration
NA=10; % Number of Ants
% case3
%alpha = 0.27;beta = 0.19; roh=0.83;
%alpha=1.87;beta=0.27;roh=1.87;
% case4
% alpha=0.8;beta=0.2;roh=0.7; 
% case 5
% alpha=0.5;beta=0.5; roh=0.5; 
% case 6
% alpha=0.3;  beta=0.6;  roh=0.5; 
% case 7
 alpha=0.8;  beta=0.3; roh=0.6; 
% case 8
% alpha= 0.1409; beta= 0.5669;  roh=0.0506;
% case 9
% alpha= 0.2328;  beta=1.0676;  roh=0.2415;
% case 10
% % alpha= 0.7792;  beta= 0.9340;  roh=0.1299;
% %case 11
% % alpha= 0.1626; beta=0.1190;  roh=0.4984;
% % case 12
%alpha= 1.14440; beta= 0.01367; roh=1.2034;
% alpha =0.3426; beta =0.6595; roh = 0.0248;
%  alpha=0.1455; beta=1.05316; roh=1.1604;
% alpha=0.29405; beta=0.4483; roh=0.05363;
% alpha=    0.8826; beta=0.4654 ; roh=0.2023;
% alpha=0.359; beta=0.428; roh=0.403;
% alpha =0.3523; beta = 0.4093; roh =.3766;
% alpha =0.1663;beta =0.6371; roh =0.0343;
% alpha =0.3426; beta =0.6595; roh = 0.0248;
%alpha =0.0187; beta =0.6283; roh =0.0780;
 % param_ant=rand(1,8);
% alpha=param_ant(1)
% beta=param_ant(2)
% roh=param_ant(3)
n_param=5; % Number of paramters
LB=(0.01).*ones(1,27); % lower bound
% UB=10.*ones(1,27); % upper bound
UB=[10 10 10 1 1]; % upper bound
 
n_node=500; % number of nodes for each param
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
        cost(A)=multiob3(Nodes(ant(A,1),1),Nodes(ant(A,2),2),Nodes(ant(A,3),3),Nodes(ant(A,4),4),Nodes(ant(A,5),5));
        disp(['Ant number: ' num2str(A)])
        disp(['Ant Cost: ' num2str(cost(A))])
        disp(['Ant Paramters: ' num2str(Nodes(ant(A,:)))])
        if iter~=1
        disp(['iteration: ' num2str(iter)])
        disp('_________________')
        disp(['Best cost: ' num2str(cost_best)])
        disp(['Best paramter 1: ' num2str(Kp_best)]);
        disp(['Best paramter 2: ' num2str(Ki_best)]);
        disp(['Best paramter 3: ' num2str(Kd_best)]);
        disp(['Best paramter 4: ' num2str(lam_best)]);
        disp(['Best paramter 5: ' num2str(mu_best)]);
%         disp(['Best paramter 1: ' num2str(Nodes(ant(cost_best_ind,1),1))])
%         disp(['Best paramter 2: ' num2str(Nodes(ant(cost_best_ind,2),2))])
%         disp(['Best paramter 3: ' num2str(Nodes(ant(cost_best_ind,3),3))])
%         disp(['Best paramter 4: ' num2str(Nodes(ant(cost_best_ind,4),4))])
%         disp(['Best paramter 5: ' num2str(Nodes(ant(cost_best_ind,5),5))])
        end
        

    end
    [cost_best,cost_best_ind]=min(cost);
    
    % Elitsem
    if (cost_best>cost_best_prev) && (iter~=1)
        %[cost_worst,cost_worst_ind]=max(cost);
       %ant(cost_worst_ind,:)=best_prev_ant;
        cost_best=cost_best_prev;
        cost_best_ind=cost_best_prev_ind;
        Kp_best=Kp_best_prev;
        Ki_best=Ki_best_prev;
        Kd_best=Kd_best_prev;
        lam_best=lam_best_prev;
        mu_best=mu_best_prev;
%         Ki_best=Nodes(ant(cost_best_prev_ind,2),2);
%         Kd_best=Nodes(ant(cost_best_prev_ind,3),3);
%         lam_best=Nodes(ant(cost_best_prev_ind,4),4);
%         mu_best=Nodes(ant(cost_best_prev_ind,5),5);
  
        %cost_best_ind=cost_worst_ind;
    else
        cost_best_prev=cost_best;
        cost_best_prev_ind=cost_best_ind;
        Kp_best=Nodes(ant(cost_best_ind,1),1);
        Ki_best=Nodes(ant(cost_best_ind,2),2);
        Kd_best=Nodes(ant(cost_best_ind,3),3);
        lam_best=Nodes(ant(cost_best_ind,4),4);
        mu_best=Nodes(ant(cost_best_ind,5),5);
        Kp_best_prev=Kp_best;
        Ki_best_prev=Ki_best;
        Kd_best_prev=Kd_best;
        lam_best_prev=lam_best;
        mu_best_prev=mu_best;
        best_prev_ant=ant(cost_best_ind,:)
    end
    
    
    
    dT=zeros(n_node,n_param); % Change of Phormone
    for tour_i=1:n_param
        for A=1:NA
            dT(ant(A,tour_i),tour_i)=dT(ant(A,tour_i),tour_i)+cost_best/cost(A);
        end
    end
    
    T= roh.*T + dT;
    ysol(iter)=cost_best;
end

     %% Plots , this section will not effect the algorithem
    % you can remove it to speed up the run
  
   % plot(cost_mat)
% %     figure(2)
%     cost_func(Nodes(ant(cost_best_ind,:)),1);
%     
%     param_mat(iter,:)=Nodes(ant(cost_best_ind,:));
%     save('ACO_data.mat','cost_mat','param_mat')
%     drawnow

%if plotfig
 %   figure(3)
  %  plot(t,reference,t,output)
   % end
Kp=Kp_best
Ki=Ki_best
Kd=Kd_best
lam=lam_best
mu=mu_best
bp=[5 0 0];         %plant parameters
ap=[1 1.3 1.25];
nap=[2.3 0.9 0];
nbp=[0 0 0];
Gp=fotf(ap,nap,bp,nbp); %plant trans fn 1




bc=[Kp Ki Kd]; %controller parameters 
ac=[1 0 0];
nbc=[lam 0 mu+lam];
nac=[lam 0 0];
Gc=fotf(ac,nac,bc,nbc); %controller trans fn
au=[1 0 0]; %unity trans fn for feedback
bu=[1 0 0];
nbu=[0 0 0];
nau=[0 0 0];
Gu=fotf(au,nau,bu,nbu);  %unity trans fn 
Gf=mtimes(Gc,Gp);  %forward loop trans fn
Gl=feedback(Gf,Gu); %closed loop with unity feedback 
display(Gl) %final transfer function
t=[0:0.1:30];
i=lsim(Gl,ones(size(t)),t);
subplot(2,1,1)
plot(1:n_iter,ysol)
title('Cost wrt iterations');
subplot(2,1,2)
plot(t,i);
grid on;
hold on
plot(t,ones(size(t)));
title('Step response with optimised controller');
toc
