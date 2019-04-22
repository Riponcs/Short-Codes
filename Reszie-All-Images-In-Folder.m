clc
clear

ImgWidth = 512;
ImgHeight = 512;

eachFiles=ls;
for i=1:length(eachFiles)
    try
        singleImage=rgb2gray(imread(eachFiles(i,:)));
        [x,y] = size(singleImage);
        singleImage=imresize(singleImage,[ImgHeight, int32(y*ImgHeight/x)]); %Resizing with maintaining aspect ratio
        [x,y] = size(singleImage);
        singleImage2 = imcrop(singleImage,[round((y-ImgWidth)/2) 0 ImgWidth ImgHeight]);
        fileName=find(eachFiles(i, :)=='.');
        extention=eachFiles(i, fileName+1:end);
        extention(extention==' ')=[];
        name=eachFiles(i,:);
        name(name==' ')=[];
        imwrite(singleImage2, name, extention)
    catch
        fprintf("Operation is not Successful\n")
    end
end

%round((int32(ImgWidth*ImgHeight/x)-ImgWidth)/2)
