clear all;
close all;
clc;

im=imread('lenna_RGB.tif');
imshow(im);

HSV=rgb2hsv(im);
H=HSV(:,:,1);
S=HSV(:,:,2);
V=HSV(:,:,3);
V=histeq(V);
output = cat(3, H, S, V);
output=hsv2rgb(output);
figure;
subplot(121);imshow(im);title('color Image');
subplot(122);imshow(output);title('output');

