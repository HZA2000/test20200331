clear;
clc;
pic =imread('D:\Users\MZ\Desktop\lena.jpg');
figure('name','raw');
imshow(pic)

pic = double(pic);

[U,S,V] = svd(pic);

pic_new = U(:,:)*S(:,1:180)*V(:,1:180)';

[r,c] = size(pic);%r代表图像的长，c代表图像的宽

figure('name','Low_rank');
imshow(mat2gray(pic_new));%imshow()显示图像时对double型是认为在0-1范围内，即大于1时都是显示为白色。
%而显示uint8型时是0~255范围。故使用mat2gray函数将图像进行归一化，将矩阵中每个元素的值归一化至0~1之间。

I = mat2gray(pic);
J = mat2gray(pic_new);

figure;
subplot(1,2,1);
imhist(I);
subplot(1,2,2);
imhist(J); %绘制灰度直方图
[c1,n1] = imhist(I);%c1是原图不同灰度值的个数,n1是横坐标(即不同的灰度值，共256级)

[c2,n2] = imhist(J);%c2是原图不同灰度值的个数,n2是横坐标(即不同的灰度值，共256级)
c1 = c1/size(I,1)/size(I,2); 
c2 = c2/size(J,1)/size(J,2); %将灰度值个数先进行归一化
distance = pdist2(c1',c2') %使用pdist2函数计算每一组相同灰度值个数的差距作为观测值的距离，即计算两行的欧式距离并将其作为图像相似度评估准则，


