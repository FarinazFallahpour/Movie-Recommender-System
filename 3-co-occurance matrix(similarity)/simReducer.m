function simReducer(intermKey, intermValIter, outKVStore)


totalSum = 0;

% get all sets of intermediate results
while hasnext(intermValIter)
    intermValue = getnext(intermValIter);
    totalSum = totalSum + intermValue(1);
end


% add results to the output datastore
add(outKVStore,intermKey,totalSum);

end
