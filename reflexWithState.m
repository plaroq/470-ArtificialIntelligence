clear

size = 10;              %set size of matrix

Room = randi(2,size);   %build random room

Room(:,1)=3;            %make walls
Room(:,size)=3;
Room(1,:)=3;
Room(size,:)=3;
%Room(:,5)=3;
%Room(5,5)=1;

a=2;                    %set initial position
b=2;

flag=1;
count=0;

while flag~=0
    Room
    pause (0.05);
    count=count+1;      %count iterations
    flag=0;             
    
    for i=1:10          %flag when all clean
        for j=1:10
            if Room(i,j)==2
                flag=flag+1;
            end
        end
    end
    
    if Room(a,b)==2     %if dirty, suck
        Room(a,b)=1;
    else                %move to next spot
        if Room(a+1,b)==3
            b=b+1;
            a=2;
        else
            a=a+1;
        end
    end
end