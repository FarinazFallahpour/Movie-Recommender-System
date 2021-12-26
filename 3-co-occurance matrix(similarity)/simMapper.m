function simMapper(data, ~, intermKVStore)

% find the unique UserID in this chunk
[unqUserID,~,userIdx] = unique(data.UserID, 'stable');


% group MovieID by userIdx and apply @keyCreator function to each group
keyCell =  accumarray(userIdx,data.MovieID,size(unqUserID),@keyCreator);

% convert cell 2 mat and find unique
keymat= cell2mat(keyCell);
[intermKeysMatrix,~,keyic] = unique(keymat,'rows');

% create blank cell
intermKeyslength = length(intermKeysMatrix);
intermVals = cell([intermKeyslength 1]);

% create intermediate values
for i =1:intermKeyslength
  intermVals{i,1} = length(find(keyic==i));
end


% convert to cell
intermKeyCell = cell([intermKeyslength 1]);
for i =1:intermKeyslength
   charinter=  mat2str(intermKeysMatrix(i,:));
   intermKeyCell{i,1} =charinter;
end

% add
addmulti(intermKVStore, intermKeyCell,intermVals);

end

