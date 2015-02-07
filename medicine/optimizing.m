global K M_total V_total N
temp1=ones(1,K);
temp0=zeros(1,K);
M0=[M_total zeros(1,K-1)];
V0=[V_total zeros(1,K-1)];
X0=[M0 V0];
A=eye(2*K);
s=pop(1,:);
i1=pop(2,:);
B=[i1.*N s.*N]';
Aeq=[temp1 temp0;
     temp0 temp1];
Beq=[M_total;
     V_total];
options=optimset('Algorithm','interior-point');
[X,Fval]=fmincon('cases_num',X0,A,B,Aeq,Beq,zeros(1,2*K),[],[],options);
subplot(2,1,1);
bar(X(1:K));
subplot(2,1,2);
bar(X(K+1:2*K));
