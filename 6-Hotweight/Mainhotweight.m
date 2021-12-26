clc
clear
ds = datastore('Train.csv', 'ReadVariableNames',false,...
    'VariableNames',{'UserID' 'MovieID' 'Rating' });
ds.SelectedVariableNames = {'MovieID', 'Rating'};
preview(ds)

% enable debug mode for parallel processing
p = gcp;
delete(p)

meanRating = mapreduce(ds, @meanMovieRatingMapper, ...
                               @meanMovieRatingReducer);
hotweights = readall(meanRating)

 bar(hotweights.Key ,cell2mat(hotweights.Value));
