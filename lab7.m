clear all;
close all;
clc;
 
im = imread('region_filling.tif');
imshow(im,[]);
 
SE= strel('square',3);
 
[rows , cols] = size(im);
 
X = false(rows,cols);
imshow(X)
X(109,100)=true;
 
Xk=true(rows,cols);
 
while 1
    Xk = (imdilate(X,SE) & (~im));
    if sum(sum(abs(X-Xk))) == 0
        break;
    else 
        X=Xk;
    end
end
 
figure;
imshow(Xk|im,[]);
