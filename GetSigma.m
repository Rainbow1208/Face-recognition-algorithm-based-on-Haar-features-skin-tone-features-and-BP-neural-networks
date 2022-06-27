%积分函数GetSigma
%输入：
%I：归一化灰度图像
%返回：
%SI:积分图像
function SI=GetSigma(I)
[X,Y]=size(I);
SI=zeros(X,Y);
for i=1:X
    for j=1:Y
        for x=1:i
            for y=1:j
                SI(i,j)=SI(i,j)+I(x,y);
            end
        end
    end
end
end