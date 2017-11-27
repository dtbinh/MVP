function [tabLOOKUP, vecANGLELST] = fcnLOADTABLES(geomTypeROTOR)
% This function reads/creats the lookup table from the provided database
%
% INPUTS
%   geomTypeROTOR - the folder name of the database
%
% OUTPUTS
%   tabLOOKUP - One large table with the full rotor database
%   vecANGLELST - List of angles of attack

% Read from directory (within folder 'rotor')
D = dir(strcat('rotors\',geomTypeROTOR));
D = D(not([D.isdir]));
Num = size(D,1); % number of files in directory

for k=1:Num
    file{k} = D(k).name; % save file name into file vector      
end
    file=char(file); % creates character array of file name

for k=1:Num
    filename(k,:)= strsplit(file(k,:),{'.','_'}); % Find angle value at start of filename string before underscore
    filename(k,:)= strrep(filename(k,:),'n','-'); % Find and replace n in a string to make -ve
    
    % Add angle to table and combine all database tables
    temp1 = load(strcat('rotors/',geomTypeROTOR,'/',D(k).name));
    tempCELL(k) = struct2cell(temp1(1));
    alpha = str2double(filename(k,1))*ones(size(tempCELL{k},1),1); 
    alpha = table(alpha,'VariableNames',{'alpha'});
    d = tempCELL{k};
    temp2 = [d,alpha]; % Add alpha to appropiate table
    tempTABLE{k} = temp2;
end
% Combine all tables into one variable
tabLOOKUP= vertcat(tempTABLE{1:Num});
% Turn angle list from a structure
vecANGLELST = str2double(filename(:,1));



end