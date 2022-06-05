I = imread('girl.jpg');
[row,col,depth] = size(I);
if depth ~= 1 
    I = rgb2gray(I);
end
I = imnoise(I,'Gaussian',0.04,0.003);
old_img = I;
I = double(I);

[row,col,depth] = size(I);

kernel_size = 7;
start_X_Y = -2;

% for 7*7 matrix  
gausian_X = zeros(kernel_size,kernel_size);
gausian_Y = zeros(kernel_size,kernel_size);
start = start_X_Y;
for i = 1:kernel_size
    gausian_X(1:kernel_size,i:i) = start;
    start = start + 1 ;
end
start = start_X_Y;
for i = 1:kernel_size
    gausian_Y(i:i,1:kernel_size) = start;
    start = start + 1 ;
end

gausian_X
gausian_Y

prompt = 'Enter the sigma value = ';
sigma = input(prompt);

ker = gausianFilter(gausian_X,gausian_Y,sigma);

new_img = zeros(row+2,col+2);
new_img(2:row+1,2:col+1) = I(1:row,1:col);

[new_img_row,new_img_col] = size(new_img);

outputImage = zeros(row,col);

for i = 1:new_img_row - (kernel_size-1)
    for j = 1:new_img_col- (kernel_size-1)
       new_img(i:i + (kernel_size-1) ,j:j +(kernel_size-1));
       data =  new_img(i:i + (kernel_size-1) ,j:j + (kernel_size-1)).*ker ;
       data = sum( data(:) );
       outputImage(i,j) = data;
    end
end

outputImage = uint8(outputImage);

subplot(1,2,1),imshow(old_img),title("Orginal Image");
subplot(1,2,2),imshow(outputImage),title("After Gausian Filter");

function kernel = gausianFilter(gausian_X, gausian_Y, sigma)
    kernel = -(power(gausian_X,2) + power(gausian_Y,2)) / (2*power(sigma,2));
    kernel = exp(kernel);
    kernel = (1.0 / (2 * pi * power(sigma,2))) * kernel
end
