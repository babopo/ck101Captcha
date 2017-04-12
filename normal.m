%将字符图像归一化至28*28，近邻插值
function imgn = normal(I)
w_n=28;            %宽度
h_n=28;            %高度
[m,n]=size(I);
w = w_n/n;
h = h_n/m;         %倍数
imgn=zeros(28,28);

rot=[h,0,0;0,w,0;0,0,1];                                    %变换矩阵x=h*u,y=w*v

for i=1:28
    for j=1:28
        pix=[i,j,1]/rot;
        if pix(1) < 1
           pix(1) = 1;
        end
        if pix(2) < 1
           pix(2) = 1;
        end
        imgn(i,j)=I(round(pix(1)),round(pix(2)));        
    end
end
