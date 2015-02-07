function y=optimizing()
global S D N Cost;
edges=N^2;
C=reshape(Cost,edges,1);
Aeq(2*N,edges)=0;
for i=1:N
    Aeq(i,(i-1)*N+i)=1;
end
for i=1:N
    for j=1:N
        index=(i-1)*N+j;
        Aeq(N+i,index)=-1;
        index=(j-1)*N+i;
        Aeq(N+i,index)=1;
    end
end
b1=zeros(N,1);
b2=(S-D)';
beq=[b1;b2];
[T,fval]=LINPROG(Cost,[],[],Aeq,beq,zeros(edges,1),[]);
y=reshape(T,N,N);