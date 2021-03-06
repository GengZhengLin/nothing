function y=cases_num(X)
global lamda10 lamda20 mu1 mu2 T1 pop t0 q N nm fi K
lamda1=lamda10;
lamda2=lamda20;
s=pop(1,:);
i1=pop(2,:);
i2=pop(3,:);
M=X(1:K);
V=X(K+1:length(X));
mu1_new=mu1*(i1.*N-M)./(i1.*N)+(mu1+T1)*M./(i1.*N)*nm;
T1_new=T1*(i1.*N-M)./(i1.*N)+(mu1+T1)*M./(i1.*N)*(1-nm);
di1_dt=s.*(lamda1*i1+lamda2*i2).*(1-V./(s.*N))-i1.*mu1_new-i1.*T1_new;
di2_dt=-fi.*i2+T1_new.*i1-mu2.*i2;
infected=di1_dt+(1+fi)*di2_dt;
y=dot(N,infected);