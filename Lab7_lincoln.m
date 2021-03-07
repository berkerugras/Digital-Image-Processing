clear all;
close all;
clc;
%boundary
im= imread('lincoln.tif');
imshow(im,[]);

SE=strel('square',3);
bound=im-imeroded(im,SE);

figure; imshow(bound,[]);