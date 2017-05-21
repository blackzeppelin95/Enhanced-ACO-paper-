% x correction 
%with mutation
% keep the first 4 fittest values  and mate the rest
tic
clc,clear,close all
iter=100;
i=1;
 while(i<9)
     Kp= 10* rand();
     Ki= 5* rand();
     Kd= 5* rand();
     lam= rand();
     mu= rand();
     y = multiob3(Kp,Ki,Kd,lam,mu);
     z(i,1) = y;
     z(i,2)=Kp;
     z(i,3)=Ki;
     z(i,4)=Kd;
     z(i,5)=lam;
     z(i,6)=mu;
     i=i+1;
 end
 z
 it=1;
 while it<iter
     
 p=sortrows(z,1);
 popKp = p(:,2);
 popKi = p(:,3);
 popKd = p(:,4);
 poplam =p(:,5);
 popmu =p(:,6);
 popKpint= int16(popKp*100);
 popKiint= int16(popKi*100);
 popKdint= int16(popKd*100);
 poplamint= int16(poplam*100);
 popmuint= int16(popmu*100);
 matepoolKp=dec2bin(popKpint,12);
 matepoolKi=dec2bin(popKiint,12);
 matepoolKd=dec2bin(popKdint,12);
 matepoollam=dec2bin(poplamint,12);
 matepoolmu=dec2bin(popmuint,12);
 mate1 = 100* rand(1,8);  
 mate1 =int16(mate1);
 mate2 = 3*rand(1,8);
 mate2 = int16(mate2);
  
 mateb1 = dec2bin(mate1,12)
 mateb2 = dec2bin(mate2,12);
 cross = ceil(12*rand(1,4));
 %cross =int16(cross);
 
 i=1; 
 newpopKp=matepoolKp;
 newpopKi=matepoolKi;
 newpopKd=matepoolKd;
 newpoplam=matepoollam;
 newpopmu=matepoolmu;
 if mod(it,10)==0
     s=ceil(8*rand());
     newpopKp(s,:)=mateb1(s,:);
     newpopKi(s,:)=mateb1(s,:);
     newpopKd(s,:)=mateb1(s,:);
     newpoplam(s,:)=mateb2(s,:);
     newpopmu(s,:)=mateb2(s,:);
 else
  while i<5              %keep first 4 values and mate the rest
     
    newpopKp(i+4, 1:cross(i)) = matepoolKp(i, 1:cross(i));
    newpopKp(i+4, 1+cross(i):12) = mateb1(1, 1+cross(i):12); 
     newpopKi(i+4, 1:cross(i)) = matepoolKi(i, 1:cross(i));
    newpopKi(i+4, 1+cross(i):12) = mateb1(1, 1+cross(i):12); 
     newpopKd(i+4, 1:cross(i)) = matepoolKd(i, 1:cross(i));
    newpopKd(i+4, 1+cross(i):12) = mateb1(1, 1+cross(i):12); 
     newpoplam(i+4, 1:cross(i)) = matepoollam(i, 1:cross(i));
    newpoplam(i+4, 1+cross(i):12) = mateb2(1, 1+cross(i):12); 
     newpopmu(i+4, 1:cross(i)) = matepoolmu(i, 1:cross(i));
    newpopmu(i+4, 1+cross(i):12) = mateb2(1, 1+cross(i):12); 
   
    i=i+1;
  end
  
 end
 
 
  newpopdecKp=bin2dec(newpopKp)/100;
  newpopdecKi=bin2dec(newpopKi)/100;
  newpopdecKd=bin2dec(newpopKd)/100;
  newpopdeclam=bin2dec(newpoplam)/100;
  newpopdecmu=bin2dec(newpopmu)/100;
  i=1;
  while i<9
      y = itae(newpopdecKp(i),newpopdecKi(i),newpopdecKd(i),newpopdeclam(i),newpopdecmu(i));
      z(i,1)=y;
      z(i,2)=newpopdecKp(i);
      z(i,3)=newpopdecKi(i);
      z(i,4)=newpopdecKd(i);
      z(i,5)=newpopdeclam(i);
      z(i,6)=newpopdecmu(i);
      
      i=i+1;
  end
  ysol(it)=z(1,1);
  Kpsol(it)=z(1,2);
  Kisol(it)=z(1,3);
  Kdsol(it)=z(1,4);
  lamsol(it)=z(1,5);
  musol(it)=z(1,6);
  it=it+1;
  
 end
 
 Kpsol'
 Kisol'
 Kdsol'
 lamsol'
 musol'
 ysol'
  
  Kp=Kpsol(49); %final values
  Ki=Kisol(49);
  Kd=Kdsol(49);
  lam=lamsol(49);
  mu=musol(49);
%______________________________________________________________________
%______________________________________________________________________
bp=[5 0 0];         %plant parameters
ap=[1 1.3 1.25];
nap=[2.3 0.9 0];
nbp=[0 0 0];
Gp=fotf(ap,nap,bp,nbp); %plant trans fn 1

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
display(Gl) %final transfer function
t=[0:0.1:30];
i=lsim(Gl,ones(size(t)),t);
 e=ones(size(t))-i;%error
 e=abs(e);
%plot(t,e)
y1=sum(t.*e);
subplot(2,1,1)
plot(1:iter-1,ysol)
title('Cost wrt iterations');
subplot(2,1,2)
plot(t,i);
grid on;
hold on
plot(t,ones(size(t)));
title('Step response with optimised controler');
S = stepinfo(i,t,1)
y1
toc
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  