orig = imread("sample.jpg");

function editedImage = blurImage(img, blurScale)
    editedImage = imgaussfilt(img, blurScale);
end

%use this for reactive slider
blurScale = 5.0;

editedImage = blurImage(orig, blurScale);

figure;
subplot(1, 2, 1);
imshow(orig);
title('Original Image');

subplot(1, 2, 2);
imshow(editedImage);
title('Edited Image');