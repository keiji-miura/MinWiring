% simulation
n_cell=37; n_level=2; n_sample=84; pn=0.02; %ノイズ
hitrate=[]; smallest_m=[]; smallest_sd=[]; hit_used_m=[]; hit_used_sd=[];toc_store=[];
for n_used=1:8;
    n_used
    hit=[]; smallest_store=[]; hit_used_store=[];
    for repeat=1:100
        xr = randi(n_level,n_cell,n_sample);
        yr = sum(xr(1:n_used,:),1);
        %yr = xr(1,:).*xr(2,:); n_used=2;
        %yr= xr(1,:) + xr(2,:).^2; n_used=2;
        %yr = xr(1,:)+xr(2,:)+xr(3,:); n_used=3;
        %yr = xr(1,:).*xr(2,:).*xr(3,:); n_used=3;
        %yr= xr(1,:).^2 .* xr(2,:) + xr(3,:).^4; n_used=3;
        rn=rand(n_used,n_sample);
        xr(1:n_used,:)=xr(1:n_used,:)+(rn>1-pn/2)-(rn<pn/2);%ノイズx
        %rn=rand(1,n_sample);
        %yr=yr+(rn>0.04)-(rn<0.04);%ノイズy
        tic
        input=zeros(1,n_cell); 
        for k=1:(n_sample-1) 
            for k2=(k+1):n_sample
                if abs(yr(k)-yr(k2))>0
                    input=[input; (abs(xr(:,k)-xr(:,k2))>0)'];
                end
            end
        end
        
        global prime; global smallest;
        M=input; n=size(M,2); prime=[repmat(2,[1 n]); repmat(3,[1 n])]; smallest=n+1;
        M = unique(M,'rows'); M=M(sum(M,2)>0,:); % remove ﾃ?all-zeroﾃ? rows
        TF = sum(M,2)==1; % Preprocessing:  add preprime in the first line and ﾃ?collapseﾃ? a row whose row-sum is one.
        if sum(TF)==0
            M = [zeros(1,n); M];
        elseif sum(TF)==1
            M = [M(TF,:); M(find(1-TF),:)];
        elseif sum(TF) > 1
            M = [sum(M(TF,:))>0; M(find(1-TF),:) ];
        end
        TF = ones(1,size(M,1)); % Remove rows so that only zero appears when the first line is one (preprime==1)
        for j = find(M(1,:)==1)
            TF( M(:,j)==1 )=0;
        end
        TF(1)=1; M=M(TF==1,:);
        if size(M,1)>2
            MinWiring(M);
            Prime = prime(3:end,:);
        elseif size(M,1)==1 & sum(M(1,:))==0 % no clue case
            Prime=ones(1,length(M));
            smallest=length(M);
        elseif size(M,1)==1 & sum(M(1,:))>0
            Prime = M;
            smallest = sum(M);
        else % size(M,1)==2
            M2=M(2,:);
            smallest=sum(M(1,:))+1;
            %smallest=1;
            x=(1:length(M2)); y=cumsum(M2);
            Prime=zeros(sum(M2),length(M2));
            Prime(y(M2~=0),x(M2~=0))=eye(sum(M2~=0));
            if sum(M(1,:))>0 % must use these neurons
                Prime(:,M(1,:)==1)=1;
            end  
        end
        Prime = unique(Prime,'rows');
        toc;
        hit = [hit (sum(Prime(1,1:n_used),2)==n_used & smallest==n_used & size(Prime,1)==1)];%採点
        smallest_store=[smallest_store smallest];
        hit_used_store=[hit_used_store mean(Prime(:,1:n_used))];
        toc_store=[toc_store toc];
    end
    hitrate=[hitrate mean(hit)];
    smallest_m=[smallest_m mean(smallest_store)]; smallest_sd=[smallest_sd std(smallest_store)];
    hit_used_m=[hit_used_m mean(hit_used_store)]; hit_used_sd=[hit_used_sd std(hit_used_store)];
end
%hitrate
%plot(1:5,hitrate)
%set(gca,'FontSize',16);
%xlabel('number of samples','FontSize',18)
%x=1:100;
%y2 = 1 - 0.5.^(x - 2) + 0.5.^(2*x - 2);
%plot(x,y)
%hitrate_ns=hitrate
%save('hitrate_nc2_ns3','hitrate_ns3')
%xlabel('number of samples','FontSize',18)

%load('hitrate_nc2_ns2.mat')
%load('hitrate_nc2_ns3.mat')
%x=2:100;
%y=(x-1)./x.^2;
%plot(x,y); hold on;
%y=(3./x)-(5./x.^2)+(3./x.^3)-(1./x.^4);
%plot(x,y); hold on;
%plot(x,hitrate_ns2,'o');plot(x,hitrate_ns3,'*')

%legend('2 states','2 theory','3 states','10 states'save()
%legend('2 theory','3 theory','5 theory','10 theory','2 states','3 states','5 states','10 states')
hitrate
hit_used_m;
hit_used_store;
smallest_m
difference = smallest_m - [1:n_used]
plot(1:n_used,smallest_m)
xlabel('number of used cell','FontSize',18);
ylabel('smalleat_m','FontSize',18);
hold on 
%plot(1:n_used,difference)
%x=1:n_used;
%y2=x;
%plot(x,y2)
