I = (imread('C:\Users\lrlem\Downloads\MATLAB\lemon1.jpg'));
figure;
I=rgb2gray(I);
imshow(I);
I=im2double(I);
[row, col] = size(I);
K = zeros(row, col);
a=5;
for i = 1:row
   for j = 1:col
          K(i,j) = a*log(1+I(i,j));
        end
   end
   figure; imshow(K);
   figure;
   plot(I,K,'.r');