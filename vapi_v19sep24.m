%% VAPI METHOD - TOSCANA-EMILIA-MARCHE
% Evaluation of rainfall heights of assigned return period T, procedure:
% zone A = 1; zone B = 2; zone C = 3; zone D = 4; zone E = 5; zone F = 6; zone G = 7.     

clear all
close all
warning('off','all')

%% Loading data and variables 

location = 'Precipitation at Bologna-Ruffillo (90 m slm), Savena River Drainage Basin';
load prpb
load time_int
load tr

% Zone parameter
r      = 0.89;                % -,  Toscana-Emilia-Marche (rep GNDCI-Line 1). 
m_hg   = 60;                  % mm, average daily rainfall                 % modify
m_hh   = 25;                  % mm, average hourly rainfall                % modify
z      = 5;                   % -,  type of zone                           % modify
load ('zena-24/pluvio_rh2')     % mm, hourly rainfall                        % modify
pluvio = pluvio_rh2;            % mm/15min, 

% Modena-24 (Urbana)  % m_hg=65; m_hh=24; z=5
% rain1_24  = 11;         % mm                                              % modify
% rain3_24  = 25.2;       % mm                                              % modify
% rain6_24  = 46;         % mm                                              % modify
% rain12_24 = 67.4;       % mm                                              % modify
% rain24_24 = 77;         % mm                                              % modify
% rain36_24 = 77;         % mm                                              % modify
% rain48_24 = 77;         % mm                                              % modify

% Savena-24 (Pianoro)  % m_hg=65; m_hh=26; z=5
% rain1_24  = 37.2;      % mm                                              % modify
% rain3_24  = 86.8;      % mm                                              % modify
% rain6_24  = 133.2;     % mm                                              % modify
% rain12_24 = 174;       % mm                                              % modify
% rain24_24 = 181.2;     % mm                                              % modify
% rain36_24 = 184;       % mm                                              % modify
% rain48_24 = 184;       % mm                                              % modify

% Savena-24 (Pianoro)  % m_hg=65; m_hh=26; z=5
% rain1_23  = 9.8;       % mm                                              % modify
% rain3_23  = 27.8;      % mm                                              % modify
% rain6_23  = 48.6;      % mm                                              % modify
% rain12_23 = 69.8;      % mm                                              % modify
% rain24_23 = 125.4;     % mm                                              % modify
% rain36_23 = 156.6;     % mm                                              % modify
% rain48_23 = 156.6;     % mm                                              % modify

% Savena-23 (Bologna San Ruffillo)  % m_hg=60; m_hh=25
rain1_23  = 11.4;        % mm                                              % modify
rain3_23  = 32.2;      % mm                                              % modify
rain6_23  = 52.8;     % mm                                              % modify
rain12_23 = 68;     % mm                                              % modify
rain24_23 = 112.2;     % mm                                              % modify
rain36_23 = 133;     % mm                                              % modify
rain48_23 = 133;     % mm                                              % modify

% Savena-24 (Bologna San Ruffillo)  % m_hg=60; m_hh=25
rain1_24  = 34;        % mm                                              % modify
rain3_24  = 77.2;      % mm                                              % modify
rain6_24  = 108.6;     % mm                                              % modify
rain12_24 = 139.6;     % mm                                              % modify
rain24_24 = 159.4;     % mm                                              % modify
rain36_24 = 161.8;     % mm                                              % modify
rain48_24 = 161.8;     % mm                                              % modify

% Senio-24 (Palazzuolo sul Senio)  % m_hg = 75
% rain1_24  = 24.8;      % mm                                              % modify
% rain3_24  = 38.6;      % mm                                              % modify
% rain6_24  = 56;        % mm                                              % modify
% rain12_24 = 89.6;      % mm                                              % modify
% rain24_24 = 134.2;     % mm                                              % modify
% rain36_24 = 180.4;     % mm                                              % modify
% rain48_24 = 197;       % mm    

