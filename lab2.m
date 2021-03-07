clear all;
clc;
im=imread('breast_Xray.tif');
imd = double(im);
[rows,cols]=size(im);
out=zeros(rows,cols);
for i=1:rows
    for j=1:cols
        pixel=imd(i,j);
        out(i,j)=255-pixel;
    end
end
out=uint8(out);
figure;
subplot(1,2,1); imshow(im); title('Original')
subplot(1,2,2); imshow(out); title('Negative Output')


