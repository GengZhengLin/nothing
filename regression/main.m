cases=[10740	10518	10340	10124	9780	9446	9004	8356	7897	7312	6599	6190	6073	5586	5368	4862	4759	4017	3706	3560	3252	2937	2789	2437	2317	2120	2021	1940	1655	1509	1424	1292	1216	1026	910	907	848	810	783	730	717	691	646	574	533	525	454	442	386	337	305	239	158	97];
pop=5918900;
s=cases/pop;
possible=[2681 	2550 	2437 	2338 	2178 	2092 	1987 	1654 	1522 	1334 	1158 	1038 	1017 	903 	845 	713 	702 	627 	483 	437 	403 	357 	334 	258 	228 	217 	205 	195 	160 	147 	137 	115 	97 	91 	106 	124 	73 	77 	77 	74 	86 	115 	106 	67 	60 	106 	49 	74 	47 	39 	30 	20 	17 	5];
interval=[7 	7 	7 	7 	7 	7 	7 	7 	7 	7 	5 	2 	5 	2 	5 	2 	9 	5 	2 	5 	5 	2 	4 	4 	3 	2 	2 	7 	4 	3 	4 	4 	5 	6 	2 	2 	3 	2 	2 	3 	2 	3 	3 	3 	4 	3 	2 	3 	5 	2 	6 	9 	6];
died=[3276	3,199	3,145	3,062	2,943	2,758	2,582	2,085	1,768	1,583	1,398	1,267	1,250	1,187	1,169	1,130	1,450	1,341	1,259	1,227	1,183	885	879	623	570	561	557	550	516	493	476	452	476	422	392	374	365	348	334	315	298	286	273	252	233	224	219	206	194	142	127	99	34	49];
length(cases)
length(possible)
confirm=cases-possible;
w=0.8;
N=length(cases);

dcon_dt=(confirm(1:N-1)-confirm(2:N))./interval;
dcon_dt2=(dcon_dt(1:N-2)-dcon_dt(2:N-1))./interval(1:N-2);
di1_dt=w*(cases(1:N-1)-cases(2:N))./interval;
di2_dt=dcon_dt-di1_dt;
dD_dt=(died(1:N-1)-died(2:N))./interval;
dD_dt2=(dD_dt(1:N-2)-dD_dt(2:N-1))./interval(1:N-2);
ds_dt=(s(1:N-1)-s(2:N))./interval;
ds_dt2=(ds_dt(1:N-2)-ds_dt(2:N-1))./interval(1:N-2);

dcon_dt=dcon_dt(1:N-2);
dD_dt=dD_dt(1:N-2);
di1_dt=di1_dt(1:N-2);
di2_dt=di2_dt(1:N-2);
[B,BINT,R,RINT,STATS]=regress(dD_dt2',di2_dt');
fi=B(1);
fprintf('fi=%f, r-square=%f\n',fi, STATS(1));

[B,BINT,R,RINT,STATS]=regress((dcon_dt2+ds_dt2)',-[di1_dt' di2_dt']);
mu1=B(1);
mu2=B(2)-fi;
fprintf('mu1=%f, mu2=%s, r-square=%f\n',mu1, mu2, STATS(1));

s=s(1:N-2);
[B,BINT,R,RINT,STATS]=regress((ds_dt2-(ds_dt(1:N-2).^2)./s)',[(s.*di1_dt)' (s.*di2_dt)']);
lamda1=B(1);
lamda2=B(2);
fprintf('lamda1=%f, lamda2=%s, r-square=%f\n',lamda1, lamda2, STATS(1));
