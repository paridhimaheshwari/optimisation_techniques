a = [1 1; 1 0; 0 1; 2 1; 1 0; 0 1];
b = [800; 400; 700; 1000; 0; 0];
size = length(a);
index = 0;
X = [];
X1 = [];
for i = 1:size
    for j = i+1:size
        asub = a([i,j],:);
        bsub = b([i,j],:);
        if det(asub) ~= 0
            index = index+1;
            X = inv(asub)*bsub;
            X1(index,:) = transpose(X);
        end
    end
end    
X3 = [];
index1 = 0;
if X1>=0
    asub = a((1:size-2),:);
    bsub = b((1:size-2),:);
    for i = 1:index
        if (asub*X1(i,:).' - bsub) <= 0
            index1=index1+1;
            X3(index1,:)=X1(i,:);
        else
            continue;
        end
    end
end
c = [4 3];
z = c*X3.';
[j, k] = max(z);
X3(k,:)

%%%%

p = max(b);
for i = 1:size
    X = [0:0.1:(p)];
    if a(i,2) ~= 0
        Y = (b(i)-a(i,1)*X)/a(i,2);
        plot(X,Y);
        hold on;
    else
        Y = [0:0.1:(p)];
        X = ones(length(Y)) * b(i) / a(i,1);
        plot(X,Y);
        hold on;
    end
end