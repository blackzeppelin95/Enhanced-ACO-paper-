function G=plus(G1,G2) % plus.m 
a=kron(G1.a,G2.a); 
na=[];
nb=[]; 
b=[kron(G1.a,G2.b),kron(G1.b,G2.a)];
  for i=1:length(G1.a),
     na=[na G1.na(i)+G2.na];
     nb=[nb, G1.na(i)+G2.nb];
  end
  for i=1:length(G1.b),
     nb=[nb G1.nb(i)+G2.na];
  end
  G=unique(fotf(a,na,b,nb));
