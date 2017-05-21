clc,clear,close all
i=1;

%crossover rate 0.5
 while(i<9)%generate a random population of 8
     ipop= -10 + 20* rand();%generates a random number from -10 to 10
     y = myFitness2(ipop); %calculate the fitness of randomly generated points
     fitness(i,1) = y;
     fitness(i,2)=ipop;
     i=i+1;
 end
% z

it=0;
pop=fitness(:,2);
while it <500
 temp=fitness(:,2);
 i=1;
 while(i<8)
 fitness((i),1)=myFitness2(temp(i));%calculate fitness of new population
 i=i+1;
 end
 w=sortrows(fitness,1);   %ascending order
%  w=fitness(:,2)*100; %w hold the values of x
%  w=int16(w); 
%  binpop=dec2bin(w,12); %binary values of population
 
 %while i<5
    %psel(i) = p(i)/(p(1)+p(2)+p(3)+p(3)) ;
    %i=i+1;
 %end
 
 %select 4 most fit values of x
 
    matepool=w(1:4,2);
%   matepool(2,:)=w(2,2);
%   matepool(3,:)=w(3,2);
%   matepool(4,:)=w(4,2); 
  %  determine crossover site
  %s= rand();
 % if(s<0.99)
  %cross = 12*rand(1,4);
  %cross =int16(cross);
  
  % mate
  
%   mate = 2500 * rand(1,4);  %2500 so that it is in the range of w
%   mate =int16(mate);
%   
  %mateb = dec2bin(mate,12);
 
 %cross matepool and mateb
 i=1;
 while(i<9)
     newpop(i)=fitness(i,2);
     i=i+1;
 end
 i=1;
 if mod(it,100)==0    %mutation loop
     newpop(1)=100*rand();
 else %mating loop 
     while(i<5)
         newpop(i)= matepool(i)+20*rand();
         newpop(i+4)=matepool(i)-20*rand();
         i=i+1;
     end
 end
  %i=1;
  %newpop(1,:)=matepool(1,:);
  
%     newpop(1, 1:cross(i)) = matepool(1, 1:cross(i));
%     newpop(i, 1+cross(i):12) = matepool(4,1+cross(i):12); 
%     i=i+1;
%   newpop(4, 1:cross(i)) = matepool(4, 1:cross(i));
%   newpop(4, 1+cross(i):12) = matepool(1, 1+cross(i):12);
%   newpopdec = bin2dec(newpop);
%   newpopdec=newpopdec / 100
%   fitness=newpopdec;
  %it=it+1;
  i=1;
  while(i<8)
     fitness(i,2)=newpop(i);
     i=i+1;
  end
  %cross
  %matepool    
  %mateb
  %newpop
  it=it+1;
  a(it,1) = myFitness2(fitness(1,2));
 % else 
 % z=matepool;
 % a(it,1) = z(1);
 % it=it+1;
%end
end
plot(1:500,a)
  