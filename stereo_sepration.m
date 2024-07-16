
function [leftimg, rightimg] = stereo_sepration(stereoimg)

stereosize= size(stereoimg);
stereodim = length(stereosize);

[stereolength, maxdimpos] = max(stereosize);
[stereodepth, mindimpos] = min(stereosize);

widthpos = setdiff(1:stereodim,[maxdimpos, mindimpos]);
stereowidth = stereosize(1, widthpos);

leftimg = stereoimg(:, (stereolength/2 + 1) : stereolength, :);
rightimg = stereoimg(:, 1 : stereolength/2, :);

end