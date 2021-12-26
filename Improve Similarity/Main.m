clc
clear

% load data
load('ItemuserCell.mat');

sim = load('Similarity.csv');

mldata = load('mldata.csv');

Movie=load('MovieLens.csv');


% parameter
Vmax = 5;

Vmin= 1;

ItemNumber = size(ItemuserCell,1);

[unqItem,~,~] = unique(Movie(:,2), 'stable');

% calculate Item-base similarity
newsim=[];

 % m dimension
dimension = size(mldata,1);

for MovieID1 = 1:ItemNumber 
    
    for MovieID2= 1:ItemNumber 
        
       index = find((sim(:,1) == unqItem(MovieID1))&(sim(:,2) == unqItem(MovieID2)));
       
       if(size(index,1) ~= 0)  %we use neigborhood similarity 
           
           %use base similarity to find repetitionNumber 
           %  repetitionNumbe denotes cardinality of the set of co-rated items
           % |Sii'|
            repetitionNumber = sim(index , 3); 
            
            %find out union of 2 set (si U si')
            unionSet = union (ItemuserCell{MovieID1,1},ItemuserCell{MovieID2,1});
            
            % |(si U si')|
            unionSetSize = size(unionSet,1);
            
            % |Sii'| / |(si U si')|
            repUnionRatio = repetitionNumber / unionSetSize;
            
           
            % calculate distMax
            distMax = repUnionRatio * sqrt(dimension * (Vmax - Vmin)^2);
           
            %d = sum((x-y).^2).^0.5
            distance = norm(mldata(:,MovieID1)-mldata(:,MovieID2));
      
            % equal or not
            if(mldata(:,MovieID1)==mldata(:,MovieID2)) 
                  distsim = repUnionRatio * (distMax / (0.9 + distance));
                newsim=[newsim;[unqItem(MovieID1) unqItem(MovieID2) distsim]];
               
            else
               distsim = repUnionRatio * (distMax / distance);
                newsim=[newsim;[unqItem(MovieID1) unqItem(MovieID2) distsim]];
            end
       

       end
    end
end

csvwrite('impSim.csv',newsim);







