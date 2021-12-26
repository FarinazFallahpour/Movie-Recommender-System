% clear screen and workspace
clc
clear

% load dataset
Movie= load('Train.csv');

% find unique users
[unqUser,~,useridx] = unique(Movie(:,1), 'stable');

% % group Movie(:,2) by userIdx and apply @saveValue function to each group
userItemCell = accumarray(useridx,Movie(:,2),size(unqUser),@saveValue);

% % group Movie(:,3) by userIdx and apply @saveValue function to each group
userItemRate = accumarray(useridx,Movie(:,3),size(unqUser),@saveValue);

% concat matrices
userItemCell = [userItemCell , userItemRate];

% add userids to cell
for i=1:length(unqUser)
    userItemCell{i,3}=unqUser(i);
end

% save as .mat file
save('userItemCell.mat','userItemCell');



