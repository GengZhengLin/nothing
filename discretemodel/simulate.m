function simulate()
global s i1 i2 r D mu1_new T1_new N V;
global lamda1 lamda2 lamda3 mu1 mu2 fi T1 pc m tao K Z;
for k=2:Z
    update_s(k);
    update_i1(k);
    update_i2(k);
    update_r(k);
    update_D(k);
    update_mu1_new(k);
    update_T1_new(k);
end
%disp(mu1_new)
end

function update_s(k)
global s i1 i2 V lamda1 lamda2 lamda3 fi pc m N;
k=k-1;
s(:,k+1)=s(:,k)+m-(lamda1*i1(:,k)+lamda2*i2(:,k)).*s(:,k)-m*s(:,k)-lamda3*fi*i2(:,k)-pc*V(:,k)./N;
end

function update_i1(k)
global s i1 i2 mu1_new T1_new lamda1 lamda2 lamda3 fi m;
k=k-1;
i1(:,k+1)=i1(:,k)+(lamda1*i1(:,k)+lamda2*i2(:,k)).*s(:,k)+lamda3*fi*i2(:,k)-(mu1_new(:,k)+T1_new(:,k)+m).*i1(:,k);
end

function update_i2(k)
global i1 i2 T1_new mu2 fi m;
k=k-1;
i2(:,k+1)=i2(:,k)+T1_new(:,k).*i1(:,k)-(mu2+fi+m)*i2(:,k);
end

function update_r(k)
global i1 i2 r V mu1_new mu2 pc m N;
k=k-1;
r(:,k+1)=r(:,k)+mu1_new(:,k).*i1(:,k)+mu2*i2(:,k)-m*r(:,k)+pc*V(:,k)./N;
end

function update_D(k)
global i2 D fi m;
k=k-1;
D(:,k+1)=D(:,k)+(fi-m)*i2(:,k);
end

function update_mu1_new(k)
global i1 mu1_new T M N;
global mu1 T1 nm;
k=k-1;
if k<=T
    mu1_new(:,k+1)=mu1;
else
    mu1_new(:,k+1)=mu1-M(:,k)./(N*(mu1+T1).*i1(:,k))*mu1+M(:,k)./(N.*i1(:,k))*nm;
end
end

function update_T1_new(k)
global i1 T1_new M T N;
global mu1 T1 nm yita;
k=k-1;
if k<=T
    T1_new(:,k+1)=T1;
else
    T1_new(:,k+1)=T1-M(:,k)./(N*(mu1+T1).*i1(:,k))*T1+M(:,k)./(N.*i1(:,k))*nm*yita;
end
end
