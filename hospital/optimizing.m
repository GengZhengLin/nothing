global K Z Mtotal Ntotal;
X0=zeros(2*K*Z,1);
A(2*Z,2*K*Z)=0;
for i=1:2*Z
    b=(i-1)*K+1;
    e=i*K;
    A(i,b:e)=ones(1,K);
end
b=[Mtotal';Ntotal'];
fmincon('target',X0,A,b,[],[],zeros(2*K*Z,1),[]);