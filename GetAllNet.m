%作者：南京理工大学 机械工程学院 陆世豪
clc
clear all
m=2000;
n=2000;
e=BatchGetEigenvalue(1,m,1,n);
e(1,:)=[];
net=TrainNet(e,1,m,1,n);
rgbnet=GetRgbNet(1,8000,1,8000);