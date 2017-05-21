function y=lsim(G,u,t)
a=G.a; eta=G.na;
b=G.b;
gamma=G.nb;
nA=length(a);
h=t(2)-t(1);
D=sum(a./[h.^eta]);
W=[]; nT=length(t);
vec=[eta gamma];
D1=b(:)./h.^gamma(:); 
y1=zeros(nT,1); W=ones(nT,length(vec)); 
for j=2:nT,
W(j,:)=W(j-1,:).*(1-(vec+1)/(j-1));
end
for i=2:nT,
    A=[y1(i-1:-1:1)]'*W(2:i,1:nA); y1(i)=(u(i)-sum(A.*a./[h.^eta]))/D;
 end
  for i=2:nT,
    y(i)=(W(1:i,nA+1:end)*D1)'*[y1(i:-1:1)]; 
  end