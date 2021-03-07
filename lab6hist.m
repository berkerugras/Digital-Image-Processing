

 
clear all; 
 
close all; 
 
clc; 
 
im = imread('pattern_noise3.tif');
im = double(im);
figure;
subplot(1,2,1);imhist(uint8(im));title("histogram");
subplot(1,2,2); imshow(uint8(im)); title("original");

