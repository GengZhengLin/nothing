function dy=diff_equation(t,y)
global lamda1 lamda2 lamda3 alpha T0 T1 u1 u2 mu1 mu2 fi kesai b F index pc V;
dy=zeros(length(y),1);

dy(index.s)=-(lamda1*y(index.i1)+lamda2*y(index.i2)+lamda3*y(index.D))*y(index.s)-pc*V*rect_func(t);
dy(index.e)=(lamda1*y(index.i1)+lamda2*y(index.i2)+lamda3*y(index.D))*y(index.s)-alpha*y(index.e);
dy(index.i1)=alpha*y(index.e)-T0*y(index.i1)-u1*y(index.i1);
dy(index.i2)=T0*y(index.i1)-fi*y(index.i2)-u2*y(index.i2);
dy(index.I1)=u1*y(index.i1)-(T1+mu1)*y(index.I1);
dy(index.I2)=T1*y(index.I1)+u2*y(index.i2)-mu2*y(index.I2)-kesai*y(index.I2);
dy(index.O)=y(index.I1)*mu1+y(index.I2)*mu2-b*y(index.O);
dy(index.D)=fi*y(index.i2)-y(index.D)*F;
end

