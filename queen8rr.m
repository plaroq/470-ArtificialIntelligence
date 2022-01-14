clc
clear all
close all

%initialize variables%
board = zeros(8);
queen = [0 0 0 0 0 0 0 0];
count = 0;
reCount= 0;

%randomize board%
for i=1:8
	queen(i)=randi(8);
	board(queen(i),i)=1;
end

%main loop until solved%
while sum(qblocks(queen))~=0
    
	if count==500
    	%initialize variables%
    	board = zeros(8);
    	queen = [0 0 0 0 0 0 0 0];
    	count = 0;
        reCount=reCount+1;
        
    	%randomize board%
    	for i=1:8
        	queen(i)=randi(8);
        	board(queen(i),i)=1;
    	end
	end
    
	%finds the queens that block the most and picks one%
	k=find(qblocks(queen)==max(qblocks(queen)));
	k=datasample(k,1);

	%runs what-if scenarios for each possible move%
	queenScenarios=[0 0 0 0 0 0 0 0];
	for i=1:8
    	queenTest=queen;
    	queenTest(k)=i;
    	queenScenarios(i)=sum(qblocks(queenTest));
	end
    
	%find best scenarios and pick one%
	m=find(queenScenarios==min(queenScenarios));
	m=datasample(m,1);
	queen(k)=m;
    
	%rebuild the board to display%
	board=zeros(8);
	for i=1:8
    	board(queen(i),i)=1;
	end
	board
	%pause(0.05)
	count=count+1;
end

fprintf('You WIN!\n');

%function to count the number of blocks%
function x = qblocks(q)
x=[0 0 0 0 0 0 0 0];
for i=1:8
	for j=1:8
    	if q(i)==q(j) || abs(q(i)-q(j))==abs(i-j)
        	x(i)=x(i)+1;
    	end
	end
	x(i)=x(i)-1;
end
end