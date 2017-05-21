b=[5 0 0];
a=[1 1.3 1.25];
na=[2.3 0.9 0];
nb=[0 0 0];
G=fotf(a,na,b,nb);
display(G)
t=[0:0.1:30];
y=lsim(G,ones(size(t)),t)
plot(t,y)
e=4*ones(size(t))-y;
plot(t,e)
e=abs(e);
plot(t,e)
itae=sum(t.*e)

