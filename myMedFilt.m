function out1=myMedFilt(img,Filtersize)
 
img=double(img);
 
 
padSz = (Filtersize-1)/2;
 
img_padded = padarray(img,[padSz padSz],'symmetric');
 
[rows,cols] = size(img_padded);
 
out_padded=zeros(rows,cols);
for i = padSz+1:rows-padSz
    for j = padSz+1:cols-padSz
        nghbr = img_padded(i-padSz:i+padSz,j-padSz:j+padSz);
        out_pixel = median(nghbr,'all');
        out_padded(i,j) = out_pixel;
    end
end
 
out1 = out_padded(padSz+1:rows-padSz,padSz+1:cols-padSz);
 
end

