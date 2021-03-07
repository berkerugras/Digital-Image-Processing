clear all;
clc;
im=imread('DFT_no_log.tif');
im = double(im);
 
 
 
 
[rows,cols]=size(im); 
out=zeros(rows,cols); 
c=255;
for i=1:rows
    for j=1:cols
        pixel=im(i,j);
        out(i,j)=c*log10(pixel+1);
        
    end
end
out=uint8(out);
im=uint8(im);
 
subplot(1,2,1); imshow(im); title('Original')
subplot(1,2,2); imshow(out); title('Output')
