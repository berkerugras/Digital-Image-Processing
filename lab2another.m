clear all;
clc;
im=imread('breast_Xray.tif');
imd = double(im);

out=255-imd;

out=uint8(out);
figure;
subplot(1,2,1); imshow(im); title('Original')
subplot(1,2,2); imshow(out); title('Negative Output')