%Priyanka Makin and Zachary Passarelli, 10/27/2016
%APPM2360 - DiffEQ, Project 2
%Image manipulation script. Manipulations include cropping, shifting,
%color, and resolution reduction.
%--------------------------------------------------------------------------

%1
p1_gray = reader('photo1.jpg');
%imagesc(p1_gray); 
colormap('gray');
imwrite(uint8(p1_gray), 'p1_gray.jpg');

p2_gray = reader('photo2.jpg');
%imagesc(p2_gray); 
colormap('gray');
imwrite(uint8(p2_gray), 'p2_gray.jpg');


%2
vi = eye(size(p2_gray,1));
vi_shift = circshift(vi, 240);
p2_shift = vi_shift * p2_gray;
%imagesc(p2_shift);
imwrite(uint8(p2_shift), 'p2_shift.jpg');


%3
hi = eye(size(p2_gray,2));
hi_shift = circshift(hi, 240);

vi2 = eye(size(p2_gray,1));
vi2_shift = circshift(vi2, 100);

p2_shift2 = p2_gray * hi_shift;
p2_shift2 = vi2_shift * p2_shift2;
%imagesc(p2_shift2)
imwrite(uint8(p2_shift2), 'p2_shift2.jpg');
spy(hi_shift);
spy(vi2_shift);


%4
fi = eye(size(p2_gray,1));
fi_flip = flip(fi);

p2_flip = fi_flip * p2_gray;
%imagesc(p2_flip);
imwrite(uint8(p2_flip), 'p2_flip.jpg');
spy(fi_flip);


%5
ci = eye(512,619);
p1_crop1 = ci * p1_gray;
ci2 = eye(800,512);
p1_crop2 = p1_crop1 * ci2;
%imagesc(p1_crop2);
imwrite(uint8(p1_crop2), 'p1_crop2.jpg');
spy(ci);
spy(ci2);


%7
p1_dct = mydct(512);
p1_crop_dct = p1_dct * p1_crop2 * transpose(p1_dct);
%imagesc(p1_crop_dct)
imwrite(uint8(p1_crop_dct), 'p1_crop_dct.jpg');

%8 - doesn't work
p1_restore = transpose(p1_dct) * p1_crop_dct * p1_dct;
%imagesc(p1_restore);
imwrite(uint8(p1_restore), 'p1_restore.jpg');


%% Image compression
p = 0.9; %define compression value
dct_i = mydct(size(p1_crop2,1));
% p = 0 means no data is saved, max compression
% p = 1 means all data is saved, no compression
%calls compress.m, input DCT-photo matrix and compression value
p1_dct_comp = compress(p1_dct, p);
%inverse dct operation to restore image
p1_compress = transpose(dct_i) * p1_dct_comp * dct_i;
imagesc(p1_compress); colormap('gray'); %display compressed photo
%imwrite(uint8(p1_compress),'compressed.jpg')
