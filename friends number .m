clc;
clear all;
%generate 200 points in 200*200
rou=30;
speed=5;
n=zeros(200,200);
friend=zeros(1,200);
for i=1:200
    x(i)=200*rand(1);
    v_x(i)=speed;
    y(i)=200*rand(1);
    v_y(i)=speed;
    r(i)=rou;
   
end
figure(1);
plot(x,y,'*');
t=0;
while(1)
    t=t+1;
    for j=1:200
        delta_x(j)=v_x(j)*(rand(1)-1/2);
        x(j)=delta_x(j)+x(j);
        if(x(j)>200|x(j)<0)
            x(j)=x(j)-2*delta_x(j);
        end
        delta_y(j)=v_y(j)*(rand(1)-1/2);  
        y(j)=delta_y(j)+y(j);
        if(y(j)>200|y(j)<0)
            y(j)=y(j)-2*delta_y(j);
        end
    end

    for i=1:200
        for j=1:200
            dis=sqrt((x(i)-x(j))^2+(y(i)-y(j))^2);
            if(dis<=r(i)+r(j))
                n(i,j)=1;
            end
        end
        friend(i)=sum(n(i,:));
    end
    f(t)=max(friend);
    if(max(friend)==200)
        break;
    end
end
figure(3);
plot(1:t,f,'-*');
title('time & friends number');
xlabel('time');
ylabel('friends number');
friend;
