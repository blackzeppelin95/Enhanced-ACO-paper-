%Ant colony optimization 
%0<Kp<20
%0<Ki<5
%0<Kd<5
%0<mu<1
%0<lam<1
Kp=linspace(0,20);
Ki=linspace(0,5);
Kd=linspace(0,5);
mu=linspace(0,1);
lam=linspace(0,1);
Kp=Kp';
Ki=Ki';
Kd=Kd';
mu=mu';
lam=lam';
roh=0.5;
nants=100;
ant=[1:nants];
ant_loc=[zeros(100,1) node zeros(100,1)]
node=[Kp Ki Kd mu lam]% 500 nodes in total 
tau_initial=ones(100,5);
tau=tau_initial;%initializing peramone matrix 
for i=1:100
    for j=1:5
        prob(i,j)=tau(i,j)/sum(tau(:,j));%probability matrix
    end
end
for j=1:5
    for i=1:100
        ant(i)
    

    