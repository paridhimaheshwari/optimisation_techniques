

clear all;
close all;
clc;
A=[1 1;1 0; 0 1; 2 1; 1 0;0 1];
B=[800;400;700;1000;0;0];
C = [4 3]
m = length(B);

index = 0;

for i=1:m
    for j = i+1: m
        a_sub = A([i,j], :);
        b_sub = B([i,j], :);
        
        if (det(a_sub) ~= 0)
            index = index + 1;
            X = inv(a_sub)*b_sub;
            X1(index,:)=X.';
        end
    end
end
X1     

rejectedP = 0
index1 = 0
X3 = [];
if(X1 >= 0)
    a_sub = A([1:m-2],:);
    b_sub = B([1:m-2]);
    
    for i= 1:index
        if(a_sub * X1(i,:).' - b_sub <= 0)
            index1 = index1+1
            X2(index1,:) = X1(i,:)
            X3(end+1)=i;
            continue;
        else
            rejectedP = rejectedP+1;
            display(i);
        end
            
    end
    
end

rejectedP
index1
X3

Z = C*X2'
[zmax, imax,]=max(Z)

xmax = X2(imax, :)
Z