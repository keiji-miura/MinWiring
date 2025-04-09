function c = hit12(k,l)
    temp = 0;
    for q = 1:k
        temp = temp + sum(nchoosek(k,q)*q^l*k^(q - 2*l)*(1 - k)^(k - q));
        %nchoosek(k,p)*(1-p/k)^l*(k^(-l+k-p)+p*sum(((-1).^i)./(k.^(l-k+p-i))));
    end
    c = 1-temp;
end


%x=2:16;
%y=[]; for(l=2:16);  y=[y hit12(10,l)]; end
%plot(x,y)