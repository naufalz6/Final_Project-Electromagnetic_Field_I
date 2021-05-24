clear all;
close all;
clc;

%segmentasi
n=300;
x=zeros(n+1);
for i=1:n+1
    x(i)=-10+(i-1)*20/n;
end
y=x;
%{
matrix1=zeros(n+1,n+1);
for i=1:n+1
    for j=1:n+1
        if (x(i))^2+(y(j))^2<=100
            matrix1(i,j)=1
        else
            matrix1(i,j)=0
        end
    end
end
%}
matrix=zeros(n+1,n+1);
for i=1:n+1
    for j=1:n+1
        if x(j)<=2 && x(j)>=-2 && y(i)==0
            matrix(i,j)=-1;
        else if (x(i))^2+(y(j))^2==100
                matrix(i,j)=1;
            else 
                matrix(i,j)=0
            end
        end
    end
end
contourf(matrix);
colormap(jet(256));
colorbar;