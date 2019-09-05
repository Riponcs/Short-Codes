
eachFiles=ls;

disp(ls)

for i=3:(length(eachFiles)-1)
    %name = 'Clipboard-2.jpg';
    name = eachFiles(i,:);
    disp(name)
    image = imread(name);
    [x1,y1,z1] = size(image);
    [filepath,name,ext] = fileparts(name);


    redChannel = image(:, :, 1);
    blueChannel = image(:, :, 3);
    NewCh1 = image(:, :, 3);
    NewCh = image(:, :, 3);

    rc = 180;
    bc = 170;

    for h = 1:x1
        for r = 1:y1
            if (redChannel(h,r)>rc)
                NewCh1(h,r) = 0;
                if (blueChannel(h,r)<bc)
                    NewCh(h,r) = 0;
                else
                    NewCh(h,r) = 255;
                end
            else
                NewCh(h,r) = 255;
                NewCh1(h, r) = 255;
            end
        end
    end

    finalName = strcat('S\', name,'.png');

    imwrite(NewCh, finalName);

    %figure, imshow(NewCh)
end