% Senio-24 (Valsenio)          % m_hg = 70
% rain1_24  = 34.2;    % mm                                                % modify
% rain3_24  = 71.4;    % mm                                                % modify
% rain6_24  = 114.4;   % mm                                                % modify
% rain12_24 = 192.6;   % mm                                                % modify
% rain24_24 = 252.6;   % mm                                                % modify
% rain36_24 = 297.4;   % mm                                                % modify
% rain48_24 = 319.8;   % mm                                                % modify

% Marradi-24 (Lamone)          % m_hg = 75
% rain1_24  = 12.8;    % mm                                                % modify
% rain3_24  = 18;      % mm                                                % modify
% rain6_24  = 39.8;    % mm                                                % modify
% rain12_24 = 76.2;    % mm                                                % modify
% rain24_24 = 128.4;   % mm                                                % modify
% rain36_24 = 172;     % mm                                                % modify
% rain48_24 = 181.4;   % mm                                                % modify

% Santerno-24 (Castel del Rio) % m_hg = 65
% rain1_24  = 25.4;                                                        % modify
% rain3_24  = 63.6;    % mm                                                % modify
% rain6_24  = 100.4;   % mm                                                % modify
% rain12_24 = 148.8;   % mm                                                % modify
% rain24_24 = 211;     % mm                                                % modify
% rain36_24 = 257.6;   % mm                                                % modify
% rain48_24 = 275.4;   % mm                                                % modify

% Santerno-24 (Firenzuola)     % m_hg = 60
% rain1_24  = 7.8;     % mm                                                % modify
% rain3_24  = 19.4;    % mm                                                % modify
% rain6_24  = 34.6;    % mm                                                % modify
% rain12_24 = 60.2;    % mm                                                % modify
% rain24_24 = 77.8;    % mm                                                % modify
% rain36_24 = 108.4;   % mm                                                % modify
% rain48_24 = 119.2;   % mm 

% Lamone-24 (San Cassiano)     % m_hg = 75
% rain1_24  = 51.8;    % mm                                                % modify
% rain3_24  = 120;     % mm                                                % modify
% rain6_24  = 166.4;   % mm                                                % modify
% rain12_24 = 223.8;   % mm                                                % modify
% rain24_24 = 288.2;   % mm                                                % modify
% rain36_24 = 334.8;   % mm                                                % modify
% rain48_24 = 364.2;   % mm                                                % modify

% Corinaldo-14 (Misa)          % m_hg = 60
% rain1_14  = 26.2;    % mm                                                % modify
% rain3_14  = 47.8;    % mm                                                % modify
% rain6_14  = 68.4;    % mm                                                % modify
% rain12_14 = 83;      % mm                                                % modify
% rain24_14 = 90.6;    % mm                                                % modify
% rain36_14 = 96.8;    % mm                                                % modify
% rain48_14 = 101.4;   % mm                                                % modify

% Barbara-14 (Misa)          % m_hg = 60
% rain1_14  = 22.2;    % mm                                                % modify
% rain3_14  = 44;      % mm                                                % modify
% rain6_14  = 63;      % mm                                                % modify
% rain12_14 = 71.4;    % mm                                                % modify
% rain24_14 = 80.6;    % mm                                                % modify
% rain36_14 = 84.8;    % mm                                                % modify
% rain48_14 = 87.2;    % mm                                                % modify

% Arcevia-14 (Misa)          % m_hg = 65
% rain1_14  = 11.6;    % mm                                                % modify
% rain3_14  = 16.8;    % mm                                                % modify
% rain6_14  = 17.6;    % mm                                                % modify
% rain12_14 = 20.8;    % mm                                                % modify
% rain24_14 = 32.8;    % mm                                                % modify
% rain36_14 = 43.8;    % mm                                                % modify
% rain48_14 = 47.8;    % mm                                                % modify

% Arcevia-22 (Misa)          % m_hg = 65
% rain1_22  = 47;      % mm                                                % modify
% rain3_22  = 94.8;    % mm                                                % modify
% rain6_22  = 117.8;   % mm                                                % modify
% rain12_22 = 128.8;   % mm                                                % modify
% rain24_22 = 129.2;   % mm                                                % modify
% rain36_22 = 129.4;   % mm                                                % modify
% rain48_22 = 138.8;   % mm                                                % modify

