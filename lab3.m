clear all;
clc;




function out= myAvgFilt(in,sz)

in=double(in);

kernel = ones(sz,sz)/(sz*sz);

padSz = (sz-1)/2;

in_padded = padarray(in,[padSz padSz],'symmetric')

[rows,cols] = size(in_padded);

out_padded=zeros(row,cols);
for i = padSz+1:rows-padSz
    for j = padSz+1:cols-padSz
        nghbr = in_padded(i-padSz:i+padSz:j+padSz:j-padSz)
        out_block= nghbr .* kernel;
        out_pixel = sum(sum(out_block))
        out_padded(i,j) = round(out_pixel);
    end
end

out = out_padded(padSz+1:rows-padSz,padSz+1:cols-padSz);

end

function out1=myMedFilt(img,Filtersize)
img=double(img);


padSz = (Filtersize-1)/2;

img_padded = pdarray(img,[padSz padSz],'symmetric')

[rows,cols] = size(img_padded);

out_padded=zeros(row,cols);
for i = padSz+1:rows-padSz
    for j = padSz+1:cols-padSz
        nghbr = img_padded(i-padSz:i+padSz:j+padSz:j-padSz)
        out_pixel = median(nghbr);
        out_padded(i,j) = round(out_pixel);
    end
end

out = out_padded(padSz+1:rows-padSz,padSz+1:cols-padSz);

end







