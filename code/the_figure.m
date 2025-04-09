%the fig 1
load('2level.mat'); plot(2:n_sample,hitrate,'sb','MarkerSize',8); set(gca,'Fontsize',16); xlabel('number of used samples','FontSize',18); ylabel('fraction of correct answer','FontSize',18); hold on
load('3level.mat'); plot(2:n_sample,hitrate,'dr','MarkerSize',8);
load('5level.mat'); plot(2:n_sample,hitrate,'og','MarkerSize',8);
load('10level.mat'); plot(2:n_sample,hitrate,'^k','MarkerSize',8);
load('2theory.mat');plot(x,y,'b','Linewidth',2);
load('3theory.mat');plot(x,y,'r','Linewidth',2);
load('5theory.mat');plot(x,y,'g','Linewidth',2);
load('10theory.mat');plot(x,y,'k','Linewidth',2);

%the fig2
load('9cell_21sample.mat'); plot(1:n_used,hitrate,'Linewidth',2); set(gca,'Fontsize',16); xlabel('number of used cell','FontSize',18); ylabel('fraction of correct answer','FontSize',18); hold on
load('18cell_21sample.mat'); plot(1:n_used,hitrate,'Linewidth',2);
load('37cell_21sample.mat'); plot(1:n_used,hitrate,'Linewidth',2);

figure;
load('9cell_42sample.mat'); plot(1:n_used,hitrate,'Linewidth',2); set(gca,'Fontsize',16); xlabel('number of used cell','FontSize',18); ylabel('fraction of correct answer','FontSize',18); hold on
load('18cell_42sample.mat'); plot(1:n_used,hitrate,'Linewidth',2);
load('37cell_42sample.mat'); plot(1:n_used,hitrate,'Linewidth',2);

figure;
load('9cell_84sample.mat'); plot(1:n_used,hitrate,'Linewidth',2); set(gca,'Fontsize',16); xlabel('number of used cell','FontSize',18); ylabel('fraction of correct answer','FontSize',18); hold on
load('18cell_84sample.mat'); plot(1:n_used,hitrate,'Linewidth',2);
load('37cell_84sample.mat'); plot(1:n_used,hitrate,'Linewidth',2);

figure;
load('9cell_21sample.mat'); errorbar(1:n_used,smallest_m,smallest_sd,'Linewidth',2); set(gca,'Fontsize',16); xlabel('number of used cell','FontSize',18); ylabel('smallest','FontSize',18); hold on 
load('18cell_21sample.mat'); errorbar(1:n_used,smallest_m,smallest_sd,'Linewidth',2);
load('37cell_21sample.mat'); errorbar(1:n_used,smallest_m,smallest_sd,'Linewidth',2);
plot(1:n_used,1:n_used,':k','Linewidth',2)

figure;
load('9cell_42sample.mat'); errorbar(1:n_used,smallest_m,smallest_sd,'Linewidth',2); set(gca,'Fontsize',16); xlabel('number of used cell','FontSize',18); ylabel('smallest','FontSize',18); hold on 
load('18cell_42sample.mat'); errorbar(1:n_used,smallest_m,smallest_sd,'Linewidth',2);
load('37cell_42sample.mat'); errorbar(1:n_used,smallest_m,smallest_sd,'Linewidth',2);
plot(1:n_used,1:n_used,':k','Linewidth',2);  ylim([1 8]);

figure;
load('9cell_84sample.mat'); errorbar(1:n_used,smallest_m,smallest_sd,'Linewidth',2); set(gca,'Fontsize',16); xlabel('number of used cell','FontSize',18); ylabel('smallest','FontSize',18); hold on 
load('18cell_84sample.mat'); errorbar(1:n_used,smallest_m,smallest_sd,'Linewidth',2);
load('37cell_84sample.mat'); errorbar(1:n_used,smallest_m,smallest_sd,'Linewidth',2);
plot(1:n_used,1:n_used,':k','Linewidth',2)

%the fig3 %noise simulation
load('37cell_21sample_4noise.mat');errorbar(1:n_used,smallest_m,smallest_sd,'Linewidth',2); set(gca,'Fontsize',16); xlabel('number of used cell','FontSize',18); ylabel('smallest','FontSize',18); hold on 
load('37cell_21sample_2noise.mat'); errorbar(1:n_used,smallest_m,smallest_sd,'Linewidth',2);
load('37cell_21sample.mat'); errorbar(1:n_used,smallest_m,smallest_sd,'Linewidth',2);
plot(1:n_used,1:n_used,':k','Linewidth',2); ylim([0 9]);

