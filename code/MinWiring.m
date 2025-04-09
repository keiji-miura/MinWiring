
function  [output_args]  = MinWiring(M) 
%３行以上の入力行列１個を分解してグローバル変数primeに追加

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
        copy = M( M(:,j)==0 ,:); % copy[1,j]=1; Rで1-dim時バグ
        if isvector(copy) %1行の時はappendして終り
            if sum(copy) < smallest
                copy(j)=1; AppendPrime(copy);
            end
        elseif ( sum(copy(1,:))+1 ) < smallest
            copy(1,j)=1;
            if size(copy,1)==2 % #2行の時もappendして終らせる                
                for i = find(copy(2,:)==1)
                    preprime=copy(1,:); preprime(i)=1; AppendPrime(preprime);
                end
            else
                MinWiring(copy); %まだ３行以上あるならば再帰
            end
        end
        
    end
end