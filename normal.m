%���ַ�ͼ���һ����28*28�����ڲ�ֵ
function imgn = normal(I)
w_n=28;            %���
h_n=28;            %�߶�
[m,n]=size(I);
w = w_n/n;
h = h_n/m;         %����
imgn=zeros(28,28);

rot=[h,0,0;0,w,0;0,0,1];                                    %�任����x=h*u,y=w*v

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
