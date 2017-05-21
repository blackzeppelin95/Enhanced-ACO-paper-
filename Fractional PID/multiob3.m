function y= multiob3(Kp,Ki,Kd,lam,mu)

% 
bp=[5 0 0];         %plant parameters
ap=[1 1.3 1.25];
nap=[2.3 0.9 0];
nbp=[0 0 0];
Gp=fotf(ap,nap,bp,nbp); %plant trans fn 1

% bp=[1 0 0];         %plant parameters
% ap=[14994 6009.5 1.69];
% nap=[1.31 0.97 0];
% nbp=[0 0 0];
% Gp=fotf(ap,nap,bp,nbp); %plant trans fn 2 no

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

% ap=[1 2 31 35 49 92];         %plant parameters
% bp=[1 2 39 48 -4];
% nap=[5 4.1 3.1 2.2 0.9 0];
% nbp=[3.8 2.8 1.9 1.1 0];
% Gp=fotf(ap,nap,bp,nbp); %plant trans fn 5 no

% ap=[1 3.1 2.89 2.5 1.2];         %plant parameters
% bp=[5 2 0];
% nap=[3.3 2.6 1.9 1.4 0];
% nbp=[0.6 0 0];
% Gp=fotf(ap,nap,bp,nbp); %plant trans fn 6

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
y1=sum(t.*e); % y is the itse
S = stepinfo(i,t,1);
stepresult(1)= S.Overshoot/100;
stepresult(2)= S.RiseTime;
stepresult(3)= S.SettlingTime;

TF=isnan(stepresult);           %to neglect Nan condition
if TF(1)== 1
    stepresult(1)=0;
end
if TF(2)== 1
    stepresult(2)=0;
end
if TF(3)== 1
    stepresult(3)=0;
end

y=(1*stepresult(1)+10*stepresult(2)+1*y1+5*stepresult(3))/17;

