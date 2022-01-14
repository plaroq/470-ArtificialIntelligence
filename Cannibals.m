clc
clear all
close all

initialState=[1 0 0 0 0;3 0 0 0 0;3 0 0 0 0;1 0 0 0 0]; %set initial state

global iter %counter to keep track of iterations
iter=0;

checkBranches(initialState,1) %call recursive function to solve DFS

function x = isValid(S) %function to check if current state is valid
    if S(1,1)<0 || S(1,1)>3 || S(1,2)<0 || S(1,2)>3 || ...  %check 0<x<3
            (S(1,1)>0 && S(1,1)<S(1,2)) || ((3-S(1,1)) ...
            && (3-S(1,1))<(3-S(1,2)))                       %check M>C
        x=0;
        fprintf("NOT Valid\n")
    else
        x=1;
        fprintf("Valid\n")
    end
end

function Y = checkBranches(Z,a) %function to check new states        
global iter

iter=iter+1;
    if a %check if we've reached solution    
        for j=1:5 %check all 5 states
            if Z(1,j)==1 %only proceed if solution is valid
                currState=Z(2:end,j)';
                currState2=Z(2:end,j)';
                for i=1:5
                    switch i
                        case 1
                            newState=[currState(1,1)-1 currState(1,2) ~currState(1,3)];
                            flag=isValid(newState);
                            if flag==1
                                validBranches(1,1)=1;
                            else
                                validBranches(1,1)=0;
                            end
                            validBranches(2,1)=newState(1,1);
                            validBranches(3,1)=newState(1,2);
                            validBranches(4,1)=newState(1,3);
                        case 2
                            newState=[currState(1,1) currState(1,2)-1 ~currState(1,3)];
                            flag=isValid(newState);
                            if flag==1
                                validBranches(1,2)=1;
                            else
                                validBranches(1,2)=0;
                            end
                            validBranches(2,2)=newState(1,1);
                            validBranches(3,2)=newState(1,2);
                            validBranches(4,2)=newState(1,3);
                        case 3
                            newState=[currState(1,1)-2 currState(1,2) ~currState(1,3)];
                            flag=isValid(newState);
                            if flag==1
                                validBranches(1,3)=1;
                            else
                                validBranches(1,3)=0;
                            end
                            validBranches(2,3)=newState(1,1);
                            validBranches(3,3)=newState(1,2);
                            validBranches(4,3)=newState(1,3);
                        case 4
                            newState=[currState(1,1) currState(1,2)-2 ~currState(1,3)];
                            flag=isValid(newState);
                            if flag==1
                                validBranches(1,4)=1;
                            else
                                validBranches(1,4)=0;
                            end
                            validBranches(2,4)=newState(1,1);
                            validBranches(3,4)=newState(1,2);
                            validBranches(4,4)=newState(1,3);
                        case 5
                            newState=[currState(1,1)-1 currState(1,2)-1 ~currState(1,3)];
                            flag=isValid(newState);
                            if flag==1
                                validBranches(1,5)=1;
                            else
                                validBranches(1,5)=0;
                            end
                            validBranches(2,5)=newState(1,1);
                            validBranches(3,5)=newState(1,2);
                            validBranches(4,5)=newState(1,3);
                    end
                end %check all 5 new options
                if currState2==[0 0 0] %check if reached solution
                    fprintf('You WIN!\n');
                    currState
                    a=0;
                else
                    validBranches
                    checkBranches(validBranches,a); %recursion
                end
            end
        end
    end
end