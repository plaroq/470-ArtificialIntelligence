clc
clear all
close all

sol=[1 2 3;4 5 6;7 8 0]

puzz=vec2mat(randperm(8,8),3)
x=3;
y=3;
k=0;
mdist=[0 0 0 0];
a=0;
count=0;
tcount=0;

while a==0;
    count=count+1;
    tcount=tcount+1;
    %pause(0.01)
    if count==20000
        puzz=vec2mat(randperm(8,8),3);
        x=3;
        y=3;
        k=0;
        mdist=[0 0 0 0];
        a=0;
        count=0;
    end
    for i=1:4
        switch i
            case 1
                if x<=1 || k==3
                    mdist(1,1)=100;
                else
                    test1=puzz;
                    test1(x,y)=test1(x-1,y);
                    test1(x-1,y)=0;
                    mdist(1,1)=manhattan(test1);
                end
            case 2
                if y>=3 || k==4
                    mdist(1,2)=100;
                else
                    test2=puzz;
                    test2(x,y)=test2(x,y+1);
                    test2(x,y+1)=0;
                    mdist(1,2)=manhattan(test2);
                end
             case 3
                if x>=3 || k==1
                    mdist(1,3)=100;
                else
                    test3=puzz;
                    test3(x,y)=test3(x+1,y);
                    test3(x+1,y)=0;
                    mdist(1,3)=manhattan(test3);
                end
             case 4
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
    mdist;
    k=randi(4);
    if mdist(1,k)==100
        k=0;
    else
        if mdist(1,k)<=randi(60)
            k=k;
        else
            k=0;
        end
    end
    %win=min(mdist);
    %k=find(mdist==win);
    %k=datasample(k,1);
    if k==1
        puzz=test1;
        x=x-1;
    elseif k==2
        puzz=test2;
        y=y+1;
    elseif k==3
        puzz=test3;
        x=x+1;
    elseif k==4
        puzz=test4;
        y=y-1;
    end
    if isequal(puzz,sol)
        a=1;
        fprintf('You WIN!');
    end
    mdist=[0 0 0 0];   
end

function q = manhattan(board)
    q=0;  
    for j=1:8
    [w,v]=find(board==j);
        switch j
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