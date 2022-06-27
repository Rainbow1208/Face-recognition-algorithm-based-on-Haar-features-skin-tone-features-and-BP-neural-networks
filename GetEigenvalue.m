%特征值函数GetEigenvalue
%输入：
%SI：20X20积分图
%返回：
%eigenvalue:特征值矩阵
function eigenvalue=GetEigenvalue(SI)
k=1;
%矩形一
w=2;h=4;e=1;
while(2^e<20)
   for i=1:20
        for j=1:20
            if((i+w<=20)&&(j+h<=20))
            white=SI(j+h/2,i+w)+SI(j,i)-SI(j,i+w)-SI(j+h/2,i);
            black=SI(j+h,i+w)+SI(j+h/2,i)-SI(j+h/2,i+w)-SI(j+h,i);
            eigenvalue(1,k)=white-black;
            k=k+1;
            end
        end
    end
    e=e+1;w=w*2;h=h*2;
end

%矩形二
w=4;h=2;e=1;
while(2^e<20)
   for i=1:20
        for j=1:20
            if((i+w<=20)&&(j+h<=20))
            white=SI(j+h,i+w/2)+SI(j,i)-SI(j,i+w/2)-SI(j+h,i);
            black=SI(j+h,i+w)+SI(j,i+w/2)-SI(j,i+w)-SI(j+h,i+w/2);
            eigenvalue(1,k)=white-black;
            k=k+1;
            end
        end
    end
    e=e+1;w=w*2;h=h*2;
end

%矩形三
w=2;h=6;e=1;
while(3^e<20)
   for i=1:20
        for j=1:20
            if((i+w<=20)&&(j+h<=20))
            white=SI(j+h/3,i+w)+SI(j,i)-SI(j,i+w)-SI(j+h/3,i)+SI(j+h,i+w)+SI(j+2*h/3,i)-SI(j+2*h/3,i+w)-SI(j+h,i);
            black=SI(j+2*h/3,i+w)+SI(j+h/3,i)-SI(j+h/3,i+w)-SI(j+2*h/3,i);
            eigenvalue(1,k)=white-black;
            k=k+1;
            end
        end
    end
    e=e+1;w=w*2;h=h*2;
end

%矩形四
w=6;h=2;e=1;
while(3^e<20)
   for i=1:20
        for j=1:20
            if((i+w<=20)&&(j+h<=20))
            white=SI(j+h,i+w/3)+SI(j,i)-SI(j,i+w/3)-SI(j+h,i)+SI(j+h,i+w)+SI(j,i+2*w/3)-SI(j,i+w)-SI(j+h,i+2*w/3);
            black=SI(j+h,i+2*w/3)+SI(j,i+w/3)-SI(j,i+2*w/3)-SI(j+h,i+w/3);
            eigenvalue(1,k)=white-black;
            k=k+1;
            end
        end
    end
    e=e+1;w=w*2;h=h*2;
end

end