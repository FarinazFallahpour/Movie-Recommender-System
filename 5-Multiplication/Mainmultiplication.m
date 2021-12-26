clc
clear

% Load SimilarityMatrix
sim = datastore('Similarity.csv', 'ReadVariableNames',false,...
     'VariableNames',{'MovieID1' 'MovieID2' 'Freq' });
preview(sim)


% Call Mapreduce

% enable debug mode for parallel processing
p = gcp;
delete(p)

result = mapreduce(sim, @multiplicationMapper, ...
                               @multiplicationReducer);
                   
% Show result                           
r = readall(result)


