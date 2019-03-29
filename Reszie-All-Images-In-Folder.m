clc
clear

ImgWidth = 1000;
ImgHeight = 500;

eachFiles=ls;
for i=1:length(eachFiles)
    try
        singleImage=imread(eachFiles(i,:));
        singleImage=imresize(singleImage,[ImgHeight, ImgWidth]);
        fileName=find(eachFiles(i, :)=='.');
        extention=eachFiles(i, fileName+1:end);
        extention(extention==' ')=[];
        name=eachFiles(i,:);
        name(name==' ')=[];
        imwrite(singleImage, name, extention)
    catch
        fprintf("Operation is not Successful\n")
    end
end