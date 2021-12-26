%% Using the MovieLens Dataset - import data
clc
clear
% load data from u.data and u.item 

[mldata, ~, ~] = loadMovieLens('ml-data_0');
% 
disp('MovieLens dataset has been loaded into Workspace.')

load('hotweightmat.mat')

for i = 1:size(hotweight,1)
   index = find(mldata(:,i) == 0);
   mldata(index,i)=hotweight(i,2);
   
end

save('mldata.mat','mldata')

csvwrite('mldata.csv',mldata);