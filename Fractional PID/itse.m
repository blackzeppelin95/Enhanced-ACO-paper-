function y= itae(Kp,Ki,Kd,lam,mu)

bp=[5 0 0];         %plant parameters
ap=[1 1.3 1.25];
nap=[2.3 0.9 0];
nbp=[0 0 0];
Gp=fotf(ap,nap,bp,nbp); %plant trans fn
bc=[Kp Ki Kd]; %controller parameters 
ac=[1 0 0];
nbc=[lam 0 mu+lam];
nac=[lam 0 0];
Gc=fotf(ac,nac,bc,nbc); %controller trans f
au=[1 0 0]; %unity trans fn for feedback
bu=[1 0 0];
nbu=[0 0 0];
nau=[0 0 0];
Gu=fotf(au,nau,bu,nbu);  %unity trans fn 
Gf=mtimes(Gc,Gp);  %forward loop trns fn
Gl=feedback(Gf,Gu); %closed loop with unity feedback 
%display(Gl)
t=[0:0.1:30];
i=lsim(Gl,ones(size(t)),t);
%plot(t,i)
e=ones(size(t))-i;%error
e=abs(e);
%plot(t,e)
y=sum(t.*e); % y is the itse

