function G=feedback(F,H) % feedback.m 
H=fotf(H);
b=kron(F.b,H.a); 
na=[]; nb=[];
a=[kron(F.b,H.b), kron(F.a,H.a)];
for i=1:length(F.b),
     nb=[nb F.nb(i)+H.nb];
     na=[na,F.nb(i)+H.nb];
  end
  for i=1:length(F.a),
     na=[na F.na(i)+H.na];
  end
  G=unique(fotf(a,na,b,nb));
  
