Img=imread('camra man.png'); 

NImg= imnoise(Img, 'salt & pepper', .6);
subplot(2,2,1);
imshow(Img);
subplot(2,2,2);
imshow(NImg);
[row col]= size(Img);
OImg= zeros(row,col);% zero matrix of the size of image

NImgP= zeros(row+2, col+2);% 2 row and 2 column padding
NImgP(2:row+1, 2:col+1)= NImg;

for i=2:row+1
    for j= 2:col+1
        wn= NImgP(i-1:i+1, j-1:j+1);%size of window consider (i,j) as central pixel % wn is size of window
        nfp=wn((wn~=0)&(wn~=255));%noise free pixel
        if(length(nfp)==0)%length of empty pixel is zero
            OImg(i-1,j-1)=mean(mean(wn));%column wise mean and then row wise thats why 2 mean % mean of noise pixels
        else
            OImg(i-1,j-1)=median(nfp);% median of noise free pixels
        end
    end
end
FImg= uint8(OImg);
subplot(2,2,3);
imshow(FImg);
