clear all;
clc;

im = imread('fractal_iris.tif');
im = double(im);


output1 = mod(im, 2); 
output2 = mod(floor(im/2), 2); 
output3 = mod(floor(im/4), 2); 
output4 = mod(floor(im/8), 2); 
output5 = mod(floor(im/16), 2); 
output6 = mod(floor(im/32), 2); 
output7 = mod(floor(im/64), 2); 
output8 = mod(floor(im/128), 2); 


im = uint8(im);
subplot(1, 9, 1);
imshow(im);
title('Original');

subplot(1, 9, 2);
imshow(output1); 
title('Bit-Plane 1');

subplot(1, 9, 3); 
imshow(output2); 
title('Bit-Plane 2');

subplot(1, 9, 4); 
imshow(output3); 
title('Bit-Plane 3');

subplot(1, 9, 5); 
imshow(output4); 
title('Bit-Plane 4');

subplot(1, 9, 6); 
imshow(output5); 
title('Bit-Plane 5');

subplot(1, 9, 7); 
imshow(output6); 
title('Bit-Plane 6');

subplot(1, 9, 8); 
imshow(output7); 
title('Bit-Plane 7');

subplot(1, 9, 9); 
imshow(output8); 
title('Bit-Plane 8')