function y=step(G,t)
u=ones(size(t));
y=lsim(G,u,t);
if nargout==0,
    plot(t,y);
end