clear all;
close all;
clc;

%segmentasi
n=20;
x=zeros(n+1);
for i=1:n+1
    x(i)=-10+(i-1)*20/n;
end
y=x;
%{
matrix1=zeros(n+1,n+1);
sum=0;
for i=1:n+1
    for j=1:n+1
        if (x(i))^2+(y(j))^2<=100
            matrix1(i,j)=1
        else
            matrix1(i,j)=0
        end
        if matrix1(i,j)==1
            sum=sum+1;
        end
    end
end
%}
matrix=zeros(n+1,n+1);
for i=1:n+1
    for j=1:n+1
        if x(j)<=2 && x(j)>=-2 && y(i)==0
            matrix(i,j)=-1;
        elseif (x(i))^2+(y(j))^2==100
                matrix(i,j)=1;
        else 
                matrix(i,j)=0;
        end
    end
end
sum=0;
matrix2=zeros(n+1,n+1);
for i=1:n+1
    for j=1:n+1
        if (x(i))^2+(y(j))^2<=100
            sum=sum+1;
            matrix2(i,j)=sum;
        end
    end
end
matrix3=zeros(sum,sum);
baris=0;
e_1=4*8.854*(10^(-12));
e_2=e_1/4;
matrix4=zeros(sum);
a=matrix(1,matrix2(2,10));

for i=1:n
    for j=1:n
        baris=baris+1;
        if (x(i))^2+(y(j))^2<=100;
            if x(i)>0 && x(i)<10 && y(j)==0
                matrix3(baris,matrix2(i,j-1))=2*e_1;
                matrix3(baris,matrix2(i,j+1))=2*e_2;
                matrix3(baris,matrix2(i-1,j))=(e_1+e_2);
                matrix3(baris,matrix2(i+1,j))=(e_1+e_2);
                matrix3(baris,matrix2(i,j))=-4*(e_1+e_2);
            elseif y(j)>0 && y(j)<0 && x(i)==0
                matrix3(baris,matrix2(i-1,j))=2*e_1;
                matrix3(baris,matrix2(i+1,j))=2*e_2;
                matrix3(baris,matrix2(i,j+1))=(e_1+e_2);
                matrix3(baris,matrix2(i,j-1))=(e_1+e_2);
                matrix3(baris,matrix2(i,j))=-4*(e_1+e_2);
            elseif x(i)==0 && y(j)==0
                matrix3(baris,matrix2(i,j-1))=(e_1+e_2);
                matrix3(baris,matrix2(i,j+1))=2*e_1;
                matrix3(baris,matrix2(i+1,j))=(e_1+e_2);
                matrix3(baris,matrix2(i-1,j))=2*e_1;
                matrix3(baris,matrix2(i,j))=-2*(-2*e_1-e_2);
            else
                if matrix(i,j-1)==1 | matrix(i,j-1)==-1
                    matrix3(baris,matrix2(i,j+1))=1;
                    matrix3(baris,matrix2(i-1,j))=1;
                    matrix3(baris,matrix2(i+1,j))=1;
                    matrix3(baris,matrix2(i,j))=-4;
                    matrix4(matrix2(i,j-1))=(-1)*matrix(i,j-1)
                elseif matrix(i,j+1)==1 | matrix(i,j+1)==-1
                    matrix3(baris,matrix2(i,j-1))=1;
                    matrix3(baris,matrix2(i-1,j))=1;
                    matrix3(baris,matrix2(i+1,j))=1;
                    matrix3(baris,matrix2(i,j))=-4;
                    matrix4(matrix2(i,j+1))=-1*matrix(i,j+1);
                elseif matrix(i-1,j)==1 | matrix(i-1,j)==-1
                    matrix3(baris,matrix2(i,j+1))=1;
                    matrix3(baris,matrix2(i,j-1))=1;
                    matrix3(baris,matrix2(i+1,j))=1;
                    matrix3(baris,matrix2(i,j))=-4;
                    matrix4(matrix2(i-1,j))=-1*matrix(i-1,j);
                elseif matrix(i+1,j)==1 | matrix(i+1,j)==-1
                    matrix3(baris,matrix2(i,j+1))=1;
                    matrix3(baris,matrix2(i-1,j))=1;
                    matrix3(baris,matrix2(i,j-1))=1;
                    matrix3(baris,matrix2(i,j))=-4;
                    matrix4(matrix2(i+1,j))=-1*matrix(i+1,j);
                elseif matrix(i,j)==1 | matrix(i,j)==-1
                    matrix3(baris,matrix2(i,j+1))=1;
                    matrix3(baris,matrix2(i-1,j))=1;
                    matrix3(baris,matrix2(i+1,j))=1;
                    matrix3(baris,matrix2(i,j-1))=1;
                    matrix4(matrix2(i,j))=4*matrix(i,j);
                else
                    matrix3(baris,matrix2(i,j+1))=1;
                    matrix3(baris,matrix2(i-1,j))=1;
                    matrix3(baris,matrix2(i+1,j))=1;
                    matrix3(baris,matrix2(i,j))=-4;
                    matrix3(baris,matrix2(i,j-1))=1;
                end
            end
        end
    end
end
