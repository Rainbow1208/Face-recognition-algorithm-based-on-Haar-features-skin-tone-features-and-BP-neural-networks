%批量化获得特征值函数BatchGetEigenvalue
%输入：
%m1:人脸读图第一序号 m2:人脸读图最后序号 n1:非人脸读图第一序号 n2:非人脸读图最后序号
%返回：
%batcheigenvalue:全部图像特征值
function batcheigenvalue=BatchGetEigenvalue(m1,m2,n1,n2)
batcheigenvalue=zeros(1,1816);
%人脸图像
for i=m1:m2
    I=imread(['faces(',num2str(i),').bmp']);
    I=mat2gray(I);
    SI=GetSigma(I);
    e=GetEigenvalue(SI);
    batcheigenvalue=[batcheigenvalue;e];
end
%非人脸图像
for i=n1:n2
    I=imread(['nonfaces(',num2str(i),').bmp']);
    I=mat2gray(I);
    SI=GetSigma(I);
    e=GetEigenvalue(SI);
    batcheigenvalue=[batcheigenvalue;e];
end
end