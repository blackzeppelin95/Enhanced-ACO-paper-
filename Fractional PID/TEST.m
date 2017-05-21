clc,clear,close all

Kp=2.55
Ki=5.75
Kd=6.39
lam=0.67
mu=0.67

% % 
% bp=[5 0 0];         %plant parameters
% ap=[1 1.3 1.25];
% nap=[2.3 0.9 0];
% nbp=[0 0 0];
% Gp=fotf(ap,nap,bp,nbp); %plant trans fn 1

% bp=[1 0 0];         %plant parameters
% ap=[0.8 0.5 1];
% nap=[2.2 0.9 0];
% nbp=[0 0 0];
% Gp=fotf(ap,nap,bp,nbp); %plant trans fn 3

% bp=[0 1 1];         %plant parameters
% ap=[10 185 288 1];
% nap=[3.2 2.5 0.7 0];
% nbp=[0 1 0];
% Gp=fotf(ap,nap,bp,nbp); %plant trans fn 4

bp=[5 2];         %plant parameters
ap=[1 3.1 2.89 2.5 1.2];
nap=[3.3 2.6 1.9 1.4 0];
nbp=[0.6 0 ];
Gp=fotf(ap,nap,bp,nbp); %plant trans fn 6

% ap=[1 3.2 2.4 1];         %plant parameters
% bp=[1 0 0];
% nap=[2.3 1.4 0.9 0];
% nbp=[0 0 0];
% Gp=fotf(ap,nap,bp,nbp); %plant trans fn 7         





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
Gl=feedback(Gf,Gu); %closed loop with unity feedb

t=[0:0.1:100];
i=lsim(Gl,ones(size(t)),t);

e=ones(size(t))-i;%error
e=abs(e);
%plot(t,e)
y1=sum(t.*e) % y is the itae
S = stepinfo(i,t,1)

plot(t,i,'b');
grid on;

title('5. GA VS ACO VS Enhanced ACO ');
hold on
Kp=9.6
Ki=6.45
Kd=9.64
lam=0.85631
mu=0.42027


% % 
% bp=[5 0 0];         %plant parameters
% ap=[1 1.3 1.25];
% nap=[2.3 0.9 0];
% nbp=[0 0 0];
% Gp=fotf(ap,nap,bp,nbp); %plant trans fn 1

% bp=[1 0 0];         %plant parameters
% ap=[0.8 0.5 1];
% nap=[2.2 0.9 0];
% nbp=[0 0 0];
% Gp=fotf(ap,nap,bp,nbp); %plant trans fn 3

% bp=[0 1 1];         %plant parameters
% ap=[10 185 288 1];
% nap=[3.2 2.5 0.7 0];
% nbp=[0 1 0];
% Gp=fotf(ap,nap,bp,nbp); %plant trans fn 4

bp=[5 2];         %plant parameters
ap=[1 3.1 2.89 2.5 1.2];
nap=[3.3 2.6 1.9 1.4 0];
nbp=[0.6 0 ];
Gp=fotf(ap,nap,bp,nbp); %plant trans fn 6

% ap=[1 3.2 2.4 1];         %plant parameters
% bp=[1 0 0];
% nap=[2.3 1.4 0.9 0];
% nbp=[0 0 0];
% Gp=fotf(ap,nap,bp,nbp); %plant trans fn 7         
% 



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
Gl=feedback(Gf,Gu); %closed loop with unity feedb

t=[0:0.1:100];
i=lsim(Gl,ones(size(t)),t);

e=ones(size(t))-i;%error
e=abs(e);
%plot(t,e)
y2=sum(t.*e) % y is the itae
S = stepinfo(i,t,1)


plot(t,i,'--')
hold on

Kp=9.17
Ki=3.72
Kd=7.84
lam=0.96333
mu=0.60955

% % 
% bp=[5 0 0];         %plant parameters
% ap=[1 1.3 1.25];
% nap=[2.3 0.9 0];
% nbp=[0 0 0];
% Gp=fotf(ap,nap,bp,nbp); %plant trans fn 1

% bp=[1 0 0];         %plant parameters
% ap=[0.8 0.5 1];
% nap=[2.2 0.9 0];
% nbp=[0 0 0];
% Gp=fotf(ap,nap,bp,nbp); %plant trans fn 3

% bp=[0 1 1];         %plant parameters
% ap=[10 185 288 1];
% nap=[3.2 2.5 0.7 0];
% nbp=[0 1 0];
% Gp=fotf(ap,nap,bp,nbp); %plant trans fn 4

bp=[5 2];         %plant parameters
ap=[1 3.1 2.89 2.5 1.2];
nap=[3.3 2.6 1.9 1.4 0];
nbp=[0.6 0 ];
Gp=fotf(ap,nap,bp,nbp); %plant trans fn 6

% ap=[1 3.2 2.4 1];         %plant parameters
% bp=[1 0 0];
% nap=[2.3 1.4 0.9 0];
% nbp=[0 0 0];
% Gp=fotf(ap,nap,bp,nbp); %plant trans fn 7         




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
Gl=feedback(Gf,Gu); %closed loop with unity feedb

t=[0:0.1:100];
i=lsim(Gl,ones(size(t)),t);

e=ones(size(t))-i;%error
e=abs(e);
%plot(t,e)
y3=sum(t.*e) % y is the itae
S = stepinfo(i,t,1)


plot(t,i,'-.')
hold on
legend('GA','ACO','Enhanced ACO')
plot(t,ones(size(t)),'r');

