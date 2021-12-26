
clc 

clear
%% load hotweights

load('hotweight.mat');

valueMatrix = cell2mat(Value);

hotweight = [Key , valueMatrix];

hotweight = sortrows(hotweight,1);


%% load MatrixMultipication and save results as matrix

load('Matrixmultiplication.mat')


 %% Matrixmultiplication to cell
 
% find unqiue users and idx
[unqUser,~,useridx] = unique(Matrixmultiplication(:,1), 'stable');

% group Matrixmultiplication(:,3) by useridx and apply @saveValue function to each group
MatrixmultiplicationCell = accumarray(useridx,Matrixmultiplication(:,3),size(unqUser),@saveValue);

% group Matrixmultiplication(:,2) by useridx and apply @saveValue function to each group
MatrixmultiplicationMovieIDCell = accumarray(useridx,Matrixmultiplication(:,2),size(unqUser),@saveValue);

improvescore = cell(size(MatrixmultiplicationMovieIDCell,1),2);

for i = 1:size(MatrixmultiplicationMovieIDCell,1)
    
   index = ismember(hotweight(:,1),MatrixmultiplicationMovieIDCell{i,1}) ;  
  
   for j=1:size(index,1)
      
       if(index(j)==0)
            improvescore {i,1} =[improvescore{i,1}; hotweight(j,1)];

            improvescore {i,2} =[improvescore{i,2}; 1];
        end  
       
       
   end
end

load ('userItemCell.mat');
score=cell(size(MatrixmultiplicationCell,1),2);
for i = 1:size(MatrixmultiplicationCell,1)
    score{i,1}=repmat(userItemCell{i,3},1682,1);
    score{i,2} = [MatrixmultiplicationMovieIDCell{i,1};improvescore{i,1}];
    score{i,3}= [MatrixmultiplicationCell{i,1};improvescore{i,2}];
end




%add index to  dataset


%delete rows that user rate that
for i = 1:size(MatrixmultiplicationCell,1)
  for j =1:size(userItemCell{i,1} ,1)
    index=find(score{i,3}==userItemCell{i,1}(j));
      score{i,2}(index)=0;
      score{i,3}(index)=0;
  end
end


recommended =cell(size(MatrixmultiplicationCell,1),1);

for i = 1:size(MatrixmultiplicationCell,1)

     [recommended{i,1}, idx]= sort(score{i,3},'descend');
     recommended{i,2}= score{i,2}(idx);

end

similarity=load('similarity.csv');

[unqItemSim,~,itemidx] = unique(similarity(:,1));

simSum = accumarray(itemidx,similarity(:,3),size(unqItemSim));

usum = zeros (size(userItemCell,1),1);

for i =1:size(userItemCell,1)
  usum(i) = max(userItemCell{i,2});
end


for i =1:size(recommended,1)
    for j = 1:(size(recommended{i,2},1))
    index=find(recommended{i,2}(j)==unqItemSim);
    if(index ~=0)
    recommended{i,1}(j)=recommended{i,1}(j)./(simSum(index)+usum(i));
    else
        break;
    end
    end
    
end

% *weight
for i = 1:size(MatrixmultiplicationCell,1)
    for j =1: size(score{i,2},1)
     index=find(score{i,2}(j)==hotweight(:,1));
     if(index ~=0)
        
     score{i,3}(j)=(score{i,3}(j)*hotweight(index,2))/max(hotweight(:,2));

     
     end
    end
    
end

% neighbor number and  evaluate

Testset=load('Test.csv');

userTestNumber = unique(Testset(:,1));

ItemTestNumber = 2;

ActualResult = reshape (Testset(:,3),[size(userTestNumber,1) ItemTestNumber]);
       
evaluatedResult = zeros(size(userTestNumber,1),ItemTestNumber);

 for i = 1:size(userTestNumber,1)
     for j = 1:ItemTestNumber
          evaluatedResult(i,j) =   recommended{i,1}(j);
     end
 end
 e=reshape(evaluatedResult,40,1);
 ss=[Testset(:,1),e,Testset(:,3)]
%  save('ss.mat','ss');
 
 
 builtInMAE = mae(ActualResult- evaluatedResult)

 builtInRMS = rms(ActualResult- evaluatedResult)






