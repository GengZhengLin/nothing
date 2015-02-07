function cal_syns()
syms mu1 mu2 T1 i1 i2 N M V nm phi lamda1 lamda2 s;
mu1_new=mu1*(i1.*N-M)./(i1.*N)+(mu1+T1)*M./(i1.*N)*nm;
T1_new=T1*(i1.*N-M)./(i1.*N)+(mu1+T1)*M./(i1.*N)*(1-nm);
di1_dt=s.*(lamda1*i1+lamda2*i2).*(1-V./(s.*N))-i1.*mu1_new-i1.*T1_new;
di2_dt=(-phi)*i2+T1_new*i1-mu2*i2;

infected=di1_dt+(1+phi)*di2_dt;
simplify(N*di2_dt)
