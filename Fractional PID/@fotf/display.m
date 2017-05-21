function display(G) %display.m
strN=polydisp(G.b,G.nb);
strD=polydisp(G.a,G.na); 
nn=length(strN);
nd=length(strD);
nm=max([nn,nd]); 
n1=(nm-nn)/2; 
disp([char(' '*ones(1,floor(-n1))), strN])
disp(char('-'*ones(1,nm)))
disp([char(' '*ones(1,floor(-n1))), strD])
function strP=polydisp(p,np)
P='';
[np,ii]=sort(np,'descend');
p=p(ii);
for i=1:length(p)
P=[P,'+',num2str(p(i)),...
        'sˆ{',num2str(np(i)),'}'];
end
P=P(2:end); P=strrep(P,'sˆ{0}',''); 
P=strrep(P,'+-','-');
P=strrep(P,'ˆ{1}','');
P=strrep(P,'+1s','+s');
strP=strrep(P,'-1s','-s');
if length(strP)>=2 & strP(1:2)=='1s',
     strP=strP(2:end);
  end