%otsu�����ֵ�����ݶ�3*3
function y = locbw(A)
T = graythresh(A)
if A(13) < T
    y = 0;
else
    y = 1;
end
