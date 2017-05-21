function y= multiob(Kp,Ki,Kd,lam,mu)

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
y1=sum(t.*e); % y is the itse
S = stepinfo(i,t,1);
stepresult(1)= S.Overshoot;
stepresult(2)= S.RiseTime;
stepresult(3)= S.SettlingTime;

TF=isnan(stepresult);
if TF(1)== 1
    stepresult(1)=0;
end
if TF(2)== 1
    stepresult(2)=0;
end
if TF(3)== 1
    stepresult(3)=0;
end


y=(stepresult(1)+10*stepresult(2)+1*y1+5*stepresult(3))/96;