figure;
load('37cell_42sample_4noise.mat');errorbar(1:n_used,smallest_m,smallest_sd,'Linewidth',2); set(gca,'Fontsize',16); xlabel('number of used cell','FontSize',18); ylabel('smallest','FontSize',18); hold on 
load('37cell_42sample_2noise.mat'); errorbar(1:n_used,smallest_m,smallest_sd,'Linewidth',2);
load('37cell_42sample.mat'); errorbar(1:n_used,smallest_m,smallest_sd,'Linewidth',2);
plot(1:n_used,1:n_used,':k','Linewidth',2); ylim([0 9]);


figure;
load('37cell_84sample_4noise.mat');errorbar(1:n_used,smallest_m,smallest_sd,'Linewidth',2); set(gca,'Fontsize',16); xlabel('number of used cell','FontSize',18); ylabel('smallest','FontSize',18); hold on 
load('37cell_84sample_2noise.mat'); errorbar(1:n_used,smallest_m,smallest_sd,'Linewidth',2);
load('37cell_84sample.mat'); errorbar(1:n_used,smallest_m,smallest_sd,'Linewidth',2);
plot(1:n_used,1:n_used,':k','Linewidth',2); ylim([0 9]);


%the fig3 %tictoc
load('37cell_21sample_4noise.mat'); m_log=10.^mean(log10(toc_store)); pos=10.^(mean(log10(toc_store))+std(log10(toc_store))); neg=10.^(mean(log10(toc_store))-std(log10(toc_store))); errorbar(1:n_used,m_log,m_log-neg,pos-m_log,'Linewidth',2); set(gca, 'YScale', 'log'); set(gca,'Fontsize',16); hold on
load('37cell_21sample_2noise.mat'); m_log=10.^mean(log10(toc_store)); pos=10.^(mean(log10(toc_store))+std(log10(toc_store))); neg=10.^(mean(log10(toc_store))-std(log10(toc_store))); errorbar(1:n_used,m_log,m_log-neg,pos-m_log,'Linewidth',2);
load('37cell_21sample.mat'); m_log=10.^mean(log10(toc_store)); pos=10.^(mean(log10(toc_store))+std(log10(toc_store))); neg=10.^(mean(log10(toc_store))-std(log10(toc_store))); errorbar(1:n_used,m_log,m_log-neg,pos-m_log,'Linewidth',2);
ylim([10^(-3) 10^4]);
figure;
load('37cell_42sample_4noise.mat'); m_log=10.^mean(log10(toc_store)); pos=10.^(mean(log10(toc_store))+std(log10(toc_store))); neg=10.^(mean(log10(toc_store))-std(log10(toc_store))); errorbar(1:n_used,m_log,m_log-neg,pos-m_log,'Linewidth',2); set(gca, 'YScale', 'log'); set(gca,'Fontsize',16); hold on
load('37cell_42sample_2noise.mat'); m_log=10.^mean(log10(toc_store)); pos=10.^(mean(log10(toc_store))+std(log10(toc_store))); neg=10.^(mean(log10(toc_store))-std(log10(toc_store))); errorbar(1:n_used,m_log,m_log-neg,pos-m_log,'Linewidth',2);
load('37cell_42sample.mat'); m_log=10.^mean(log10(toc_store)); pos=10.^(mean(log10(toc_store))+std(log10(toc_store))); neg=10.^(mean(log10(toc_store))-std(log10(toc_store))); errorbar(1:n_used,m_log,m_log-neg,pos-m_log,'Linewidth',2);
ylim([10^(-3) 10^4]);
figure;
load('37cell_84sample_4noise.mat'); m_log=10.^mean(log10(toc_store)); pos=10.^(mean(log10(toc_store))+std(log10(toc_store))); neg=10.^(mean(log10(toc_store))-std(log10(toc_store))); errorbar(1:n_used,m_log,m_log-neg,pos-m_log,'Linewidth',2); set(gca, 'YScale', 'log'); set(gca,'Fontsize',16); hold on
load('37cell_84sample_2noise.mat'); m_log=10.^mean(log10(toc_store)); pos=10.^(mean(log10(toc_store))+std(log10(toc_store))); neg=10.^(mean(log10(toc_store))-std(log10(toc_store))); errorbar(1:n_used,m_log,m_log-neg,pos-m_log,'Linewidth',2);
load('37cell_84sample.mat'); m_log=10.^mean(log10(toc_store)); pos=10.^(mean(log10(toc_store))+std(log10(toc_store))); neg=10.^(mean(log10(toc_store))-std(log10(toc_store))); errorbar(1:n_used,m_log,m_log-neg,pos-m_log,'Linewidth',2);
ylim([10^(-3) 10^4]);
%the fig4 %the real data
load('minimum_n_8.mat'); plot(((0:(40-8))-8.9+8)*0.595,Smallest,'k','LineWidth',3); ylim([0 37]); xlabel('Time from odor onset (s)');  ylabel('Minimum number of glomeruli required'); hold on; xline(0,':k');

