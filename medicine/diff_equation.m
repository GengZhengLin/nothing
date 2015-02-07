function dy=diff_equation(t,y)
global lamda10 lamda20 mu1 mu2 fi T1 q t0;
dy=zeros(length(y),1);
lamda1=lamda10;
if t > t0
    lamda1=lamda10*exp(-q*(t-t0));
end
lamda2=lamda20;
dy(1)=-y(1)*(lamda1*y(2)+lamda2*y(3));
dy(4)=y(2)*mu1+y(3)*mu2;
dy(5)=y(3)*fi;
dy(2)=y(1)*(lamda1*y(2)+lamda2*y(3))-y(2)*mu1-y(2)*T1;
dy(3)=-fi*y(3)+T1*y(2)-mu2*y(3);
end
