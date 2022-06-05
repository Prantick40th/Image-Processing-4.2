I = (imread('C:\Users\lrlem\Downloads\MATLAB\lemon1.jpg'));
figure;
I=rgb2gray(I);
imshow(I);
%I=im2double(I);
[row, col] = size(I);
K = uint8(zeros(row, col));
for i = 1:row
   for j = 1:col
          if I(i,j)>150
              K(i,j)=255;
          else
              K(i,j)=0;
          end
    end
 end
   figure; imshow(K);
   figure;
   plot(I,K,'.r');