%% (key,value)pairs of similarity

%% part1
clear

load('1.mat')

valueMatrix = cell2mat(Value);

KeyMatrix =[];

for i = 1:size(Key,1)
    
  KeyMatrix= [KeyMatrix; str2num(Key{i,1})];
  
end

part1 = [KeyMatrix,valueMatrix];

save('part1.mat' ,'part1');

%% part2 
clear

load('2.mat')

valueMatrix = cell2mat(Value);

KeyMatrix =[];

for i = 1:size(Key,1)
    
  KeyMatrix= [KeyMatrix; str2num(Key{i,1})];
  
end


part2 = [KeyMatrix,valueMatrix];

save('part2.mat' ,'part2');

%% part3
clear

load('3.mat')

valueMatrix = cell2mat(Value);

KeyMatrix =[];

for i = 1:size(Key,1)
    
  KeyMatrix= [KeyMatrix; str2num(Key{i,1})];
  
end

part3 = [KeyMatrix,valueMatrix];

save('part3.mat' ,'part3');

%% part4 
clear

load('4.mat')

valueMatrix = cell2mat(Value);

KeyMatrix =[];

for i = 1:size(Key,1)
    
  KeyMatrix= [KeyMatrix; str2num(Key{i,1})];
  
end

part4 = [KeyMatrix,valueMatrix];

save('part4.mat' ,'part4');

%% part5 
clear

load('5.mat')

valueMatrix = cell2mat(Value);

KeyMatrix =[];

for i = 1:size(Key,1)
    
  KeyMatrix= [KeyMatrix; str2num(Key{i,1})];
  
end

part5 = [KeyMatrix,valueMatrix];

save('part5.mat' ,'part5');

%% part6 
clear

load('6.mat')

valueMatrix = cell2mat(Value);

KeyMatrix =[];

for i = 1:size(Key,1)
    
  KeyMatrix= [KeyMatrix; str2num(Key{i,1})];
  
end

part6 = [KeyMatrix,valueMatrix];

save('part6.mat' ,'part6');
%% part7 
clear

load('7.mat')

valueMatrix = cell2mat(Value);

KeyMatrix =[];

for i = 1:size(Key,1)
    
  KeyMatrix= [KeyMatrix; str2num(Key{i,1})];
  
end

part7 = [KeyMatrix,valueMatrix];

save('part7.mat' ,'part7');

%% part8 
clear

load('8.mat')

valueMatrix = cell2mat(Value);

KeyMatrix =[];

for i = 1:size(Key,1)
    
  KeyMatrix= [KeyMatrix; str2num(Key{i,1})];
  
end

part8 = [KeyMatrix,valueMatrix];

save('part8.mat' ,'part8');

   
%%   -----
%% load part1...part8 
load('part1.mat')

load('part2.mat')

load('part3.mat')

load('part4.mat')

load('part5.mat')

load('part6.mat')

load('part7.mat')

load('part8.mat')

% concat parts
result = [part1 ; part2 ; part3 ; part4 ; part5 ; part6 ; part7 ; part8];

% complete similarity matrix
col1 = result(:,1);

col2 = result(:,2);

r = result(:,3);

newsim = [col2 , col1 , r];

simtotal = [result ; newsim];

% find unique user and indexs
[unqUser,~,useridx] = unique(simtotal(:,1), 'stable');

% find user number
userNumber = size (unqUser,1);

% group simtotal(:,3) by useridx and apply @saveValue function to each group
resultCell = accumarray(useridx,simtotal(:,3),size(unqUser),@saveValue);

% group simtotal(:,2) by useridx and apply @saveValue function to each group
resultuser = accumarray(useridx,simtotal(:,2),size(unqUser),@saveValue);

% sort results
sortedresultCell = cell(userNumber,1);
indexresultCell = cell(userNumber,1);

for i = 1: userNumber
   [sortedresultCell{i,1} , indexresultCell{i,1}] = sort(resultCell{i,1},'descend');
end

%% top 5
top5simCell = cell(userNumber,1);

for i = 1 : userNumber
  
    for j= 1 : 5
        currentIndex = indexresultCell{i,1}(j);
        
        top5simCell{i,1} =[top5simCell{i,1};[i,resultuser{i,1}(currentIndex) ,sortedresultCell{i,1}(j)]];
    end
    
end

top5sim=cell2mat(top5simCell);

save ('top5sim.mat','top5sim');

%% top 10

top10simCell = cell(userNumber,1);

for i = 1 : userNumber
    
    for j = 1 : 10
        currentIndex=indexresultCell{i,1}(j);
        
        top10simCell{i,1} =[top10simCell{i,1};[i,resultuser{i,1}(currentIndex) ,sortedresultCell{i,1}(j)]];
    end
    
end

top10sim=cell2mat(top10simCell);

save ('top10sim.mat','top10sim');

%% top 20

top20simCell = cell(userNumber,1);

for i = 1 : userNumber
    
    for j = 1: 20
    currentIndex=indexresultCell{i,1}(j);
    
    top20simCell{i,1} =[top20simCell{i,1};[i,resultuser{i,1}(currentIndex) ,sortedresultCell{i,1}(j)]];
    
    end
    
end

top20sim=cell2mat(top20simCell);
save ('top20sim.mat','top20sim');

csvwrite('top5sim.csv',top5sim)
csvwrite('top10sim.csv',top10sim)
csvwrite('top20sim.csv',top10sim)
