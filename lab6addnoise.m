
clear all; 
 
close all; 
 
clc; 
 
im = imread('pattern.tif');
out=imnoise(im,'gaussian',0,0.01);

figure;
subplot(1,4,1);imshow(uint8(im));title("original");
subplot(1,4,2); imshow(uint8(out)); title("Gaussian");
subplot(1,4,3); imhist(uint8(im)); title("Original Histogram");
subplot(1,4,4); imhist(uint8(out)); title("Gaussian Histogram");

