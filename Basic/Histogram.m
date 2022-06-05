I = imread('C:\Users\lrlem\Downloads\MATLAB\lemon1.jpg');
imshow(I);
[row, col]= size(I);
K = uint8(ones(row, col));


X= zeros(1,256);

for i = 1:row
    for j=1:col
        X(I(i,j))=X(I(i,j))+1;  
    end
end

bar(X)

