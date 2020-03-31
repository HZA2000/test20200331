clear;
clc;
pic =imread('D:\Users\MZ\Desktop\lena.jpg');
figure('name','raw');
imshow(pic)

pic = double(pic);

[U,S,V] = svd(pic);

pic_new = U(:,:)*S(:,1:180)*V(:,1:180)';

[r,c] = size(pic);%r����ͼ��ĳ���c����ͼ��Ŀ�

figure('name','Low_rank');
imshow(mat2gray(pic_new));%imshow()��ʾͼ��ʱ��double������Ϊ��0-1��Χ�ڣ�������1ʱ������ʾΪ��ɫ��
%����ʾuint8��ʱ��0~255��Χ����ʹ��mat2gray������ͼ����й�һ������������ÿ��Ԫ�ص�ֵ��һ����0~1֮�䡣

I = mat2gray(pic);
J = mat2gray(pic_new);

figure;
subplot(1,2,1);
imhist(I);
subplot(1,2,2);
imhist(J); %���ƻҶ�ֱ��ͼ
[c1,n1] = imhist(I);%c1��ԭͼ��ͬ�Ҷ�ֵ�ĸ���,n1�Ǻ�����(����ͬ�ĻҶ�ֵ����256��)

[c2,n2] = imhist(J);%c2��ԭͼ��ͬ�Ҷ�ֵ�ĸ���,n2�Ǻ�����(����ͬ�ĻҶ�ֵ����256��)
c1 = c1/size(I,1)/size(I,2); 
c2 = c2/size(J,1)/size(J,2); %���Ҷ�ֵ�����Ƚ��й�һ��
distance = pdist2(c1',c2') %ʹ��pdist2��������ÿһ����ͬ�Ҷ�ֵ�����Ĳ����Ϊ�۲�ֵ�ľ��룬���������е�ŷʽ���벢������Ϊͼ�����ƶ�����׼��


