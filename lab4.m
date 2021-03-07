clear all;
close all;
clc;


im=imread('moon.tif');
im=double(im);

kernel = [0 1 0; 1 -4 1;0 1 0];

%out=im-conv2(im,kernel,'same');

imP=padarray(im,[1 1],'symmetric');
[rows,cols] = size(imP);

outP=zeros(rows,cols);
for i=2:rows-1
    for j=2:cols-1
        nghbr=imP(i-1:i+1,j-1:j+1);
        out_pix=sum(sum(nghbr .* kernel));
        outP(i,j)=out_pix;
    end
end
outP=imP-outP;
out= outP(2:rows-1,2:cols-1);

figure;
subplot(1,2,1); imshow(uint8(im)); title('original');
subplot(1,2,2); imshow(uint8(out)); title('Laplacian Filter');

