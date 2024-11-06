%% VAPI METHOD - TOSCANA-EMILIA-MARCHE
% Evaluation of rainfall heights of assigned return period T, procedure:
% zone A = 1; zone B = 2; zone C = 3; zone D = 4; zone E = 5; zone F = 6; zone G = 7.     

clear all
close all
warning('off','all')

%% Loading data and variables 

location = 'Precipitazione a Loiano Renana, Loiano (675 m slm)';
load prpb
load time_int
load tr

% Zone parameter
r      = 0.89;                % -,  Toscana-Emilia-Marche (rep GNDCI-Line 1). 
m_hg   = 70;                  % mm, average daily rainfall                 % modify
m_hh   = 26;                  % mm, average hourly rainfall                % modify
z      = 2;                   % -,  type of zone (B)                       % modify
% mm, hourly rainfall                        
load ('zena-23-24/pluvio/pianoro_24')                                 % modify
pluvio = pianoro_24;          % mm/15min, 

% Savena-oct24 (Pianoro)  % m_hg=65; m_hh=26; z=2
% rain1_1024  = 37.2;      % mm                                              % modify
% rain3_1024  = 86.8;      % mm                                              % modify
% rain6_1024  = 133.2;     % mm                                              % modify
% rain12_1024 = 174;       % mm                                              % modify
% rain24_1024 = 181.2;     % mm                                              % modify
% rain36_1024 = 184;       % mm                                              % modify
% rain48_1024 = 184;       % mm                                              % modify

% Savena-sep24 (Pianoro)  % m_hg=65; m_hh=26; z=2
% rain1_0924  = 16.2;      % mm                                              % modify
% rain3_0924  = 32.2;      % mm                                              % modify
% rain6_0924  = 58;        % mm                                              % modify
% rain12_0924 = 88.8;      % mm                                              % modify
% rain24_0924 = 136.6;     % mm                                              % modify
% rain36_0924 = 159;       % mm                                              % modify
% rain48_0924 = 182.6;     % mm                                              % modify

% Savena-may23 (Pianoro)  % m_hg=65; m_hh=26; z=2
% rain1_0523  = 9.8;       % mm                                              % modify
% rain3_0523  = 27.8;      % mm                                              % modify
% rain6_0523  = 48.6;      % mm                                              % modify
% rain12_0523 = 69.8;      % mm                                              % modify
% rain24_0523 = 125.4;     % mm                                              % modify
% rain36_0523 = 156.6;     % mm                                              % modify
% rain48_0523 = 156.6;     % mm                                              % modify

% Idice-oct24 (Loiano)  % m_hg=65; m_hh=25; z=2
% rain1_1024  = 10.8;      % mm                                              % modify
% rain3_1024  = 28;        % mm                                              % modify
% rain6_1024  = 42.8;      % mm                                              % modify
% rain12_1024 = 68;        % mm                                              % modify
% rain24_1024 = 83.8;      % mm                                              % modify
% rain36_1024 = 86.8;      % mm                                              % modify
% rain48_1024 = 86.8;      % mm                                              % modify

% Idice-sep24 (Loiano)  % m_hg=65; m_hh=25; z=2
% rain1_0924  = 22.4;      % mm                                              % modify
% rain3_0924  = 51.2;      % mm                                              % modify
% rain6_0924  = 77.2;      % mm                                              % modify
% rain12_0924 = 113.4;     % mm                                              % modify
% rain24_0924 = 169;       % mm                                              % modify
% rain36_0924 = 197.4;     % mm                                              % modify
% rain48_0924 = 217.6;     % mm                                              % modify

% Idice-may23 (Loiano)  % m_hg=65; m_hh=25; z=2
% rain1_0523  = 9.8;       % mm                                              % modify
% rain3_0523  = 22.6;      % mm                                              % modify
% rain6_0523  = 41;        % mm                                              % modify
% rain12_0523 = 66.4;      % mm                                              % modify
% rain24_0523 = 112.2;     % mm                                              % modify
% rain36_0523 = 148;       % mm                                              % modify
% rain48_0523 = 148.2;     % mm                                              % modify

