%otsu邻域二值化，暂定3*3
function y = locbw(A)
T = graythresh(A)
if A(13) < T
    y = 0;
else
    y = 1;
end
