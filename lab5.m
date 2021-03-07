clear all; 

close all; 

clc; 


im = imread('circuit.tif'); 

im = double(im); 

imF = fft2(im);
kernel=ones(3,3)/9;
kernelF=fft2(kernel,678,906);
outF=imF.*kernelF;
out=ifft2(outF);
figure;imshow(uint8(out));
%just to visualize
tmp1 = log10(1+fftshift(abs(kernelF))); %log transform kullanmasaydık bu coefficientlar çok büyük olurdu, range'i compresslemek için aldık

figure; imshow(tmp1,[])
