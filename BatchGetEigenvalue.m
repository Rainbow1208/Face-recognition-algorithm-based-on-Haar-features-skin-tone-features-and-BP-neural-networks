%�������������ֵ����BatchGetEigenvalue
%���룺
%m1:������ͼ��һ��� m2:������ͼ������ n1:��������ͼ��һ��� n2:��������ͼ������
%���أ�
%batcheigenvalue:ȫ��ͼ������ֵ
function batcheigenvalue=BatchGetEigenvalue(m1,m2,n1,n2)
batcheigenvalue=zeros(1,1816);
%����ͼ��
for i=m1:m2
    I=imread(['faces(',num2str(i),').bmp']);
    I=mat2gray(I);
    SI=GetSigma(I);
    e=GetEigenvalue(SI);
    batcheigenvalue=[batcheigenvalue;e];
end
%������ͼ��
for i=n1:n2
    I=imread(['nonfaces(',num2str(i),').bmp']);
    I=mat2gray(I);
    SI=GetSigma(I);
    e=GetEigenvalue(SI);
    batcheigenvalue=[batcheigenvalue;e];
end
end