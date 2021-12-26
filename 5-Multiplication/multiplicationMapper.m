function multiplicationMapper(sim,~, intermKVStore)

userItemCell = load('userItemCell.mat');

userItemCell = userItemCell.userItemCell;

users = size (userItemCell , 1);


for userNum = 1:users  % for each user

   % clarify user id, current userItem vector and rating
    userItemCurrent = userItemCell{userNum,1};
    
    rating = userItemCell{userNum,2}; 
    
    userid=userItemCell{userNum,3};

    for i = 1:size(sim.MovieID1,1)
    
        % clarify current element row col and value
        
        currentElementRow = sim.MovieID1(i);
   
        currentElementCol= sim.MovieID2(i);
   
        currentElementValue = sim.Freq(i);
        
        % find 
   
        userItemIndex = find(userItemCurrent == currentElementCol);
 
            if(userItemIndex ~= 0 ) % add as (key,value) pair
                
               userItemValue = rating(userItemIndex);
               
            else % can not find index
               
                continue;
                
            end
   
          % calculate value
          value = currentElementValue * userItemValue;
          
          % create key
          key = mat2str([userid , currentElementRow]);
          
          % add (key,value) pair to intermKVStore
          add(intermKVStore, key , value); 
    
          %uncomment to show results in each epoch
%            key
%            value

    end

end

end

