
function [brenner_result] = brenner(img)
  
img=double(img);         %精度存储问题
 [M, N]=size(img);     %M等于矩阵行数，N等于矩阵列数；size()获取矩阵行列
 FI=0;        %变量，暂时存储每一幅图像的Brenner值
 for x=1:M-2      %Brenner函数原理，计算相差两个位置的像素点的灰度值
     for y=1:N 
         FI=FI+(img(x+2,y)-img(x,y))*(img(x+2,y)-img(x,y)); 
     end 
 end

 brenner_result = FI/((M-2)*(N));

end