function meanMovieRatingReducer(intermKey, intermValIter, outKVStore)

totalCount = 0;
totalSum = 0;

% get all sets of intermediate results
while hasnext(intermValIter)
    intermValue = getnext(intermValIter);
    totalCount = totalCount + intermValue(1);
    totalSum = totalSum + intermValue(2);
end

% accumulate the sum and count
mean = totalSum / totalCount;

% add results to the output datastore
add(outKVStore,intermKey,mean);

end
