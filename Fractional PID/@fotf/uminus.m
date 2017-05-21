function G=uminus(G1) % uminus.m
G=fotf(G1.a,G1.na,-G1.b,G1.nb);
function [a,an]=polyuniq(a,an) [an,ii]=sort(an,’descend’); 
        a=a(ii);
        ax=diff(an); key=1;
  for i=1:length(ax)
     if ax(i)==0, a(key)=a(key)+a(key+1);
        a(key+1)=[]; an(key+1)=[];
        else, key=key+1; 
     end
  end