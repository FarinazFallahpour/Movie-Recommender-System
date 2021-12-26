clc
clear

% load data
load('ItemuserCell.mat');

sim = load('Similarity.csv');

% parameter
Vmax = 5;

Vmin= 1;

%  (m)dimension
dimension = 4;

 MovieID1 = 101;
    
 MovieID2= 102;
           
%use base similarity to find repetitionNumber 
%  repetitionNumbe denotes cardinality of the set of co-rated items
% |Sii'|
repetitionNumber = 3; 
            
% |(si U si')|
unionSetSize = 4;
            
 % |Sii'| / |(si U si')|
repUnionRatio = repetitionNumber / unionSetSize;
            
% calculate distMax
distMax = repUnionRatio * sqrt(dimension * (Vmax - Vmin)^2);
           
%d = sum((x-y).^2).^0.5
% useritem1 = [3  3  4  0  0  1  5];
% useritem2 = [2  2  4  5  0  4  0 ];
% useritem3 = [4  5....
%useritem4 = [3 0(convert to hotweight)....]
 movieID1col =[ 3 ; 2 ;  4 ; 3];
movieID2col =[ 3 ; 2 ; 5 ;  0];
distance = norm( movieID1col - movieID2col);
      
 % equal or not
distsim1 = repUnionRatio * (distMax / distance);
newsim1 = [MovieID1 MovieID2 distsim1];
               
distsim2 = repUnionRatio * (distMax / (0.9 + distance));
newsim2 = [MovieID1 MovieID2 distsim2];
       
       








