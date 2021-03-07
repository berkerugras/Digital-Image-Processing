clear all; 
 
close all; 
 
clc; 

im = imread('circuit-board-salt.tif'); 
im=double(im);
out=ordfilt2(im,5,true(3,3)); %We get the minimum pixel value 
figure;
subplot(1,2,1); imshow(uint8(out));title("filtered");
subplot(1,2,2); imshow(uint8(im)); title("original");