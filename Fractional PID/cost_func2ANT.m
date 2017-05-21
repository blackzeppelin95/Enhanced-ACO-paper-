function cost_value=cost_func2ANT(x,plotfig)
 
assignin('base', 'Kp2',x(1))
assignin('base', 'Ki2',x(2))
assignin('base', 'Kd2',x(3))
assignin('base', 'L2',x(4))
assignin('base', 'M2',x(5))
x
sim('ANT_dcmotor_part2.mdl')
err=reference-output;
[n,~]=size(err);
cost_value=0;
for i=1:n
%  cost_value=cost_value+(err(i))^2 ;  % ISE
%   cost_value=cost_value+abs(err(i));  % IAE
  cost_value=cost_value+t(i)*abs(err(i));  % ITAE
%   cost_value=cost_value+t(i)*(err(i))^2;  % MSE
end
%   cost_value=cost_value/t(n);  % MSE
 
if plotfig
    figure(3)
    plot(t,reference,t,output)
    end
end
