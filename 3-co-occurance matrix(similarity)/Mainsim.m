clc
clear
ds = datastore('Train.csv', 'ReadVariableNames',false,...
    'VariableNames',{'UserID' 'MovieID' 'Rating' });
ds.SelectedVariableNames = {'UserID', 'MovieID'};
preview(ds)

% enable debug mode for parallel processing
p = gcp;
delete(p)

similarity = mapreduce(ds, @simMapper, ...
                               @simReducer);
sim = readall(similarity)

