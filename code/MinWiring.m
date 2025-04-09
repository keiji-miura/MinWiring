
function  [output_args]  = MinWiring(M) 
%�R�s�ȏ�̓��͍s��P�𕪉����ăO���[�o���ϐ�prime�ɒǉ�

    global smallest;

    [minimum nonlin_gen_ind] = min(sum(M(2:end,:),2));
    ind = find( M(1+nonlin_gen_ind,:)==1 );
    priority = sum(M(:,ind));
    if max(priority)>1
        ind=ind(priority>1);
        priority = priority(priority>1);
    end
    [a b] = sort(priority,'descend');
    for j = ind(b)
        copy = M( M(:,j)==0 ,:); % copy[1,j]=1; R��1-dim���o�O
        if isvector(copy) %1�s�̎���append���ďI��
            if sum(copy) < smallest
                copy(j)=1; AppendPrime(copy);
            end
        elseif ( sum(copy(1,:))+1 ) < smallest
            copy(1,j)=1;
            if size(copy,1)==2 % #2�s�̎���append���ďI�点��                
                for i = find(copy(2,:)==1)
                    preprime=copy(1,:); preprime(i)=1; AppendPrime(preprime);
                end
            else
                MinWiring(copy); %�܂��R�s�ȏ゠��Ȃ�΍ċA
            end
        end
        
    end
end