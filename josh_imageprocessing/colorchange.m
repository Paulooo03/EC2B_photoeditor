orig = imread("sample.jpg");

function editedImage = colorChange(img, redScale, greenScale, blueScale)
    %required image to be converted to im2double for 0-1 rgb range
    img = im2double(img);

    %extract rgb channels
    redChannel = img(:, :, 1);
    greenChannel = img(:, :, 2);
    blueChannel = img(:, :, 3);

    %app designer scaling code 
    redChannel = redChannel * redScale;
    greenChannel = greenChannel * greenScale;
    blueChannel = blueChannel * blueScale;

    %maintaining 0-1 rgb range
    redChannel = min(max(redChannel, 0), 1);
    greenChannel = min(max(greenChannel, 0), 1);
    blueChannel = min(max(blueChannel, 0), 1);

    editedImage = cat(3, redChannel, greenChannel, blueChannel);
end

%IMPORTANT - use this for reactive slider
redScale = 5;
greenScale = 2; 
blueScale = 1.7;

editedImage = colorChange(orig, redScale, greenScale, blueScale);

figure;
subplot(1, 2, 1);
imshow(orig);
title('Original Image');

subplot(1, 2, 2);
imshow(editedImage);
title('Edited Image');