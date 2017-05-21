close,clear all;
var_no=1;%no of variables is one
maxit=100;%maximum number of iterations
popsize=16;%population size =16
mutrate=0.15; %mutation rate
selection=0.5;
nbits=8; %number of bits
nt=nbits*var_no;%number of bits in a chromosome
keep=selection*popsize;
%____________________________________________
%    Create initial population 
iga=0; %generation counter initialized 
pop=round(rand(popsize,nt)); %random strings of bits generated 
par=gadecode(pop,0,10,nbits);