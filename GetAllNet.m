%���ߣ��Ͼ�����ѧ ��е����ѧԺ ½����
clc
clear all
m=2000;
n=2000;
e=BatchGetEigenvalue(1,m,1,n);
e(1,:)=[];
net=TrainNet(e,1,m,1,n);
rgbnet=GetRgbNet(1,8000,1,8000);