% Senigallia-14 (Misa)       % m_hg = ??
% rain1_14  = 22.2;    % mm                                                % modify
% rain3_14  = 44;      % mm                                                % modify
% rain6_14  = 63;      % mm                                                % modify
% rain12_14 = 71.4;    % mm                                                % modify
% rain24_14 = 80.6;    % mm                                                % modify
% rain36_14 = 84.8;    % mm                                                % modify
% rain48_14 = 87.2;    % mm                                                % modify

% Cantiano-22 (Metauro)   % m_hg = 65
% rain1_22  = 101.4;    % mm                                                % modify
% rain3_22  = 256.6;      % mm                                              % modify
% rain6_22  = 384;      % mm                                                % modify
% rain12_22 = 419;    % mm                                                  % modify
% rain24_22 = 419;    % mm                                                  % modify
% rain36_22 = 420.6;    % mm                                                % modify
% rain48_22 = 420.6;    % mm                                                % modify

%% Programming

for i = 1:7:length(prpb)
    zone(:,:,i) = prpb(i:(i+6),:);        % R³ matrix with 7 layer of zone
end
zone = zone(:,:,1:7:length(prpb));
n = (log(m_hg)-log(m_hh)-log(r))/log(24);
for i = 1:length(time_int)
    m_hd(i) = m_hh*(time_int(i)^n);
end
for i = 1:length(zone)                                                               
    for j = 1:length(tr)
        for k = z
            T = @(x) (1/(1-exp(-zone(i,3,k)*exp(-x*zone(i,4,k))-zone(i,1,k)*zone(i,3,k)^(1/zone(i,2,k))*exp((-x*zone(i,4,k))/zone(i,2,k)))))-tr(j);
            kt(i,j) = fzero(T,0);
        end
    end
