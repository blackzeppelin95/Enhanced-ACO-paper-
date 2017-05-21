Kp=1.75
Ki=8.51
Kd=8.63
lam=0.63
mu=0.95
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
%plot(1:n_iter,ysol)
title('Cost wrt iterations');
subplot(2,1,2)
plot(t,i);
grid on;
hold on
plot(t,ones(size(t)));
title('Step response with optimised controller');
e=ones(size(t))-i;%error
 e=abs(e);
%plot(t,e)
y1=sum(t.*e)
S = stepinfo(i,t,1)