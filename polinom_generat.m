function phi=polinom_generat(x1,x2,m)
    dim1=length(x1);
    dim2=length(x2);
    if m==1
      phi=zeros(dim1*dim2,m+2);
    else
      phi=zeros(dim1*dim2,((m+1)*(m+2))/2);
    end
    linie=1;
    for i=1:dim1
       for j=1:dim2
            coloana=2;
            phi(linie,1)=1;
        for px1=1:m
            for px2=0:px1
                phi(linie,coloana)=(x1(i).^(px1-px2)).*(x2(j).^px2);
                coloana=coloana+1; 
            end
        end
        linie=linie+1; 
       end
    end
end