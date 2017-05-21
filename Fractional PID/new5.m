% x correction 
%with mutation
% keep the first 4 fittest values  and mate the rest

clc,clear,close all

i=1;
 while(i<9)
     Kp= 10* rand();
     Ki= 10* rand();
     Kd= 10* rand();
     lam= rand();
     mu= rand();
     y = itse(d);
     z(i,1) = y;
     z(i,2)=d;
     
     i=i+1;
 end
 z
 it=1;
 while it<50
     
 p=sortrows(z,1);
 popx = p(:,2);
 popxint= int16(popx*100);      
 matepool=dec2bin(popxint,12);
 
 
 
  s=rand();
%  if s<0.15      %mutation
%      i=1;
%      while i<9
%      mut= round(5*rand());
%      j=round(5*rand());
%      if j==0
%          j=j+1;
%      end
%      xj=j;   %bit from which toggling starts
%      while j< xj+mut
%          matepool(i,j)= abs(matepool(i,j))-1;  
%          j=j+1;
%      end
%      i=i+1;
%      end
%      matepooldec=bin2dec(matepool)/100;
%       while i<9
%       y = myFitness2(matepooldec(i));
%       z(i,1)=y;
%       z(i,2)=matepooldec(i);      
%       i=i+1;
%       end
%       ysol(it)=z(1,1);
%       xsol(it)=z(1,2);
%       it=it+1;
%      
%      
%      
%      
%  
%  else   %mating
 
 mate = 2000 * rand(1,8);  
 mate =int16(mate);
  
 mateb = dec2bin(mate,12)
 cross = ceil(12*rand(1,4));
 %cross =int16(cross);
 
 i=1; 
 newpop=matepool;
 if mod(it,10)==0
     s=ceil(8*rand());
     newpop(s,:)=mateb(s,:);
 else
  while i<5              %keep first 4 values and mate the rest
     
    newpop(i+4, 1:cross(i)) = matepool(i, 1:cross(i));
    newpop(i+4, 1+cross(i):12) = mateb(1, 1+cross(i):12); 
   
    i=i+1;
  end
  
 end
 
 
  newpopdec=bin2dec(newpop)/100;
  i=1;
  while i<9
      y = myFitness2(newpopdec(i));
      z(i,1)=y;
      z(i,2)=newpopdec(i); 
      
      i=i+1;
  end
  ysol(it)=z(1,1);
  xsol(it)=z(1,2);
  it=it+1;
  
 end
 
  
 %end
 
 
 xsol'
 ysol'
  %plot(1:49,ysol)
  %hold on
  plot(1:49,ysol)
  
  
  
  
  
  
  
  
  
  
  
  %popxint
 %matepool
 
 
 
 
 
 
 
 
 
 %   while i<9
%     if popxc<0
%         popxc=popxc*(-1);
%         b(i,:)=dec2bin(popxc(i),12);
%         %b(i,1) = 1;
%     else
%         b(i,:)=dec2bin(popxc(i),12);
%         %b(i,1) = 0;
%     end
%     i=i+1;
%  end