m=zeros(37,84);  s=zeros(37,84);  %n=zeros(37,84);
ym=zeros(1,84);  ys=zeros(1,84);  %yn=zeros(1,84);  %ym=yの平均、ys=yの偏差%
for j=1:84
    ym(j)=mean(y(j,:),'omitnan');
    ys(j)=std(y(j,:),'omitnan');
    ys(j)=ys(j)/sqrt(sum(~isnan(y(j,:))));
    for i=1:37
        m(i,j)=mean(reshape(mean(X(i,11:16,j,:,:),2,'omitnan'),1,244),'omitnan');
        s(i,j)=std(reshape(mean(X(i,11:16,j,:,:),2,'omitnan'),1,244),'omitnan');
        s(i,j)=s(i,j)/sqrt(sum(~isnan(reshape(mean(X(i,11:16,j,:,:),2,'omitnan'),1,244))));
    end
end


Smallest=[];  dx=2*(0.5:0.1:2.0);  dy=2*(0.5:0.1:2.0);  od_set=(1:84);
for ii=1:size(dx,2)
    for jj=1:size(dy,2)
        Dx=dx(ii);
        Dy=dy(jj)
        input=zeros(1,37);
        for k=1:(length(od_set)-1)
            i=od_set(k);
            for k2=(k+1):length(od_set)
                j=od_set(k2);
                if abs(ym(i)-ym(j))>((ys(i)+ys(j))/2*Dy)
                   input=[input; (abs(m(:,i)-m(:,j))>((s(:,i)+s(:,j))/2*Dx))'];
                end
            end
        end

        global prime;  global smallest;
        M=input;  n=size(M,2);  prime=[repmat(2,[1 n]); repmat(3,[1 n])];  smallest=n+1;
        M=unique(M,'rows');  M=M(sum(M,2)>0,:);
        TF=sum(M,2)==1;
        if sum(TF)==0
           M=[zeros(1,n); M];
        elseif sum(TF)==1
               M=[M(TF,:); M(find(1-TF),:)];
        elseif sum(TF)>1
               M=[sum(M(TF,:))>0; M(find(1-TF),:)];
        end
        TF=ones(1,size(M,1));
        for j=find(M(1,:)==1)
            TF(M(:,j)==1)=0;
        end
        TF(1)=1;  M=M(TF==1,:);
        if size(M,1)==1
           Prime=M;
           Smallest(ii,jj)=sum(M);
        else
             MinWiring(M); Prime = prime(3:end,:);
             Smallest(ii,jj) = smallest;
             %sum( input(:,Prime(1,:)==1) ) % Answer check is very easy!
             %[~,a] = sort(sum(Prime),'descend')
             %glomeruli(a)
        end
    end
end
Smallest

%閾値パラメータごとの必要な糸球体数のイメージング%
set(0,'defaultAxesFontSize',18);
imagesc(dx,dy,Smallest');  set(gca,'YDir','normal');
xlabel('x-thresehold [\sigmax]');  ylabel('y-thresehold [\sigmay]');
%xticks(2:2:16);  yticks(2:2:16);
c=colorbar;  c.Label.String='Minimum number of glomeruli required';
hold on

plot(2*sqrt(2),2*sqrt(2),'r*','MarkerSize',18)
%code5に続く%
%↑ここまで完成%