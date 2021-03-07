clear all; 
 
close all; 
 
clc; 
 
im = imread('circuit.tif'); 
 
im = double(im); 
imF = fft2(im);
avgkernel=ones(15,15)/(15*15);
outavg=conv2(im,avgkernel,'same');
kernelF=fft2(avgkernel,678,906);
kernFHP=1-kernelF;
outF=imF.*kernelF;
outFHP=imF.*kernFHP;
out=ifft2(outF);
out2=ifft2(outFHP);
 
freqinp=log10(1+fftshift(abs(imF)));
kernspeq = log10(1+fftshift(abs(kernelF)));
outFlp=log10(1+fftshift(abs(outF)));
 
 
tmp1hp = log10(1+fftshift(abs(imF)));
kernspcphp=log10(1+fftshift(abs(kernFHP)));
outFhp=log10(1+fftshift(abs(outFHP)));
 
figure;
subplot(2,3,1); imshow(uint8(im)); title('original');
subplot(2,3,2); imshow(uint8(outavg)); title('avgfiltered');
subplot(2,3,3); imshow(freqinp,[]); title('fft  spectrum input');
subplot(2,3,4); imshow(kernspeq,[]); title('spectrum of averaging filter');
subplot(2,3,5); imshow(outFlp,[]);  title('spectrum of low pass filtered image');
subplot(2,3,6); imshow(uint8(out)); title('low-pass filtered image');
figure;
subplot(1,4,1); imshow(tmp1hp,[]); title("fft  spectrum input");
subplot(1,4,2); imshow(kernspcphp,[]); title("spectrum of highpass filter");
subplot(1,4,3); imshow(outFhp,[]); title("spectrum of high pass filtered image");
subplot(1,4,4); imshow(uint8(out2)); title("high-pass filtered image");
 

