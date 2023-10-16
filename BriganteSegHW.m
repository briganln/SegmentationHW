clear all, close all
imread('blood1.tif');
I=im2double(ans);
figure, imshow(I) %figure 1
I_mask=im2bw(I);
figure, imshow(I_mask);

vert_edge=[-1 0 1; -2 0 2; -1 0 1]; %edge filter vertical
horz_edge=[1 2 1; 0 0 0; -1 -2 -1]; %edge filter horizontal

I_vertfilt=imfilter(I,vert_edge);
figure, imshow(I_vertfilt);

I_horzfilt=imfilter(I,horz_edge);
figure, imshow(I_horzfilt);

mask_vert=im2bw(I_vertfilt, .65);
figure, imshow(mask_vert) %figure 4

figure
subplot(2,2,1), imshow(I), title('Original')
subplot(2,2,2), imshow(I_vertfilt), title('Vertical Edge Enhancement')
subplot(2,2,3), imshow(I_horzfilt), title('Horizontal Edge Enhancement')
subplot(2,2,4), imshow(mask_vert), title('Edge Mask')


%% 
clear all, close all
imread('bonemarr.tif');
I=ans;
figure, imshow(I), title('Original')
t=graythresh(I);
BW=imbinarize(I,t);
figure, imshow(BW), title('Graythresh')
t=.66;
bone_mask=imbinarize(I,t);
figure, imshow(bone_mask), title('Manual Threshold')

figure
subplot(1,3,1), imshow(I), title('Original')
subplot(1,3,2), imshow(BW), title('Graythresh')
subplot(1,3,3), imshow(bone_mask), title('Manual Threshold')

%% 
clear all, close all
imread('texture4.tif');
I=im2double(ans);
h=fspecial('sobel')
sobel_filt=imfilter(I,h);
figure, imshow(sobel_filt)

nfilt=nlfilter(sobel_filt,[2 10],'std2');
nfilt_out=nfilt*3.5;
figure, imshow(nfilt_out)
g_flt = fspecial('gaussian', 20, 4);
BW2=imfilter(nfilt_out,g_flt);
figure, imshow(BW2)
impixelinfo

figure, histogram(BW2)
mask_low=BW2<.15;

figure, imshow(mask_low)
mask_high=BW2>.5;
figure, imshow(mask_high)
mask_mid=mask_low+mask_high;
figure, imshow(mask_mid)
mask3=BW2-mask_mid;
figure,imshow(mask3)
mask_mid1=imbinarize(mask3);
figure, imshow(mask_mid1)


figure
subplot(1,3,1), imshow(mask_low), title('Mask Low Intensities');
subplot(1,3,2), imshow(mask_mid1), title('Mask Mid Intensities');
subplot(1,3,3), imshow(mask_high), title('Mask High Intensities');


