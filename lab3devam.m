clear all;
clc; 
im = imread('board.tif');
im=double(im);
 
out= myMedFilt(im,3);
 
figure;
imshow(uint8(out));







