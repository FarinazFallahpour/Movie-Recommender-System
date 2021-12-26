function [mldata] = loadMovieLens(path)

% filepath to u.data
filepath=[path '/u.data'];

% data is in tab-delimited format
data = dlmread(filepath, '\t');

% sort it by user id
sorted=sortrows(data,1);

mldata = [];
% go through all the rows
for i=1:size(sorted,1)
    user=sorted(i,1);
    movie=sorted(i,2);
    rating=sorted(i,3);
   mldata= [mldata; [user movie rating]];
    
end
% 
% % load data from 'u.item', where the first column is the movie id and the
% % second is the movie titles, delimited by '|'. 
% 
% format = '%d %s %s %s %s %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d';
% filepath=[path '/u.item'];
% fid = fopen(filepath);
% file = textscan(fid, format, 'delimiter', '|');
% fclose(fid);
% 
% % initialize the cell matrix to hold data
% mlmovies=cell(1,size(file{1,1},1));
% 
% % store the movie tiles only based on the movie id
% for i=1:size(file{1,1},1);
%     movieid=file{1,1}(i,1);
%     mlmovies{1,i}=file{1,2}{movieid,1};
end

