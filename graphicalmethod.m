clc
clear 
A = [1 2 ; 1 1 ; 1 -2]
b = [10 ; 6 ; 1 ]
y = 0:1:max(b)

x12=(b(1)-A(1,1)*y)/A(1,2)
x22=(b(2)-A(2,2)*y)/A(2,2)
x32=(b(3)-A(3,1)*y)/A(3,2)

x12=max(0,x12)
x22=max(0,x22)
x32=max(0,x32)

plot(y,x12,'r',y,x22,'b',y,x32,'g')         
title('GRAPHICAL METHOD')
xlabel('Value of x1')
ylabel('Value of x2')

c1=find(y==0)
c2=find(x12==0)
line1=[y(:,[c2,c1]);x12(:,[c2,c1])]'

c3=find(x22==0)
line2=[y(:,[c3,c1]);x22(:,[c3,c1])]'

c4=find(x32==0)
line3=[y(:,[c4,c1]);x32(:,[c4,c1])]'

cornerpts=unique([line1 ; line2 ; line3],'rows')

pt=[];
for i=1:size(A,1)
    for j=i+1:size(A,1)
        P=[A(i,:);A(j,:)]
        Q=[b(i);b(j)]
        X=inv(P)*Q;
        pt=[pt X]
    end
end
allpts = unique([pt' ; cornerpts],'rows');
allpts
lastpt=constraint(allpts)
o=unique(lastpt,'rows');

values=[];
for i=1:size(o,1)
    values(i)=2*(o(i,1))+(o(i,2));
end
values=values

val=max(values);
max_loc=find(values==val);


fprintf('the max value is %f and occurs at x1=%f and x2=%f',val,lastpt(max_loc,1),lastpt(max_loc,2))

