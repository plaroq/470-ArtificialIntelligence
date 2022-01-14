clc
clear all
close all

sol=[1 2 3;4 5 6;7 8 0] %solution

puzz=vec2mat(randperm(8,8),3) %generate random puzzle
%puzz=[2 0 3;1 5 6;4 7 8]

x=3;    %x and y coordinates of the zero square
y=3;
k=0;    %direction of travel up, right, down or left

mdist=[0 0 0 0];    %manhattan distance

a=0;        %used for exiting while loop
count=0;    %to count the number of iterations

while a==0;
    count=count+1;  %counting up
    %pause(0.01)
    for i=1:4       %check all 4 directions and calculate
        switch i    %manhattan distance for each.
            case 1  %up
                if x<=1 || k==3
                    mdist(1,1)=100;
                else
                    test1=puzz;
                    test1(x,y)=test1(x-1,y);
                    test1(x-1,y)=0;
                    mdist(1,1)=manhattan(test1);
                end
            case 2  %right
                if y>=3 || k==4
                    mdist(1,2)=100;
                else
                    test2=puzz;
                    test2(x,y)=test2(x,y+1);
                    test2(x,y+1)=0;
                    mdist(1,2)=manhattan(test2);
                end
             case 3 %down
                if x>=3 || k==1
                    mdist(1,3)=100;
                else
                    test3=puzz;
                    test3(x,y)=test3(x+1,y);
                    test3(x+1,y)=0;
                    mdist(1,3)=manhattan(test3);
                end
             case 4 %left
                if y<=1 || k==2
                    mdist(1,4)=100;
                else
                    test4=puzz;
                    test4(x,y)=test4(x,y-1);
                    test4(x,y-1)=0;
                    mdist(1,4)=manhattan(test4);
                end            
        end
    end
    
    win=min(mdist);     %calculate minimum
    k=find(mdist==win); %choose direction
    k=datasample(k,1);
    
    if k==1
        puzz=test1
        x=x-1;
    elseif k==2
        puzz=test2
        y=y+1;
    elseif k==3
        puzz=test3
        x=x+1;
    elseif k==4
        puzz=test4
        y=y-1;
    end
    if isequal(puzz,sol)    %check if solved
        a=1;
        fprintf('You WIN!\n');
    end
    mdist=[0 0 0 0];    %reset manhattans   
end

function q = manhattan(board)
    q=0;    %function to calculate manhattan distance  
    for j=1:8
    [w,v]=find(board==j);
        switch j    %calculate distance for all 8 tiles
            case 1
                q=q+abs(v-1)+abs(w-1);
            case 2
                q=q+abs(v-2)+abs(w-1);
            case 3
                q=q+abs(v-3)+abs(w-1);
            case 4
                q=q+abs(v-1)+abs(w-2);
            case 5
                q=q+abs(v-2)+abs(w-2);
            case 6
                q=q+abs(v-3)+abs(w-2);
            case 7
                q=q+abs(v-1)+abs(w-3);
            case 8
                q=q+abs(v-2)+abs(w-3);
        end
    end
end