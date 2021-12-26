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

%% part8 
clear

load('9.mat')

valueMatrix = cell2mat(Value);

KeyMatrix =[];

for i = 1:size(Key,1)
    
  KeyMatrix= [KeyMatrix; str2num(Key{i,1})];
  
end

part9 = [KeyMatrix,valueMatrix];

save('part9.mat' ,'part9');
   
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

load('part9.mat')


% concat parts
result = [part1 ; part2 ; part3 ; part4 ; part5 ; part6 ; part7 ; part8; part9];
