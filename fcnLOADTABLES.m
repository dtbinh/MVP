function [file, angle_list] = fcnLOADTABLES(geomTypeROTOR)

        D = dir(strcat('rotors\',geomTypeROTOR));
        Num = length(D(not([D.isdir]))); % number of files in directory

    for k=1:Num
        file{k} = D(k).name; % save file name into file vector
    end

        file=char(file); % creates character array of file name

    for k=1:Num
        filename(k,:)= strsplit(file(k,:),{'.','_'}); % find angle value at start of filename string before underscore
        filename(k,:)= strrep(filename(k,:),'n','-'); % find and replace n in a string to make -ve
        % add angle to table  
    end

        angle_list=str2double(filename(:,1));

end