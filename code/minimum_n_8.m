m=zeros(37,84);  s=zeros(37,84);  %n=zeros(37,84);
ym=zeros(1,84);  ys=zeros(1,84);  %yn=zeros(1,84);  %ym=yの平均、ys=yの偏差%
Smallest=[];  Dx=2*sqrt(2); Dy=2*sqrt(2); %t検定の値を入れる
for st_t=1:33 %35
    for j=1:84
        ym(j)=mean(y(j,:),'omitnan');
        ys(j)=std(y(j,:),'omitnan');
        ys(j)=ys(j)/sqrt(sum(~isnan(y(j,:))));
        for i=1:37
            m(i,j)=mean(reshape(mean(X(i,st_t:(st_t+7),j,:,:),2,'omitnan'),1,244),'omitnan'); %＋7（10~17stepが論文）
            s(i,j)=std(reshape(mean(X(i,st_t:(st_t+7),j,:,:),2,'omitnan'),1,244),'omitnan');
            s(i,j)=s(i,j)/sqrt(sum(~isnan(reshape(mean(X(i,st_t:(st_t+7),j,:,:),2,'omitnan'),1,244))));
        end
    end
    input=zeros(1,37);
    for i=1:83
        for j=(i+1):84
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
       Smallest(st_t)=sum(M);
    else
         MinWiring(M); Prime = prime(3:end,:);
         Smallest(st_t) = smallest;
         %sum( input(:,Prime(1,:)==1) ) % Answer check is very easy!
         %[~,a] = sort(sum(Prime),'descend')
         %glomeruli(a)
    end
end
Smallest


plot(((0:(40-8))-8.9+8)*0.595,Smallest,'k','LineWidth',3)
ylim([0 37]); xlabel('Time from odor onset (s)');  ylabel('Minimum number of glomeruli required'); hold on; xline(0,':k');