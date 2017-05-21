close all;
clc;
ipop=round(rand(8,5))
y=zeros(1,8);
for i=1:8
    for j = 1:5
        y(i)=y(i)+ipop(i,j)*2^(j-1);
    end
end
for i=1:8
    val(i)= fitness(y(i));
end 
b=sort(val);
z=sort(ipop,2);
parents=z(4:8,1:5);



