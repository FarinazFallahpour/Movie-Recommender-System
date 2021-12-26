function multiplicationReducer(intermKey, intermValIter, outKVStore)

sum = 0;

% get all sets of intermediate results
while hasnext(intermValIter)
    intermValue = getnext(intermValIter);
    sum = sum + intermValue;
end

% add results to the output datastore
add(outKVStore,intermKey,sum);

end
