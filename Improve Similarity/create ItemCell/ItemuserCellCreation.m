Movie=load('Movie.csv');
% find unique items
[unqItem,~,itemidx] = unique(Movie(:,2), 'stable');

% % group Movie(:,1) by itemidx and apply @saveValue function to each group
ItemuserCell = accumarray(itemidx,Movie(:,1),size(unqItem),@saveValue);

% % group Movie(:,3) by itemidx and apply @saveValue function to each group
userItemRate = accumarray(itemidx,Movie(:,3),size(unqItem),@saveValue);

% concat matrices
ItemuserCell = [ItemuserCell , userItemRate];

% add userids to cell
for i=1:length(unqItem)
    ItemuserCell{i,3}=unqItem(i);
end

% save as .mat file
save('ItemuserCell.mat','ItemuserCell');