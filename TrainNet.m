%���Haar����BP����
%���룺
%m1,m2,n1,n2:ѵ����ͼƬ�ı�� e:ѵ����Haar����ֵ
%���أ�
%net:ѵ���õ�����
function net=TrainNet(e,m1,m2,n1,n2)
input_train = e';
output_train = [linspace(1,1,m2-m1+1) linspace(-1,-1,n2-n1+1)];
net=newff(input_train,output_train,10,{'tansig','purelin'},'trainlm');
net.trainParam.show=1;      
net.trainParam.epochs=1000;
net.trainParam.lr=0.01;
net.trainParam.goal=0.0001;                  
net.trainParam.max_fail=50;    
net=train(net,input_train,output_train);
end