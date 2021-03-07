clear all;
close all;
clc;


im=imread('contact_lens.tif');
im=double(im);
sobel1=[-1 -2 -1;0 0 0;1 2 1];
sobel2=[-1 0 1;-2 0 2;-1 0 1];

imP=padarray(im,[1 1],'symmetric');
[rows,cols] = size(imP);

outP=zeros(rows,cols);
for i=2:rows-1
    for j=2:cols-1
        nghbr=imP(i-1:i+1,j-1:j+1);
        out_pix1=sum(sum(nghbr .* sobel1));  %x ekseninde
        out_pix2=sum(sum(nghbr .* sobel2));   %y ekseninde
        outP(i,j)=abs(out_pix1)+abs(out_pix2);
    end
end

out= outP(2:rows-1,2:cols-1);

figure;
subplot(1,2,1); imshow(uint8(im)); title('original');
subplot(1,2,2); imshow(uint8(out)); title('Sobel filtered');