% Idice-oct24 (Monte Ceresa)  % m_hg=65; m_hh=25; z=2
% rain1_1024  = 34.2;      % mm                                              % modify
% rain3_1024  = 99.8;      % mm                                              % modify
% rain6_1024  = 127.6;     % mm                                              % modify
% rain12_1024 = 145.4;     % mm                                              % modify
% rain24_1024 = 159.4;     % mm                                              % modify
% rain36_1024 = 162.4;     % mm                                              % modify
% rain48_1024 = 162.6;     % mm                                              % modify

% Idice-sep24 (Monte Ceresa)  % m_hg=65; m_hh=25; z=2
% rain1_0924  = 19;        % mm                                              % modify
% rain3_0924  = 34.2;      % mm                                              % modify
% rain6_0924  = 58.6;      % mm                                              % modify
% rain12_0924 = 97.2;      % mm                                              % modify
% rain24_0924 = 147.4;     % mm                                              % modify
% rain36_0924 = 171.8;     % mm                                              % modify
% rain48_0924 = 199;       % mm                                              % modify

% Idice-may23 (Monte Ceresa)  % m_hg=65; m_hh=25; z=2
% rain1_0523  = 11.4;      % mm                                              % modify
% rain3_0523  = 31.4;      % mm                                              % modify
% rain6_0523  = 53.2;      % mm                                              % modify
% rain12_0523 = 78.2;      % mm                                              % modify
% rain24_0523 = 147.8;     % mm                                              % modify
% rain36_0523 = 182.2;     % mm                                              % modify
% rain48_0523 = 182.2;     % mm                                              % modify

% Idice-oct24 (Casoni di Romagna)  % m_hg=75; m_hh=26; z=2
% rain1_1024  = 17.6;      % mm                                              % modify
% rain3_1024  = 42.4;      % mm                                              % modify
% rain6_1024  = 60.6;      % mm                                              % modify
% rain12_1024 = 81.6;      % mm                                              % modify
% rain24_1024 = 101.2;     % mm                                              % modify
% rain36_1024 = 104.6;     % mm                                              % modify
% rain48_1024 = 104.6;     % mm                                              % modify

% Idice-sep24 (Casoni di Romagna)  % m_hg=75; m_hh=26; z=2
% rain1_0924  = 27.6;      % mm                                              % modify
% rain3_0924  = 71.6;      % mm                                              % modify
% rain6_0924  = 117.8;     % mm                                              % modify
% rain12_0924 = 168.6;     % mm                                              % modify
% rain24_0924 = 239.2;     % mm                                              % modify
% rain36_0924 = 274.4;     % mm                                              % modify
% rain48_0924 = 296.6;     % mm                                              % modify

% Idice-may23 (Casoni di Romagna)  % m_hg=65; m_hh=25; z=2
% rain1_0523  = 11.4;      % mm                                              % modify
% rain3_0523  = 29;        % mm                                              % modify
% rain6_0523  = 49.6;      % mm                                              % modify
% rain12_0523 = 85;        % mm                                              % modify
% rain24_0523 = 154.6;     % mm                                              % modify
% rain36_0523 = 199.8;     % mm                                              % modify
% rain48_0523 = 200.4;     % mm                                              % modify

% Idice-oct24 (Monghidoro)  % m_hg=80; m_hh=26; z=2
% rain1_1024  = 18.5;      % mm                                              % modify
% rain3_1024  = 31.8;      % mm                                              % modify
% rain6_1024  = 53.8;      % mm                                              % modify
% rain12_1024 = 71.3;      % mm                                              % modify
% rain24_1024 = 94.3;      % mm                                              % modify
% rain36_1024 = 97.3;      % mm                                              % modify
% rain48_1024 = 97.3;      % mm                                              % modify
% 
% Idice-sep24 (Monghidoro)  % m_hg=80; m_hh=26; z=2
% rain1_0924  = 17.1;      % mm                                              % modify
% rain3_0924  = 35.4;      % mm                                              % modify
% rain6_0924  = 46.7;      % mm                                              % modify
% rain12_0924 = 83.1;      % mm                                              % modify
% rain24_0924 = 118.9;     % mm                                              % modify
% rain36_0924 = 148.2;     % mm                                              % modify
% rain48_0924 = 166.4;     % mm                                              % modify
% 
% Idice-may23 (Monghidoro)  % m_hg=80; m_hh=26; z=2
% rain1_0523  = 11.7;      % mm                                              % modify
% rain3_0523  = 27.2;      % mm                                              % modify
% rain6_0523  = 51.9;      % mm                                              % modify
% rain12_0523 = 90.1;      % mm                                              % modify
% rain24_0523 = 148.3;     % mm                                              % modify
% rain36_0523 = 190.6;     % mm                                              % modify
% rain48_0523 = 191.2;     % mm                                              % modify