%the fig4 %freqency %8stepå≈íË
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


%the fig4 %freqency %DxDy2sq2å≈íË
load('minimum_n_1017.mat');
glomeruli_name ={'DM6','DM5','DM2','DM1','DM4','VM2','VM7d','VM7v','DA4L','DA2','DL1','DL5','D','DM3','DC2','VA6','DC3','DL4','DA3','DL3','DA1','VA1d','VA1v','VL2a','VL2p','VA5','VM4','VA7L','VA3','VA4','VA7m','VC2','VC1','VM3','VA2','VM1','Dp1m'};
Frequency = mean(Prime,1);
[Frequency_sorted,I] = sort(Frequency,'descend');
glomeruli_name_sorted = categorical(glomeruli_name(I));
glomeruli_name_sorted =reordercats(glomeruli_name_sorted,{'DL1','VM7d','DM6','VL2a','VC2','VC1','VM2','VM3','VA3','VL2p','DM1','DM4','DC3','VA7m','VA1v','DM3','VA7L','DA4L','VA6','VA2','VM1','Dp1m','DM5','DM2','VM7v','DL5','DA1','VA1d','VM4','DA2','D','DC2','DL4','DA3','DL3','VA5','VA4'});

load('frequency_2sq2_8.mat');
Frequency = mean(Prime,1);
bar(glomeruli_name_sorted,Frequency(I)); xlabel('Names of glomeruli','FontSize',18);  ylabel('Freqency of used glomeruli','FontSize',18);
hold on

load('frequency_2sq2_4.mat');
Frequency = mean(Prime,1);
plot(glomeruli_name_sorted,Frequency(I),'Linewidth',1.7);
hold on

load('frequency_2sq2_2.mat');
Frequency = mean(Prime,1);
plot(glomeruli_name_sorted,Frequency(I),'Linewidth',1.7);

load('frequency_2sq2_1.mat');
Frequency = mean(Prime,1);
plot(glomeruli_name_sorted,Frequency(I),'Linewidth',1.7); set(gca,'Fontsize',16);


figure;
load('DxDy.mat'); set(0,'defaultAxesFontSize',18); imagesc(dx,dy,Smallest'); set(gca,'YDir','normal'); xlabel('x-thresehold [\sigmax]'); ylabel('y-thresehold [\sigmay]'); c=colorbar; c.Label.String='Minimum number of glomeruli required'; hold on
plot(2*sqrt(2),2*sqrt(2),'r*','MarkerSize',18)

figure; %8stepå≈íË/DxDyÇïœÇ¶ÇΩ
load('minimum_n_8_t'); plot(((0:(40-8))-8.9+8)*0.595,Smallest,'LineWidth',3.6); hold on
load('minimum_n_8_Dx2Dy2'); plot(((0:(40-8))-8.9+8)*0.595,Smallest,'LineWidth',1.2); hold on
load('minimum_n_8_Dx4Dy4'); plot(((0:(40-8))-8.9+8)*0.595,Smallest,'LineWidth',1.2);
 ylim([0 37]); xlabel('Time from odor onset (s)'); ylabel('Minimum number of glomeruli required'); xline(0,':k');

figure; %DxDyÇÕtåüíËå≈íË/éûä‘ïùÇïœÇ¶ÇΩ
 load('minimum_n_8_t.mat'); plot(((0:(40-8))-8.9+8)*0.595,Smallest,'LineWidth',3); hold on; %st_t+7
load('minimum_n_4_t.mat'); plot(((0:(40-4))-8.9+4)*0.595,Smallest,'LineWidth',1.2);
load('minimum_n_2_t.mat'); plot(((0:(40-2))-8.9+2)*0.595,Smallest,'LineWidth',1.2)
load('minimum_n_1_t.mat'); plot(((0:(40-1))-8.9+1)*0.595,Smallest,'LineWidth',1.2)
ylim([0 37]); xlabel('Time from odor onset (s)'); ylabel('Minimum number of glomeruli required'); xline(0,':k');

 