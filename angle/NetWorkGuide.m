%对原始数据进行规范化处理
[pn,meanp,stdp,tn,meant,stdt]=prestd(Tin',Tout);
%[pn,meanp,stdp,tn,meant,stdt]=prestd(inputs',output);
 
%乱序
N=length(pn);
b=randperm(N);
B=zeros(2,677);
B(1,:)=pn(1,b);
B(2,:)=pn(2,b);
% B(3,:)=pn(3,b);
% B(4,:)=pn(4,b);
 
C=tn(1,b);
 
pn=B;
tn=C;
 
%建立相应的BP网络
%net = newff(minmax(pn),[3,20,1],{'logsig' 'logsig' 'tansig' },'traingdx');
net = newff(minmax(pn),[20,1],{'logsig' 'purelin' },'traingdx');
 
net.trainParam.show=50;
net.trainParam.epochs = 2000;
net.trainParam.goal = 0.005;
%net.trainParam.lr=0.05;
%net.trainfcn='traingdm';
 
%[net,tr] = train(net,trainSamples.P,trainSamples.T,[],[],validateSamples,testSamples);
 
 
%训练网络
net = train(net,pn,tn);
%对训练后的网络进行仿真
% an=sim(net,pn);
% a=poststd(an,meant,stdt);
% [normTrainOutput,Pf,Af,E,trainPerf] = sim(net,trainSamples.P,[],[],trainSamples.T);%正常输入的9组p数据，BP得到的结果t
% [normValidateOutput,Pf,Af,E,validatePerf] = sim(net,validateSamples.P,[],[],validateSamples.T);%用作变量3的数据p，BP得到的结果t
% [normTestOutput,Pf,Af,E,testPerf] = sim(net,testSamples.P,[],[],testSamples.T);%用作测试的3组数据p，BP得到的结果t
 
 
disp('请运行plot1.m ...')
