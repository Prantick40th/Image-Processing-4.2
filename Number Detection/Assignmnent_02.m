[mainImage_1, binaryImage_1, palm_1, fingerNoisey_1, fingerNoiseyReduced_1, labelValue_1, labelTextImage_1] = getFinger('f1.png');
[mainImage_2, binaryImage_2, palm_2, fingerNoisey_2, fingerNoiseyReduced_2, labelValue_2, labelTextImage_2] = getFinger('f2.png');
[mainImage_3, binaryImage_3, palm_3, fingerNoisey_3, fingerNoiseyReduced_3, labelValue_3, labelTextImage_3] = getFinger('f3.png');
[mainImage_4, binaryImage_4, palm_4, fingerNoisey_4, fingerNoiseyReduced_4, labelValue_4, labelTextImage_4] = getFinger('f4.png');
[mainImage_5, binaryImage_5, palm_5, fingerNoisey_5, fingerNoiseyReduced_5, labelValue_5, labelTextImage_5] = getFinger('f5.png');

subplot(5,6,1);imshow(mainImage_1);title('Main Image');
subplot(5,6,2);imshow(binaryImage_1);title('Binary Image');
subplot(5,6,3);imshow(palm_1);title('Palm');
subplot(5,6,4);imshow(fingerNoisey_1);title('Fingers(Noisy)');
subplot(5,6,5);imshow(fingerNoiseyReduced_1);title('Fingers(Noiseless)');
subplot(5,6,6);imshow(labelTextImage_1);title('Number of Fingers');

subplot(5,6,7);imshow(mainImage_2);
subplot(5,6,8);imshow(binaryImage_2);
subplot(5,6,9);imshow(palm_2);
subplot(5,6,10);imshow(fingerNoisey_2);
subplot(5,6,11);imshow(fingerNoiseyReduced_2);
subplot(5,6,12);imshow(labelTextImage_2);

subplot(5,6,13);imshow(mainImage_3);
subplot(5,6,14);imshow(binaryImage_3);
subplot(5,6,15);imshow(palm_3);
subplot(5,6,16);imshow(fingerNoisey_3);
subplot(5,6,17);imshow(fingerNoiseyReduced_3);
subplot(5,6,18);imshow(labelTextImage_3);

subplot(5,6,19);imshow(mainImage_4);
subplot(5,6,20);imshow(binaryImage_4);
subplot(5,6,21);imshow(palm_4);
subplot(5,6,22);imshow(fingerNoisey_4);
subplot(5,6,23);imshow(fingerNoiseyReduced_4);
subplot(5,6,24);imshow(labelTextImage_4);

subplot(5,6,25);imshow(mainImage_5);
subplot(5,6,26);imshow(binaryImage_5);
subplot(5,6,27);imshow(palm_5);
subplot(5,6,28);imshow(fingerNoisey_5);
subplot(5,6,29);imshow(fingerNoiseyReduced_5);
subplot(5,6,30);imshow(labelTextImage_5);


function [mainImage, binaryImage, palm, fingerNoisey, fingerNoiseyReduced, labelValue, labelTextImage] = getFinger(imagePath)
    mainImage = imread(imagePath);
    mainImage2Gray = rgb2gray(mainImage);
    binaryImage = imbinarize(mainImage2Gray);
    
    se = strel('disk', 30,8);
    binaryImage_se_erosion = imerode(binaryImage, se);
    binaryImage_se_dilation = imdilate(binaryImage_se_erosion, se);
    palm = binaryImage_se_dilation;
    
    binaryImage_diff = binaryImage - palm;
    fingerNoisey = binaryImage_diff;
    
    remove_noise = imfill(fingerNoisey,'holes');
    remove_noise = bwareaopen(remove_noise,4260);
    
    [img, label]=bwlabel(remove_noise);
  
    fingerNoiseyReduced = img;
    labelValue = label;
    
    temp = zeros(680, 742);
    temp(:, :) = 255;
    labelTextImage = insertText(temp, [300 250], num2str(labelValue), 'FontSize', 100);
end

