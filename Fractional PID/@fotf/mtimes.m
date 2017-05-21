function G=mtimes(G1,G2) % mtimes.m 
G2=fotf(G2); 
a=kron(G1.a,G2.a);
b=kron(G1.b,G2.b); 
na=[];
nb=[];
for i=1:length(G1.na),
     na=[na,G1.na(i)+G2.na];
  end
  for i=1:length(G1.nb),
     nb=[nb,G1.nb(i)+G2.nb];
  end
 G=unique(fotf(a,na,b,nb));