load('minimum_n_1017.mat');
glomeruli_name ={'DM6','DM5','DM2','DM1','DM4','VM2','VM7d','VM7v','DA4L','DA2','DL1','DL5','D','DM3','DC2','VA6','DC3','DL4','DA3','DL3','DA1','VA1d','VA1v','VL2a','VL2p','VA5','VM4','VA7L','VA3','VA4','VA7m','VC2','VC1','VM3','VA2','VM1','Dp1m'};
Frequency = mean(Prime,1);
[Frequency_sorted,I] = sort(Frequency,'descend');
glomeruli_name_sorted = categorical(glomeruli_name(I));
glomeruli_name_sorted =reordercats(glomeruli_name_sorted,{'DL1','VM7d','DM6','VL2a','VC2','VC1','VM2','VM3','VA3','VL2p','DM1','DM4','DC3','VA7m','VA1v','DM3','VA7L','DA4L','VA6','VA2','VM1','Dp1m','DM5','DM2','VM7v','DL5','DA1','VA1d','VM4','DA2','D','DC2','DL4','DA3','DL3','VA5','VA4'});
bar(glomeruli_name_sorted,Frequency_sorted); xlabel('Names of glomeruli','FontSize',18);  ylabel('Freqency of used glomeruli','FontSize',18);


load('minimum_n_8_Dx1Dy1.mat');
Frequency = mean(Prime,1);
glomeruli_name ={'DM6','DM5','DM2','DM1','DM4','VM2','VM7d','VM7v','DA4L','DA2','DL1','DL5','D','DM3','DC2','VA6','DC3','DL4','DA3','DL3','DA1','VA1d','VA1v','VL2a','VL2p','VA5','VM4','VA7L','VA3','VA4','VA7m','VC2','VC1','VM3','VA2','VM1','Dp1m'};
%x軸並べ替え
glomeruli_name_sorted = categorical(glomeruli_name(I));
glomeruli_name_sorted = reordercats(glomeruli_name_sorted,{'DL1','VM7d','DM6','VL2a','VC2','VC1','VM2','VM3','VA3','VL2p','DM1','DM4','DC3','VA7m','VA1v','DM3','VA7L','DA4L','VA6','VA2','VM1','Dp1m','DM5','DM2','VM7v','DL5','DA1','VA1d','VM4','DA2','D','DC2','DL4','DA3','DL3','VA5','VA4'});
%yデータ並べ替え,プロット
figure; bar(glomeruli_name_sorted,Frequency(I)); xlabel('Names of glomeruli','FontSize',18);  ylabel('Freqency of used glomeruli','FontSize',18);


load('Dx4Dy4.mat');
Frequency = mean(Prime,1);
glomeruli_name ={'DM6','DM5','DM2','DM1','DM4','VM2','VM7d','VM7v','DA4L','DA2','DL1','DL5','D','DM3','DC2','VA6','DC3','DL4','DA3','DL3','DA1','VA1d','VA1v','VL2a','VL2p','VA5','VM4','VA7L','VA3','VA4','VA7m','VC2','VC1','VM3','VA2','VM1','Dp1m'};
%x軸並べ替え
glomeruli_name_sorted = categorical(glomeruli_name(I));
glomeruli_name_sorted = reordercats(glomeruli_name_sorted,{'DL1','VM7d','DM6','VL2a','VC2','VC1','VM2','VM3','VA3','VL2p','DM1','DM4','DC3','VA7m','VA1v','DM3','VA7L','DA4L','VA6','VA2','VM1','Dp1m','DM5','DM2','VM7v','DL5','DA1','VA1d','VM4','DA2','D','DC2','DL4','DA3','DL3','VA5','VA4'});
%yデータ並べ替え,プロット
figure; bar(glomeruli_name_sorted,Frequency(I)); xlabel('Names of glomeruli','FontSize',18);  ylabel('Freqency of used glomeruli','FontSize',18);

%%%%%%%最終版%%%%%%%%%%
set(gca,'Fontsize',20);
load('minimum_n_1017.mat');
glomeruli_name ={'DM6','DM5','DM2','DM1','DM4','VM2','VM7d','VM7v','DA4L','DA2','DL1','DL5','D','DM3','DC2','VA6','DC3','DL4','DA3','DL3','DA1','VA1d','VA1v','VL2a','VL2p','VA5','VM4','VA7L','VA3','VA4','VA7m','VC2','VC1','VM3','VA2','VM1','Dp1m'};
Frequency = mean(Prime,1);
[Frequency_sorted,I] = sort(Frequency,'descend');
glomeruli_name_sorted = categorical(glomeruli_name(I));
glomeruli_name_sorted =reordercats(glomeruli_name_sorted,{'DL1','VM7d','DM6','VL2a','VC2','VC1','VM2','VM3','VA3','VL2p','DM1','DM4','DC3','VA7m','VA1v','DM3','VA7L','DA4L','VA6','VA2','VM1','Dp1m','DM5','DM2','VM7v','DL5','DA1','VA1d','VM4','DA2','D','DC2','DL4','DA3','DL3','VA5','VA4'});
bar(glomeruli_name_sorted,Frequency_sorted); xlabel('Names of glomeruli','FontSize',18);  ylabel('Freqency of used glomeruli','FontSize',18);
hold on

load('Dx2Dy2.mat');
Frequency = mean(Prime,1);
plot(glomeruli_name_sorted,Frequency(I),'Linewidth',1.7);
hold on

load('Dx4Dy4.mat');
Frequency = mean(Prime,1);
plot(glomeruli_name_sorted,Frequency(I),'Linewidth',1.7);