clear all; 

close all; 

clc; 



im = imread('skeleton.tif'); 

im = double(im); 



gamma1 =0.60;

kernel = [0 1 0; 1 -4 1; 0 1 0] ; 

sobel1=[-1 -2 -1;0 0 0;1 2 1]; 

sobel2=[-1 0 1;-2 0 2;-1 0 1]; 





imP = padarray(im,[1 1],'symmetric'); 

[rows, cols] = size(imP); 



outP = zeros(rows,cols); 



for i = 2:rows-1 

    for j = 2:cols-1 

        ngh = imP(i-1:i+1,j-1:j+1); 

        out_pix = sum(sum(ngh .* kernel)); 

        outP(i,j) = out_pix; 

    end 

end 



outP=imP-outP; 

laplacianout=outP(2:rows-1,2:cols-1); 






imG = padarray(im,[1 1],'symmetric'); 

outsobp=zeros(rows,cols); 

for i=2:rows-1 

    for j=2:cols-1 

        nghbr=imG(i-1:i+1,j-1:j+1); 

        out_pix1=sum(sum(nghbr .* sobel1));

        out_pix2=sum(sum(nghbr .* sobel2));

        outsobp(i,j)=abs(out_pix1)+abs(out_pix2); 

    end 

end 



sob = outsobp(2:rows-1,2:cols-1); 

outsmoothed = conv2(single(sob), ones(5,5)/25,'same'); 

productmask=laplacianout.*outsmoothed;

sharpenedimage=productmask+laplacianout;

[rows,cols] = size(sharpenedimage); 


lastim = zeros(rows,cols); 



for i = 1:rows 

for j=1:cols 

pixel = sharpenedimage(i,j); 



pixel1=pixel^(gamma1); 

lastim(i,j) = pixel1; 



end 

end 



lastim=uint8(lastim); 



figure; 



subplot(1,1,1); imshow(uint8(sharpenedimage));
