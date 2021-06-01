clear all;
close all;
clc;

filename = 'Notes Tubes.xlsx';
matrix3 = readmatrix(filename)

%segmentasi
n=20;
e_1=4*8.854*(10^(-12));
e_2=e_1/4;
x=zeros(n+1,1);
for i=1:n+1
    x(i)=-10+(i-1)*20/n;
end
y=-x;

sum=0;
matrix2=zeros(n+1,n+1);
for i=1:n+1
    for j=1:n+1
        if ((x(j))^2+(y(i))^2<=(10-20/n)^2) && not(x(j)<=2 && x(j)>=-2 && y(i)==0)
            sum=sum+1;
            matrix2(i,j)=sum;
        end
    end
end

matrix4=zeros(16,1);
for i=1:16
    if i>=0 && i<=12
        matrix4(i,1)=4*pi*e_2
    else
        matrix4(i,1)=-4*pi*e_2
    end
end

matrix5 = inv(matrix2)* matrix4 ;

for i=1:16
    if i>=0 && i<=12
        matrix5(i,1)=matrix5(i,1) * 5/3*pi
    end
end
