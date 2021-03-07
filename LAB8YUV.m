clear all;
close all;
clc;
 
im=imread('lenna_RGB.tif');
imshow(im);
 
[rows,cols,chans]=size(im);
R=uint8(zeros(rows,cols,chans));
G=uint8(zeros(rows,cols,chans));
B=uint8(zeros(rows,cols,chans));
 
R1=im(:,:,1);
G1=im(:,:,2);
B1=im(:,:,3);
R1=histeq(R1);
G1=histeq(G1);
R1=histeq(R1);

rgbImage = cat(3, R1, G1, B1);
 
figure;
subplot(121);imshow(im);title('color Image');
subplot(122);imshow(rgbImage);title('new');