% Idice-oct24 (Loiano Renana)  % m_hg=70; m_hh=26; z=2
% rain1_1024  = 13.4;      % mm                                              % modify
% rain3_1024  = 32;        % mm                                              % modify
% rain6_1024  = 46;        % mm                                              % modify
% rain12_1024 = 65.2;      % mm                                              % modify
% rain24_1024 = 78.4;      % mm                                              % modify
% rain36_1024 = 81;        % mm                                              % modify
% rain48_1024 = 81;        % mm                                              % modify
% 
% Idice-sep24 (Loiano Renana)  % m_hg=70; m_hh=26; z=2
% rain1_0924  = 26.8;      % mm                                              % modify
% rain3_0924  = 67;        % mm                                              % modify
% rain6_0924  = 97.4;      % mm                                              % modify
% rain12_0924 = 136.8;     % mm                                              % modify
% rain24_0924 = 190.6;     % mm                                              % modify
% rain36_0924 = 219.2;     % mm                                              % modify
% rain48_0924 = 238.2;     % mm                                              % modify
% 
% Idice-may23 (Loiano Renana)  % m_hg=70; m_hh=26; z=2
% rain1_0523  = 8.4;       % mm                                              % modify
% rain3_0523  = 22;        % mm                                              % modify
% rain6_0523  = 40.6;      % mm                                              % modify
% rain12_0523 = 56;        % mm                                              % modify
% rain24_0523 = 96;        % mm                                              % modify
% rain36_0523 = 119;       % mm                                              % modify
% rain48_0523 = 119.2;     % mm                                              % modify

% Idice-sep24 (Settefonti)  % m_hg=XX; m_hh=XX; z=2
% rain1_0924  = 9.8;       % mm                                              % modify
% rain3_0924  = 21.1;      % mm                                              % modify
% rain6_0924  = 37;        % mm                                              % modify
% rain12_0924 = 52.9;      % mm                                              % modify
% rain24_0924 = 91.5;      % mm                                              % modify
% rain36_0924 = 114.6;     % mm                                              % modify
% rain48_0924 = 136.1;     % mm                                              % modify

% Idice-may23 (Settefonti)  % m_hg=XX; m_hh=XX; z=2
% rain1_0523  = 13.8;      % mm                                              % modify
% rain3_0523  = 35.2;      % mm                                              % modify
% rain6_0523  = 58.7;      % mm                                              % modify
% rain12_0523 = 83.9;      % mm                                              % modify
% rain24_0523 = 131.3;     % mm                                              % modify
% rain36_0523 = 156.7;     % mm                                              % modify
% rain48_0523 = 156.8;     % mm                                              % modify


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
ms = 9;

