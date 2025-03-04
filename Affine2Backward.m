img=imread("C:\data\hi.png");
[h,w,c]=size(img);

affine1=input('1st 3x3 affine matrix ');
affine2=input('2nd 3x3 affine matrix ');
original_xy=ones(3,1,'uint8');

a11=affine2*affine1*[1;1;1];
a12=affine2*affine1*[w;1;1];
a21=affine2*affine1*[1;h;1];
a22=affine2*affine1*[w;h;1];

re_x=round(max([a11(1,1),a12(1,1),a21(1,1),a22(1,1)])-min([a11(1,1),a12(1,1),a21(1,1),a22(1,1)])+1);
re_y=round(max([a11(2,1),a12(2,1),a21(2,1),a22(2,1)])-min([a11(2,1),a12(2,1),a21(2,1),a22(2,1)])+1);
min_x=min([a11(1,1),a12(1,1),a21(1,1),a22(1,1)]);
min_y=min([a11(2,1),a12(2,1),a21(2,1),a22(2,1)]);

affine_img=zeros(re_y,re_x,c,'uint8');

for c=1:3
    for i=1:re_y
        for j=1:re_x
            original_xy=inv(affine1)*inv(affine2)*[j+min_x-1;i+min_y-1;1];
            x=round(original_xy(1,1));
            y=round(original_xy(2,1));
            if (0<x)&&(0<y)&&(x<w)&&(y<h)
                affine_img(i,j,c)=img(y,x,c);
            else
                affine_img(i,j,c)=0;
            end
        end
    end
end

imshow(affine_img)