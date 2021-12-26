function meanMovieRatingMapper(data, ~, intermKVStore)

% find the unique movieID in this chunk
[intermKeys,~,idx] = unique(data.MovieID, 'stable');

% group Rating by idx and apply @countsum function to each group
intermVals = accumarray(idx,data.Rating,size(intermKeys),@countsum);

addmulti(intermKVStore,intermKeys,intermVals);

end