% Figure settings
figure(1)
t = tiledlayout(2,1,'TileSpacing','compact','Padding','compact');
nexttile
set(1,'Units','centimeters','Position',[1,1,35,19]);
% yyaxis left
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
% October 2024
b = [0.2, 0.5, 0.8];
g = [1, 1, 0];
a = [1, 0.6, 0.4];
h1_rain1024 = [
    plot(1, rain1_1024,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',b,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off') 
    plot(3, rain3_1024,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',b,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off')
    plot(6, rain6_1024,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',b,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off') 
    plot(12, rain12_1024,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',b,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off') 
    plot(24, rain24_1024,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',b,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off')
    plot(36, rain36_1024,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',b,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off') 
    plot(48, rain48_1024,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',b,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off') 
];
% September 2024
h1_rain0924 = [
    plot(1,  rain1_0924,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',a,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off')
    plot(3,  rain3_0924,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',a,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off') 
    plot(6,  rain6_0924,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',a,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off') 
    plot(12, rain12_0924,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',a,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off') 
    plot(24, rain24_0924,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',a,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off') 
    plot(36, rain36_0924,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',a,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off') 
    plot(48, rain48_0924,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',a,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off') 
]; 
% May 2023
h1_rain0523 = [
    plot(1,  rain1_0523,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',g,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off')
    plot(3,  rain3_0523,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',g,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off') 
    plot(6,  rain6_0523,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',g,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off') 
    plot(12, rain12_0523,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',g,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off') 
    plot(24, rain24_0523,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',g,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off') 
    plot(36, rain36_0523,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',g,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off') 
    plot(48, rain48_0523,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',g,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off') 
]; 
vxt = minx:6:maxx;
vyt = miny:50:maxy;
set(gca,'xtick',vxt,'ytick',vyt,'XMinorTick','on','YMinorTick','on');
axis([minx maxx miny maxy]);
ylabel(sprintf('altezza, h (mm)'));
grid on
set(gca,'PlotBoxAspectRatio',[5 3 1],'FontSize',sf,'Ticklength',[0.015 0.00]);
ax = gca;
ax.LineWidth = 1.3; 
set(ax, 'GridLineStyle', '-'); 
ax.GridColor = [0.5, 0.5, 0.5];
ax.Layer = 'top';

nexttile
miny = 0;
maxy = 100;
set(gca,'FontSize',sf,'Box','on');
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
% Ottobre 2024
h2_rain1024 = [
    plot(1, rain1_1024/1,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',b,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off') 
    plot(3, rain3_1024/3,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',b,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off')
    plot(6, rain6_1024/6,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',b,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off') 
    plot(12, rain12_1024/12,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',b,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off') 
    plot(24, rain24_1024/24,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',b,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off')
    plot(36, rain36_1024/36,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',b,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off') 
    plot(48, rain48_1024/48,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',b,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off') 
];
% September 2024
h2_rain0924 = [
    plot(1,  rain1_0924/1,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',a,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off')
    plot(3,  rain3_0924/3,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',a,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off') 
    plot(6,  rain6_0924/6,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',a,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off') 
    plot(12, rain12_0924/12,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',a,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off') 
    plot(24, rain24_0924/24,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',a,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off') 
    plot(36, rain36_0924/36,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',a,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off') 
    plot(48, rain48_0924/48,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',a,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off') 
]; 
% May 2023
h2_rain0523 = [
    plot(1,  rain1_0523/1,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',g,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off')
    plot(3,  rain3_0523/3,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',g,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off') 
    plot(6,  rain6_0523/6,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',g,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off') 
    plot(12, rain12_0523/12,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',g,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off') 
    plot(24, rain24_0523/24,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',g,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off') 
    plot(36, rain36_0523/36,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',g,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off') 
    plot(48, rain48_0523/48,'LineWidth',mw,'LineStyle','none','Marker','o','MarkerFaceColor',g,'MarkerEdgeColor','k','MarkerSize',ms,'Clipping','off') 
];
vxt = minx:6:maxx;
vyt = miny:10:maxy;
set(gca,'xtick',vxt,'ytick',vyt,'XMinorTick','on','YMinorTick','on');
axis([minx maxx miny maxy]);
ylabel(sprintf('intensità, i (mm h^{-1})'));
xlabel('durata, d (h)');
lgd = legend([h1; h1_rain0523(1); h1_rain0924(1); h1_rain1024(1)],'T = 5 anni','T = 10 anni','T = 20 anni','T = 50 anni','T = 100 anni','T = 200 anni','T = 500 anni','T = 1000 anni','16-17 maggio 2023','17-19 settembre 2024','19-20 ottobre 2024','Location','bestoutside','NumColumns',1);
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
