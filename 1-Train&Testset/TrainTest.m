clc
clear
% load dataset

Movie=csvread('MovieLens.csv');

% find unique users
[unqUser,~,useridx] = unique(Movie(:,1), 'stable');

% % group Movie(:,2) by userIdx and apply @saveValue function to each group
userItemCell = accumarray(useridx,Movie(:,2),size(unqUser),@saveValue);

% % group Movie(:,3) by userIdx and apply @saveValue function to each group
userItemRate = accumarray(useridx,Movie(:,3),size(unqUser),@saveValue);

% concat matrices
userItemCell = [userItemCell , userItemRate];

% add userids to cell
for i=1:length(unqUser)
    userItemCell{i,3}=unqUser(i);
end

userNumber = size(userItemCell,1);

% find random
testUserNumber = 20;

testItemNumber = 2;

testSet = [];

trainSet =[];


randNumberTestUser = randi([1 userNumber],1,testUserNumber);

for i=1:testUserNumber
    
    currentUser = userItemCell{randNumberTestUser(i),3};
    
  for j = 1:testItemNumber
      
   testSet=[testSet;[currentUser userItemCell{randNumberTestUser(i),1}(j)  userItemCell{randNumberTestUser(i),2}(j)]];
   userItemCell{randNumberTestUser(i),1}(j)=[];
   userItemCell{randNumberTestUser(i),2}(j)=[];
  
  end
  
end

%useritem cell 2 csv

for i = 1:size(userItemCell,1)
   repmatsize= size(userItemCell{i,1},1);
   repmatUser=repmat(userItemCell{i,3},repmatsize,1);
   trainSet =[trainSet;[repmatUser,userItemCell{i,1},userItemCell{i,2}]];
end

%save test and trainset
csvwrite('Train.csv',trainSet);

csvwrite('Test.csv',testSet);


