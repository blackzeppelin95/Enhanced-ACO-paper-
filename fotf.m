function G=fotf(a,na,b,nb) %fotf.m 
if nargin==0,
     G.a=[]; G.na=[]; G.b=[];
G.nb=[]; G=class(G,'fotf'); elseif isa(a,'fotf'), G=a;
elseif nargin==1 & isa(a,'double'),
     G=fotf(1,0,a,0);
     else
    ii=find(abs(a)<eps);
    a(ii)=[];
    na(ii)=[]; 
    ii=find(abs(b)<eps);
    b(ii)=[];
    nb(ii)=[]; 
    G.a=a;
    G.na=na; 
    G.b=b; 
    G.nb=nb;
    G=class(G,'fotf');
end
