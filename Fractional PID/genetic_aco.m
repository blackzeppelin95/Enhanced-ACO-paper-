 % x correction 
%with mutation
% keep the first 4 fittest values  and mate the rest
tic
clc,clear,close all
iter=5;
i=1;
 while(i<9)
     alpha=2*rand();
     beta=rand();
     roh=2*rand();
     y = aco(alpha,beta,roh);
     z(i,1) = y;
     z(i,2)=alpha;
     z(i,3)=beta;
     z(i,4)=roh;
     i=i+1;
 end
 it=1;
 while it<iter
     
 p=sortrows(z,1);
 popalpha = p(:,2);
 popbeta = p(:,3);
 poproh = p(:,4);
 popalphaint= int16(popalpha*100);
 popbetaint= int16(popbeta*100);
 poprohint= int16(poproh*100);
 matepoolalpha=dec2bin(popalphaint,12);
 matepoolbeta=dec2bin(popbetaint,12);
 matepoolroh=dec2bin(poprohint,12);
 mate1 = 100* rand(1,8);  
 mate1 =int16(mate1);
 mate2 = 3*rand(1,8);
 mate2 = int16(mate2);
  
 mateb1 = dec2bin(mate1,12)
 mateb2 = dec2bin(mate2,12);
 cross = ceil(12*rand(1,4));
 %cross =int16(cross);
 
 i=1; 
 newpopalpha=matepoolalpha;
 newpopbeta=matepoolbeta;
 newpoproh=matepoolroh;
  if mod(it,3)==0
     s=ceil(8*rand());
     newpopalpha(s,:)=mateb1(s,:);
     newpopbeta(s,:)=mateb1(s,:);
     newpoproh(s,:)=mateb1(s,:);
 else
  while i<5              %keep first 4 values and mate the rest
     
    newpopalpha(i+4, 1:cross(i)) = matepoolalpha(i, 1:cross(i));
    newpopalpha(i+4, 1+cross(i):12) = mateb1(1, 1+cross(i):12); 
     newpopbeta(i+4, 1:cross(i)) = matepoolbeta(i, 1:cross(i));
    newpopbeta(i+4, 1+cross(i):12) = mateb1(1, 1+cross(i):12); 
     newpoproh(i+4, 1:cross(i)) = matepoolroh(i, 1:cross(i));
    newpoproh(i+4, 1+cross(i):12) = mateb1(1, 1+cross(i):12);    
    i=i+1;
  end
  
 end
 
 
  newpopdecalpha=bin2dec(newpopalpha)/100;
  newpopdecbeta=bin2dec(newpopbeta)/100;
  newpopdecroh=bin2dec(newpoproh)/100;
  i=1;
  while i<9
      y = aco(newpopdecalpha(i),newpopdecbeta(i),newpopdecroh(i));
      z(i,1)=y;
      z(i,2)=newpopdecalpha(i);
      z(i,3)=newpopdecbeta(i);
      z(i,4)=newpopdecroh(i);
      
      i=i+1;
  end
  ysol(it)=z(1,1);
  alphasol(it)=z(1,2);
  betasol(it)=z(1,3);
  rohsol(it)=z(1,4);
  it=it+1;
  
 end
 
 alpha'
 beta'
 roh'
 ysol'
  
  alpha=alphasol(iter-1); %final values
  beta=betasol(iter-1);
  roh=rohsol(iter-1);
  S=ant_5(alpha,beta,roh);
%______________________________________________________________________
%______________________________________________________________________
% bp=[5 0 0];         %plant parameters
% ap=[1 1.3 1.25];
% nap=[2.3 0.9 0];
% nbp=[0 0 0];
% Gp=fotf(ap,nap,bp,nbp); %plant trans fn
% bc=[alpha beta roh]; %controller parameters 
% ac=[1 0 0];
% nbc=[lam 0 mu+lam];
% nac=[lam 0 0];
% Gc=fotf(ac,nac,bc,nbc); %controller trans f
% au=[1 0 0]; %unity trans fn for feedback
% bu=[1 0 0];
% nbu=[0 0 0];
% nau=[0 0 0];
% Gu=fotf(au,nau,bu,nbu);  %unity trans fn 
% Gf=mtimes(Gc,Gp);  %forward loop trns fn
% Gl=feedback(Gf,Gu); %closed loop with unity feedback 
% display(Gl) %final transfer function
% t=[0:0.1:100];
% i=lsim(Gl,ones(size(t)),t);
% subplot(2,1,1)
% plot(1:iter-1,ysol)
% title('ITAE wrt iterations');
% subplot(2,1,2)
% plot(t,i);
% grid on;
% hold on
% plot(t,ones(size(t)));
% title('Step response with optimised controler');
toc
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  