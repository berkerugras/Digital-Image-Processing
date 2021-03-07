function out= myAvgFilt(in,sz)
 
in=double(in)
 
kernel = ones(sz,sz)/(sz*sz);
 
padSz = (sz-1)/2;
 
 
in_padded = padarray(in,[padSz padSz],'symmetric');
 
[rows,cols] = size(in_padded);
 
out_padded=zeros(rows,cols);
out_filtered=zeros(rows,cols); 
for i = padSz+1:rows-padSz
    for j = padSz+1:cols-padSz
        nghbr = in_padded(i-padSz:i+padSz,j-padSz:j+padSz);
        out_block= nghbr .* kernel;
        out_pixel = sum(sum(out_block));
        out_filtered(i,j)=round(out_pixel);
        if out_pixel > 60
            out_padded(i,j) = 255;
        else
            out_padded(i,j) = 0;
        end
    end
 
end
figure; 
out = out_padded(padSz+1:rows-padSz,padSz+1:cols-padSz);
subplot(1,3,1); imshow(uint8(in)); title('original');
subplot(1,3,2); imshow(uint8(out_filtered)); title('filtered');
subplot(1,3,3); imshow(uint8(out)); title('binary');
end
 

