%a
I = imread("C:\Users\USER\Desktop\4.2\MATLAB\cameraman.png");

[row,col]=size(I);

%b
histogram=zeros(1,256);
for i=1:row
    for j=1:col
        histogram(I(i,j))=histogram(I(i,j))+1;
    end
end

%g
subplot(2,2,1);
imshow(I);
title('Original Image');
subplot(2,2,3);
bar(histogram);
title('Histogram of Original Image');

%c
n=row*col;
pdf=histogram/n;

%d
cdf = zeros(1,256);
cdf(1) = pdf(1);

%e
for i=2:256
    cdf(i)= pdf(i) + cdf(i-1);
end

%f
cdfl = zeros(1,256);
for i=1:256
    cdfl(i)= round(cdf(i)*255);
end

%h
equlizedimage = I;
for i = 1:row
    for j = 1:col
        equlizedimage(i,j) = cdfl(equlizedimage(i,j) + 1);
    end
end


equlizedhistogram = zeros(1,256);
for i=1:row
    for j=1:col
        equlizedhistogram(equlizedimage(i,j))= equlizedhistogram(equlizedimage(i,j))+1;
    end
end


subplot(2,2,2);
imshow(equlizedimage);
title('Equalized Image');
subplot(2,2,4);
bar(equlizedhistogram);
title('Equalized Histogram');


