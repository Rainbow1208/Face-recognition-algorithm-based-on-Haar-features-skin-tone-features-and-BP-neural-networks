%作者：南京理工大学 机械工程学院 陆世豪
clc
clear all
%图片名称
name='faces_test(1).jpg';
load('rgbnet.mat');
load('facenet.mat');
I=imread(name);
[H,W,~]=size(I);
SIZE=[H W];
length=260;
s=[0,0,0,0];
while(length<=0.5*min(min(SIZE)))
    for i=1:4:H
        for j=1:4:W
            if((i+length<H)&&(j+length<W))
                WI=imcrop(I,[j i length length]);
                if isempty(WI)
                    continue;
                end
                WI=imresize(WI,[25 25]);
                [A,B,C]=size(WI);
                e=[];
                for a=1:A
                    for b=1:B
                        for c=1:C
                            e(25*(a-1)+3*(b-1)+c,1)=WI(a,b,c);
                        end
                    end
                end
                an1=sim(rgbnet,e);
                if(abs(an1-1)<0.1)
                    WI=imresize(WI,[20 20]);
                    WI=rgb2gray(WI);
                    WI=mat2gray(WI);
                    WI=GetSigma(WI);
                    eigenvalue=GetEigenvalue(WI)';
                    an=sim(net,eigenvalue);
                    if(an>0)
                        s=[s;j,i,length,an];
                    end
                end
            else
                continue;
            end
        end
    end
    length=round(length*1.5);
end
imshow(name);
hold on;
rectangle('position',[s(2,1),s(2,2),s(2,3),s(2,3)],'edgecolor','r')
x=s(2,1);
y=s(2,2);
[K,~]=size(s);
for i=2:K-1
    if((abs(x-s(i+1,1))<40))
         continue;
    else
        x=s(i+1,1);
        y=s(i+1,2);
        rectangle('position',[s(i+1,1),s(i+1,2),s(i+1,3),s(i+1,3)],'edgecolor','r')
    end
end