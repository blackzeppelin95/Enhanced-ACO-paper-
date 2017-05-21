function G=unique(G) % common unique.m
[a,n]=polyuniq(G.a,G.na);
G.a=a; G.na=n;
[a,n]=polyuniq(G.b,G.nb);
G.b=a; G.nb=n;
end
function [a,an]=polyuniq(a,an) 
[an,ii]=sort(an,'descend');
a=a(ii); 
ax=diff(an);
key=1;
  for i=1:length(ax)
     if ax(i)==0, a(key)=a(key)+a(key+1);
        a(key+1)=[]; an(key+1)=[];
     else 
                 key=key+1;
     end
  end
end