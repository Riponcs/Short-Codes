% Check dimension of each image in the folder
eachFiles=ls;
for i=3:length(eachFiles)
	A=imread(eachFiles(i,:));
    [height, width, dim] = size(A);
    fprintf("%s %i  %i  %i\n",eachFiles(i,:), height, width, dim);
end
