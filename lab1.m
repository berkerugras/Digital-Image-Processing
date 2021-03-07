clc;
clear;
clear all;

im = imread('lowContrastPollen.jpg'); %uint8unsigned integer 8 bit olarak hesaplanır
im=double(im);

[rows,cols]=size(im);
h=zeros(1,256);

for i=1:rows
    for j=1:cols
        pixel=im(i,j); 
        h(pixel+1)=h(pixel+1)+1;
    end
end

pdf= h/(rows*cols);
cdf=zeros(1,256);
for k=1:256
    cdf(k)=sum(pdf(1:k));
end

trns=round(255*cdf);
out=zeros(rows,cols);

for i =1:rows
    for j=1:cols
        pixel=im(i,j);
        out(i,j)=trns(pixel+1);
    end
end

out=uint8(out);
figure;
imshow(out)
figure;
im =uint8(im);
imshow(im)

h_out=zeros(1,256);

for i=1:rows
    for j=1:cols
        pixel=out(i,j); 
        h_out(pixel+1)=h_out(pixel+1)+1;
    end
end
figure;
plot(h_out)
