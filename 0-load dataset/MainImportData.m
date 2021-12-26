%% Using the MovieLens Dataset - import data
clc
clear
% load data from u.data and u.item 
[Movie] = loadMovieLens('ml-data_0');
% 
disp('MovieLens dataset has been loaded into Workspace.')

csvwrite('MovieLens.csv',Movie);