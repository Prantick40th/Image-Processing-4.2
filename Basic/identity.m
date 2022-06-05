I = imread('C:\Users\lrlem\Downloads\MATLAB\lemon1.jpg');
figure; imshow(I);
I=rgb2gray(I);
[row, col] = size(I);
K = uint8(zeros(row, col));
for i = 1:row
   for j = 1:col
          K(i,j) =I(i,j);
        end
end
   
figure; imshow(K);
figure;
plot(I,K,'+');

