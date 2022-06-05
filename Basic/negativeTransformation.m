%I=imread('C:\Users\lrlem\Downloads\MATLAB\lemon1.jpg');
I = (imread('C:\Users\lrlem\Downloads\MATLAB\lemon1.jpg'));
figure;
I=rgb2gray(I);
imshow(I);
[row, col] = size(I);

K = uint8(zeros(row, col));

for i = 1:row
   for j = 1:col
         K(i,j) = 255-I(i,j); 
        end
   end
   figure; imshow(K);
   figure;
   plot(I,K,'.-k');
%pixel=impixel(I)