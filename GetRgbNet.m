%获得肤色特征BP网络
%输入：
%m1,m2,n1,n2:训练集图片的编号
%返回：
%net:训练好的网络
function net=GetRgbNet(m1,m2,n1,n2)
e1=[];
e2=[];
%人脸
for i=m1:m2
a=i;
a=num2str(a);
name=['oface (',a, ').jpg'];
I=imread(name);
I=imcrop(I,[85 85 84 84]);
I=imresize(I,[25 25]);
[A,B,C]=size(I);
for a=1:A
    for b=1:B
        for c=1:C
            e1(25*(a-1)+3*(b-1)+c,i-m1+1)=I(a,b,c);
        end
    end
end
end
%非人脸
for i=n1:n2
a=i;
a=num2str(a);
name=['oface (',a, ').jpg'];
I=imread(name);
I=imcrop(I,[1 1 84 84]);
I=imresize(I,[25 25]);
[A,B,C]=size(I);
for a=1:A
    for b=1:B
        for c=1:C
            e2(25*(a-1)+3*(b-1)+c,i-n1+1)=I(a,b,c);
        end
    end
end
end
e=e1';
e=[e;e2'];
input_train = e(1:(m2-m1+1+n2-n1+1),:)';
output_train = [linspace(1,1,m2-m1+1) linspace(-1,-1,n2-n1+1)];
net=newff(input_train,output_train,10,{'tansig','logsig'},'trainlm');
net.trainParam.show=1;      
net.trainParam.epochs=1000;    
net.trainParam.lr=0.01;          
net.trainParam.goal=0.00001;                  
net.trainParam.max_fail=100;    
net=train(net,input_train,output_train);
end