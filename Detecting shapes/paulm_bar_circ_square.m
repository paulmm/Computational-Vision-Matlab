org_image = imread('./hw2p1.jpg'); %import image
 
%filter out background noise%
bw_image = rgb2gray(org_image);
 
for x = 1:length(bw_image(1,:)),
    for y = 1:length(bw_image(:,1)),
       if bw_image(x,y) > 100,
           binary_image(x,y) = 0;
       else
           binary_image(x,y) = 1;
       end;
    end;
end;
 
h = figure;
imshow(binary_image);
close(h);
 
org_image = [];
bw_image = [];

%segment the disk from the handle%
se = strel('disk',15);
 
erode_disk = imerode(binary_image, se);
k = figure; 
imshow(erode_disk);
close(k);
 
se = strel('disk',16);
imdil_disk = imdilate(erode_disk, se);
l = figure; 
imshow(imdil_disk);
close(l);
 
erode_disk =[];

%segment the handle from the disk%
for x = 1:length(binary_image(1,:)),
    for y = 1:length(binary_image(:,1)),
       if imdil_disk(x,y) ~= 1,
           handle(x,y) = binary_image(x,y);
       else
           handle(x,y) = 0;
       end;
    end;
end;
 
z = figure; 
imshow(handle);
close(z);
 
imshow(~imdil_disk);
figure;
imshow(~handle);