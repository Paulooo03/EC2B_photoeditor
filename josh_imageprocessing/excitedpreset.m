orig = imread("sample.jpg");

function editedImage = initialY2KPreset(img)
img = im2double(img);
hsvimg = rgb2hsv(img);

    %extract channels
    H = hsvimg(:,:,1);
    S = hsvimg(:,:,2);
    V = hsvimg(:,:,3);

    %fixed changes in hsv
    S = min(S * 4.5, 1);
    V = min(V * 0.7, 1);

filteredHSV = cat(3, H, S, V);

editedImage1 = hsv2rgb(filteredHSV);

    %rgb version
    redChannel = editedImage1(:, :, 1);
    greenChannel = editedImage1(:, :, 2);
    blueChannel = editedImage1(:, :, 3);
    
    redChannel = redChannel * 2;
    greenChannel = greenChannel * 2;
    
    redChannel = min(max(redChannel, 0), 1);
    greenChannel = min(max(greenChannel, 0), 1);

editedImage = cat(3, redChannel, greenChannel, blueChannel);

end

function finaleditedImage = flexibleCont(img, lowlim, highlim)
    img = im2double(img);
    
    limits = stretchlim(img, [lowlim highlim]);
    
    finaleditedImage = imadjust(img, limits, []);
end

initialedited = initialY2KPreset(orig);
finaledited = flexibleCont(initialedited, 0.07, 0.95);

figure;
subplot(1, 2, 1);
imshow(orig);
title('Original Image');

subplot(1, 2, 2);
imshow(finaledited);
title('Y2K Game Preset');