end
kt = kt(1:length(zone), 1:length(tr))';                                              
ht = kt.*m_hd;
a = (sum(log(time_int)'.^2)*sum(log(ht)')-sum(log(time_int)')*sum(log(time_int)'.*log(ht)'))/(length(time_int)*sum(log(time_int)'.^2)-sum(log(time_int)')^2);
b = (length(time_int)*sum(log(time_int)'.*log(ht)')-sum(log(time_int)')*sum(log(ht)'))/(length(time_int)*sum(log(time_int)'.^2)-sum(log(time_int)')^2);
at = exp(a);
for i = 1:length(at)
    for j = 1:length(time_int)
        ht_d(i,j) = at(i)*(time_int(j)^b(i));
        it_d(i,j) = at(i)*(time_int(j)^(b(i)-1)); 
    end
end

%% Plots

% Date settings
lw = 0.75;
mw = 0.75;
minx = min(time_int)-1;  
maxx = max(time_int)+1;
miny = 0;
maxy = round(max(max(ht_d)),-2)+100;
sf = 15;
ms = 8;

% Figure settings
figure(1)
t = tiledlayout(2,1,'TileSpacing','compact','Padding','compact');
nexttile
set(1,'Units','centimeters','Position',[1,1,35,19]);
yyaxis right
set(gca, 'YColor', 'k');
h1 = plot(time_int,ht_d,'LineWidth',3*lw); hold on
for i = 1:8
    h1(i).LineStyle = '-';
    h1(i).Marker = 'none';
end
h1(1).Color = '#0072BD';
h1(2).Color = '#D95319';
h1(3).Color = '#EDB120';
h1(4).Color = '#7E2F8E';
h1(5).Color = '#77AC30';
h1(6).Color = '#4DBEEE';
h1(7).Color = '#A2142F';
h1(8).Color = '#FFB6C1';
% Romagna 2023
g = [0.45, 0.45, 0.45];
h1_rain23 = [
    plot(1, rain1_23,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',g,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off') 
    plot(3, rain3_23,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',g,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off')
    plot(6, rain6_23,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',g,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off') 
    plot(12, rain12_23,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',g,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off') 
    plot(24, rain24_23,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',g,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off')
    plot(36, rain36_23,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',g,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off') 
    plot(48, rain48_23,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',g,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off') 
];
% Marche 2022
h1_rain = [
    plot(1,  rain1_24,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor','y','MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off')
    plot(3,  rain3_24,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor','y','MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off') 
    plot(6,  rain6_24,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor','y','MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off') 
    plot(12, rain12_24,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor','y','MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off') 
    plot(24, rain24_24,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor','y','MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off') 
    plot(36, rain36_24,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor','y','MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off') 
    plot(48, rain48_24,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor','y','MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off') 
]; 
vxt = minx:6:maxx;
vyt = miny:50:maxy;
set(gca,'xtick',vxt,'ytick',vyt,'XMinorTick','on','YMinorTick','on');
axis([minx maxx miny maxy]);
ylabel(sprintf('depth, h (mm)'));
yyaxis left
set(gca, 'YColor', 'k');  
ylim([0 50]);
h2 = bar([0:0.25:47.75], pluvio, 'hist');
h2.FaceColor = [0.9, 0.9, 0.9];
h2.EdgeColor = [0.85, 0.85, 0.85];
vyt = miny:10:maxy;
set(gca,'xtick',vxt,'ytick',vyt,'XMinorTick','on','YMinorTick','on');
ylabel(sprintf('intensity, i (mm h^{-1})'), 'Color', 'k');
% lgd = legend([h1; h1_rain23(1); h2; h1_rain24(1)],'T = 5 y','T = 10 y','T = 20 y','T = 50 y','T = 100 y','T = 200 y','T = 500 y','T = 1000 y','2023, h','2024, i','2024, h','Location','bestoutside','NumColumns',1);
% lgd = legend([h1; h2; h1_rain14(1)],'T = 5 y','T = 10 y','T = 20 y','T = 50 y','T = 100 y','T = 200 y','T = 500 y','T = 1000 y','2014, i','2014, h','Location','bestoutside','NumColumns',1);
% legend('boxon')
% lgd.Layout.Tile = 'east';
grid on
set(gca,'PlotBoxAspectRatio',[5 3 1],'FontSize',sf,'Ticklength',[0.015 0.00]);
ax = gca;
ax.LineWidth = 1.3; 
set(ax, 'GridLineStyle', '-'); 
ax.GridColor = [0.5, 0.5, 0.5];
ax.Layer = 'top';

nexttile
miny = 0;
maxy = 150;
set(gca,'FontSize',sf,'Box','on');
yyaxis left
set(gca, 'YColor', 'k');
h3 = plot(time_int,it_d,'LineWidth',3*lw); hold on
for i = 1:8
    h3(i).LineStyle = '-';
    h3(i).Marker = 'none';
end
h3(1).Color = '#0072BD';
h3(2).Color = '#D95319';
h3(3).Color = '#EDB120';
h3(4).Color = '#7E2F8E';
h3(5).Color = '#77AC30';
h3(6).Color = '#4DBEEE';
h3(7).Color = '#A2142F';
h3(8).Color = '#FFB6C1';
% Romagna 2023
g = [0.45, 0.45, 0.45];
h2_rain23 = [
    plot(1, rain1_23/1,'LineWidth',lw,'LineStyle','none','Marker','o','MarkerFaceColor','m','MarkerEdgeColor','k','MarkerSize',ms)
    plot(3, rain3_23/3,'LineWidth',lw,'LineStyle','none','Marker','o','MarkerFaceColor','m','MarkerEdgeColor','k','MarkerSize',ms)
    plot(6, rain6_23/6,'LineWidth',lw,'LineStyle','none','Marker','o','MarkerFaceColor','m','MarkerEdgeColor','k','MarkerSize',ms)
    plot(12, rain12_23/12,'LineWidth',lw,'LineStyle','none','Marker','o','MarkerFaceColor','m','MarkerEdgeColor','k','MarkerSize',ms)
    plot(24, rain24_23/24,'LineWidth',lw,'LineStyle','none','Marker','o','MarkerFaceColor','m','MarkerEdgeColor','k','MarkerSize',ms)
    plot(48, rain48_23/48,'LineWidth',lw,'LineStyle','none','Marker','o','MarkerFaceColor','m','MarkerEdgeColor','k','MarkerSize',ms)
];
% Marche 2022
h2_rain = [
    plot(1,  rain1_24/1,'LineWidth',lw,'LineStyle','none','Marker','o','MarkerFaceColor','g','MarkerEdgeColor','k','MarkerSize',ms)
    plot(3,  rain3_24/3,'LineWidth',lw,'LineStyle','none','Marker','o','MarkerFaceColor','g','MarkerEdgeColor','k','MarkerSize',ms)
    plot(6,  rain6_24/6,'LineWidth',lw,'LineStyle','none','Marker','o','MarkerFaceColor','g','MarkerEdgeColor','k','MarkerSize',ms)
    plot(12, rain12_24/12,'LineWidth',lw,'LineStyle','none','Marker','o','MarkerFaceColor','g','MarkerEdgeColor','k','MarkerSize',ms)
    plot(24, rain24_24/24,'LineWidth',lw,'LineStyle','none','Marker','o','MarkerFaceColor','g','MarkerEdgeColor','k','MarkerSize',ms)
    plot(36, rain36_24/36,'LineWidth',lw,'LineStyle','none','Marker','o','MarkerFaceColor','g','MarkerEdgeColor','k','MarkerSize',ms)
    plot(48, rain48_24/48,'LineWidth',lw,'LineStyle','none','Marker','o','MarkerFaceColor','g','MarkerEdgeColor','k','MarkerSize',ms)
];
vxt = minx:6:maxx;
vyt = miny:30:maxy;
set(gca,'xtick',vxt,'ytick',vyt,'XMinorTick','on','YMinorTick','on');
axis([minx maxx miny maxy]);
ylabel(sprintf('intensity, i (mm h^{-1})'));
xlabel('duration, d (h)');
yyaxis right
set(gca, 'YColor', 'k', 'YDir', 'reverse');   
ylim([0 50]);
h4 = bar([0:0.25:47.75], pluvio, 'hist');
h4.FaceColor = [0.9, 0.9, 0.9];
h4.EdgeColor = [0.85, 0.85, 0.85];
vyt = miny:10:maxy;
set(gca,'xtick',vxt,'ytick',vyt,'XMinorTick','on','YMinorTick','on');
ylabel(sprintf('intensity, i (mm h^{-1})'), 'Color', 'k');
lgd = legend([h1; h1_rain23(1); h4; h1_rain(1); h2_rain23(1); h2_rain(1)],'T = 5 y','T = 10 y','T = 20 y','T = 50 y','T = 100 y','T = 200 y','T = 500 y','T = 1000 y','2023, h','2024, i','2024, h','2023, i','2024, i','Location','bestoutside','NumColumns',1);
% lgd = legend([h1; h2; h1_rain(1); h2_rain(1)],'T = 5 y','T = 10 y','T = 20 y','T = 50 y','T = 100 y','T = 200 y','T = 500 y','T = 1000 y','2024, i','2024, h','2024, i','Location','bestoutside','NumColumns',1);
% legend('boxon')
% lgd.Layout.Tile = 'east';
grid on
set(gca,'PlotBoxAspectRatio',[5 3 1],'FontSize',sf,'Ticklength',[0.015 0.00],'LineWidth',1.5);
sgtitle(location,'Color','k','FontSize',sf,'FontWeight','normal');
ax = gca;
ax.LineWidth = 1.25; 
set(ax, 'GridLineStyle', '-','Layer','top'); 
ax.GridColor = [0.5, 0.5, 0.5];

orient(figure(1),'landscape')
saveas(1,'fig','svg')
system('inkscape --export-filename=FIG_vapi_ink.pdf fig.svg')
system('rm fig.svg')
system('pdfcrop FIG_vapi_ink.pdf FIG_vapi.pdf')
system('rm FIG_vapi_ink.pdf')
