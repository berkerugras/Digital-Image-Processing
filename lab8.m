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
B1=histeq(B1);
rgbImage = cat(3, R1, G1, B1);

figure;
subplot(221);imshow(im);title('color Image');
subplot(222);imshow(R1);title('r channel');
subplot(223);imshow(G1);title('g channel');
subplot(224);imshow(B1);title('b channel');
subplot(111);imshow(rgbImage);title('new');

HSV=rgb2hsv(im);
H=HSV(:,:,1);
S=HSV(:,:,2);
V=HSV(:,:,3);
figure;
subplot(221);imshow(im);title('color Image');
subplot(222);imshow(H,[]);title('HUE channel');
subplot(223);imshow(S,[]);title('SATURATION channel');
subplot(224);imshow(V,[]);title('V channel');

YUV=rgb2ycbcr(im);
Y=YUV(:,:,1);
U=YUV(:,:,2);
VY=YUV(:,:,3);
figure;
subplot(221);imshow(im);title('color Image');
subplot(222);imshow(Y,[]);title('Y channel');
subplot(223);imshow(U,[]);title('Cb channel');
subplot(224);imshow(VY,[]);title('Cr channel');

