
function [tenengrad_result] = tenengrad(img)

[M, N]=size(img);
%利用sobel算子gx,gy与图像做卷积，提取图像水平方向和垂直方向的梯度值

img=double(img);

FI = 0;   %变量，暂时存储图像清晰度值
T  = 0;   %设置的阈值
for x=2:M-1
    for y=2:N-1
        GX = img(x-1,y+1)+2*img(x,y+1)+img(x+1,y+1)-img(x-1,y-1)-2*img(x,y-1)-img(x+1,y-1); %图像水平方向梯度值
        GY = img(x+1,y-1)+2*img(x+1,y)+img(x+1,y+1)-img(x-1,y-1)-2*img(x-1,y)-img(x-1,y+1); %图像垂直方向梯度值
        SXY= sqrt(GX^2+GY^2); %某一点的梯度值
        %某一像素点梯度值大于设定的阈值，将该像素点考虑，消除噪声影响
        if SXY>T
            FI = FI + SXY*SXY;    %Tenengrad值定义
        end
    end
end

tenengrad_result = FI/((M-2)*(N-2));

end