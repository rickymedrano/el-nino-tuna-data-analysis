%Tuna Caught Against Different ENSO Periods
clc; clear all; close all;
tic
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%       DEFINING THE DATA      %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Read in MEI data
MEI = csvread('mei.csv');
MEI = transpose(MEI);
MEI = MEI(:);

%Split MEI data into quantiles. First find appropriate cutoff values to 
%bin the data. Get bin counts and setup appropriately sized vectors to hold 
%corresponding MEI values based on defined quantiles
quantiledMEI = quantile(MEI, [0.0, 0.10, 0.35, 0.65, 0.90, 1.0]);
h = histogram(MEI, quantiledMEI,'FaceColor',[0.4706 0.6706 0.1882],...
    'LineStyle','-.','LineWidth',2,'EdgeColor', [0.2196 0.3608 0.0235]);
title('Quantiled MEI Data - [0%-10%][11%-35%][36%-65%][66%-90%][91%-100%]',...
    'FontSize',24);
xlabel('Standard Departure','FontSize',20);
ylabel('Number of MEI values','FontSize',20);
binCountsMEI = h.BinCounts;
strongNino = zeros(1,binCountsMEI(1));
weakNino = zeros(1,binCountsMEI(2));
laNada = zeros(1,binCountsMEI(3));
weakNina = zeros(1,binCountsMEI(4));
strongNina = zeros(1,binCountsMEI(5));

%Sort the MEI data into the corresponding quantiled binned vectors
[j, k, l, m, n] = deal(1);
for i=1:length(MEI)
    if MEI(i)>=quantiledMEI(1) && MEI(i)<=quantiledMEI(2)
        strongNina(j) = MEI(i);
        j = j + 1;
    elseif MEI(i)>quantiledMEI(2) && MEI(i)<=quantiledMEI(3)
        weakNina(k) = MEI(i);
        k = k + 1;
    elseif MEI(i)>quantiledMEI(3) && MEI(i)<=quantiledMEI(4)
        laNada(l) = MEI(i);
        l = l + 1;
    elseif MEI(i)>quantiledMEI(4) && MEI(i)<=quantiledMEI(5)
        weakNino(m) = MEI(i);
        m = m + 1;
    elseif MEI(i)>quantiledMEI(5) && MEI(i)<=quantiledMEI(6)
        strongNino(n) = MEI(i);
        n = n + 1;
    end
end

%Set up vectors to hold cumulative fish counts from ALL the ports
strongNinoCatchesAll = zeros(1,length(strongNino));
strongNinaCatchesAll = zeros(1,length(strongNina));
weakNinoCatchesAll = zeros(1,length(weakNino));
weakNinaCatchesAll = zeros(1,length(weakNina));
laNadaCatchesAll = zeros(1,length(laNada));

%Set up vectors to hold fish counts for EACH port
strongNinoCatchesSD = zeros(1,length(strongNino));
strongNinaCatchesSD = zeros(1,length(strongNina));
weakNinoCatchesSD = zeros(1,length(weakNino));
weakNinaCatchesSD = zeros(1,length(weakNina));
laNadaCatchesSD = zeros(1,length(laNada));
strongNinoCatchesLA = zeros(1,length(strongNino));
strongNinaCatchesLA = zeros(1,length(strongNina));
weakNinoCatchesLA = zeros(1,length(weakNino));
weakNinaCatchesLA = zeros(1,length(weakNina));
laNadaCatchesLA = zeros(1,length(laNada));
strongNinoCatchesSB = zeros(1,length(strongNino));
strongNinaCatchesSB = zeros(1,length(strongNina));
weakNinoCatchesSB = zeros(1,length(weakNino));
weakNinaCatchesSB = zeros(1,length(weakNina));
laNadaCatchesSB = zeros(1,length(laNada));
strongNinoCatchesMonterey = zeros(1,length(strongNino));
strongNinaCatchesMonterey = zeros(1,length(strongNina));
weakNinoCatchesMonterey = zeros(1,length(weakNino));
weakNinaCatchesMonterey = zeros(1,length(weakNina));
laNadaCatchesMonterey = zeros(1,length(laNada));
strongNinoCatchesSF = zeros(1,length(strongNino));
strongNinaCatchesSF = zeros(1,length(strongNina));
weakNinoCatchesSF = zeros(1,length(weakNino));
weakNinaCatchesSF = zeros(1,length(weakNina));
laNadaCatchesSF = zeros(1,length(laNada));
strongNinoCatchesEureka = zeros(1,length(strongNino));
strongNinaCatchesEureka = zeros(1,length(strongNina));
weakNinoCatchesEureka = zeros(1,length(weakNino));
weakNinaCatchesEureka = zeros(1,length(weakNina));
laNadaCatchesEureka = zeros(1,length(laNada));

%Read in cumulative Tuna data for ALL 6 ports
tunaDataAll = xlsread('TunaData.xlsx', 'All', 'D1:D636');
tunaDataSD = xlsread('TunaData.xlsx', 'SD', 'D1:D636');
tunaDataLA = xlsread('TunaData.xlsx', 'LA', 'D1:D636');
tunaDataSB = xlsread('TunaData.xlsx', 'SB', 'D1:D636');
tunaDataMonterey = xlsread('TunaData.xlsx', 'Monterey', 'D1:D636');
tunaDataSF = xlsread('TunaData.xlsx', 'SF', 'D1:D636');
tunaDataEureka = xlsread('TunaData.xlsx', 'Eureka', 'D1:D636');

%Sort the tuna counts into vectors for Strong and Weak El Nino/La Nina for
%ALL 6 ports
for i=1:length(strongNino)
    meiIndexStrongNino = find(MEI==(strongNino(i)));
    meiIndexStrongNina = find(MEI==(strongNina(i)));
    strongNinoCatchesAll(i) = tunaDataAll(meiIndexStrongNino);
    strongNinaCatchesAll(i) = tunaDataAll(meiIndexStrongNina);
    strongNinoCatchesSD(i) = tunaDataSD(meiIndexStrongNino);
    strongNinaCatchesSD(i) = tunaDataSD(meiIndexStrongNina);
    strongNinoCatchesLA(i) = tunaDataLA(meiIndexStrongNino);
    strongNinaCatchesLA(i) = tunaDataLA(meiIndexStrongNina);
    strongNinoCatchesSB(i) = tunaDataSB(meiIndexStrongNino);
    strongNinaCatchesSB(i) = tunaDataSB(meiIndexStrongNina);
    strongNinoCatchesMonterey(i) = tunaDataMonterey(meiIndexStrongNino);
    strongNinaCatchesMonterey(i) = tunaDataMonterey(meiIndexStrongNina);
    strongNinoCatchesSF(i) = tunaDataSF(meiIndexStrongNino);
    strongNinaCatchesSF(i) = tunaDataSF(meiIndexStrongNina);
    strongNinoCatchesEureka(i) = tunaDataEureka(meiIndexStrongNino);
    strongNinaCatchesEureka(i) = tunaDataEureka(meiIndexStrongNina);
end
for i=1:length(weakNino)
    meiIndexWeakNino = find(MEI==(weakNino(i)));
    meiIndexWeakNina = find(MEI==(weakNina(i)));
    weakNinoCatchesAll(i) = tunaDataAll(meiIndexWeakNino);
    weakNinaCatchesAll(i) = tunaDataAll(meiIndexWeakNina);
    weakNinoCatchesSD(i) = tunaDataSD(meiIndexWeakNino);
    weakNinaCatchesSD(i) = tunaDataSD(meiIndexWeakNina);
    weakNinoCatchesLA(i) = tunaDataLA(meiIndexWeakNino);
    weakNinaCatchesLA(i) = tunaDataLA(meiIndexWeakNina);
    weakNinoCatchesSB(i) = tunaDataSB(meiIndexWeakNino);
    weakNinaCatchesSB(i) = tunaDataSB(meiIndexWeakNina);
    weakNinoCatchesMonterey(i) = tunaDataMonterey(meiIndexWeakNino);
    weakNinaCatchesMonterey(i) = tunaDataMonterey(meiIndexWeakNina);
    weakNinoCatchesSF(i) = tunaDataSF(meiIndexWeakNino);
    weakNinaCatchesSF(i) = tunaDataSF(meiIndexWeakNina);
    weakNinoCatchesEureka(i) = tunaDataEureka(meiIndexWeakNino);
    weakNinaCatchesEureka(i) = tunaDataEureka(meiIndexWeakNina);
end

%Sort the tuna counts into a vector for La Nada for ALL 6 ports
for i=1:length(laNada)
    meiIndexLaNada = find(MEI==(laNada(i)));
    laNadaCatchesAll(i) = tunaDataAll(meiIndexLaNada);
    laNadaCatchesSD(i) = tunaDataSD(meiIndexLaNada);
    laNadaCatchesLA(i) = tunaDataLA(meiIndexLaNada);
    laNadaCatchesSB(i) = tunaDataSB(meiIndexLaNada);
    laNadaCatchesMonterey(i) = tunaDataMonterey(meiIndexLaNada);
    laNadaCatchesSF(i) = tunaDataSF(meiIndexLaNada);
    laNadaCatchesEureka(i) = tunaDataEureka(meiIndexLaNada);
end

%Summing totals for tuna catches from ALL ports
sumStrongNinoCatchesAll = sum(strongNinoCatchesAll);
sumStrongNinaCatchesAll = sum(strongNinaCatchesAll);
sumWeakNinoCatchesAll = sum(weakNinoCatchesAll);
sumWeakNinaCatchesAll = sum(weakNinaCatchesAll);
sumLaNadaCatchesAll = sum(laNadaCatchesAll);

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%            STATS            %%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Testing for normal distribution, and attemping data transforms
histogram(strongNinoCatchesAll,10);
[h,p] = adtest(strongNinoCatches)
normplot(strongNinoCatches);
transformed = nthroot(strongNinoCatchesAll+.5,2);
histogram(transformed,10);
[h,p] = adtest(transformed)

%Wilcoxon tests on paired and independent data on ALL Ports
[pStrong,hStrong] = signrank(strongNinoCatchesAll, strongNinaCatchesAll)
[pWeak,hWeak] = signrank(weakNinoCatchesAll, weakNinaCatchesAll)
[pNadaStrongNino,hNadaStrongNino] = ranksum(laNadaCatchesAll, strongNinoCatchesAll)
[pNadaWeakNino,hNadaWeakNino] = ranksum(laNadaCatchesAll, weakNinoCatchesAll)
[pNadaStrongNina,hNadaStrongNina] = ranksum(laNadaCatchesAll, strongNinaCatchesAll)
[pNadaWeakNina,hNadaWeakNina] = ranksum(laNadaCatchesAll, weakNinaCatchesAll)
[pStrongNinoWeakNina,hStrongNinoWeakNina] = ranksum(strongNinoCatchesAll, weakNinaCatchesAll)
[pStrongNinaWeakNino,hStrongNinaWeakNino] = ranksum(strongNinaCatchesAll, weakNinoCatchesAll)

% %Wilcoxon tests on paired and independent data in San Diego
[pStrong,hStrong] = signrank(strongNinoCatchesSD, strongNinaCatchesSD)
[pWeak,hWeak] = signrank(weakNinoCatchesSD, weakNinaCatchesSD)
[pNadaStrongNino,hNadaStrongNino] = ranksum(laNadaCatchesSD, strongNinoCatchesSD)
[pNadaWeakNino,hNadaWeakNino] = ranksum(laNadaCatchesSD, weakNinoCatchesSD)
[pNadaStrongNina,hNadaStrongNina] = ranksum(laNadaCatchesSD, strongNinaCatchesSD)
[pNadaWeakNina,hNadaWeakNina] = ranksum(laNadaCatchesSD, weakNinaCatchesSD)

% %Wilcoxon tests on paired and independent data in Los Angeles
[pStrong,hStrong] = signrank(strongNinoCatchesLA, strongNinaCatchesLA)
[pWeak,hWeak] = signrank(weakNinoCatchesLA, weakNinaCatchesLA)
[pNadaStrongNino,hNadaStrongNino] = ranksum(laNadaCatchesLA, strongNinoCatchesLA)
[pNadaWeakNino,hNadaWeakNino] = ranksum(laNadaCatchesLA, weakNinoCatchesLA)
[pNadaStrongNina,hNadaStrongNina] = ranksum(laNadaCatchesLA, strongNinaCatchesLA)
[pNadaWeakNina,hNadaWeakNina] = ranksum(laNadaCatchesLA, weakNinaCatchesLA)

% %Wilcoxon tests on paired and independent data in Santa Barbara
[pStrong,hStrong] = signrank(strongNinoCatchesSB, strongNinaCatchesSB)
[pWeak,hWeak] = signrank(weakNinoCatchesSB, weakNinaCatchesSB)
[pNadaStrongNino,hNadaStrongNino] = ranksum(laNadaCatchesSB, strongNinoCatchesSB)
[pNadaWeakNino,hNadaWeakNino] = ranksum(laNadaCatchesSB, weakNinoCatchesSB)
[pNadaStrongNina,hNadaStrongNina] = ranksum(laNadaCatchesSB, strongNinaCatchesSB)
[pNadaWeakNina,hNadaWeakNina] = ranksum(laNadaCatchesSB, weakNinaCatchesSB)

% %Wilcoxon tests on paired and independent data in Monterey
[pStrong,hStrong] = signrank(strongNinoCatchesMonterey, strongNinaCatchesMonterey)
[pWeak,hWeak] = signrank(weakNinoCatchesMonterey, weakNinaCatchesMonterey)
[pNadaStrongNino,hNadaStrongNino] = ranksum(laNadaCatchesMonterey, strongNinoCatchesMonterey)
[pNadaWeakNino,hNadaWeakNino] = ranksum(laNadaCatchesMonterey, weakNinoCatchesMonterey)
[pNadaStrongNina,hNadaStrongNina] = ranksum(laNadaCatchesMonterey, strongNinaCatchesMonterey)
[pNadaWeakNina,hNadaWeakNina] = ranksum(laNadaCatchesMonterey, weakNinaCatchesMonterey)

% %Wilcoxon tests on paired and independent data in San Francisco
[pStrong,hStrong] = signrank(strongNinoCatchesSF, strongNinaCatchesSF)
[pWeak,hWeak] = signrank(weakNinoCatchesSF, weakNinaCatchesSF)
[pNadaStrongNino,hNadaStrongNino] = ranksum(laNadaCatchesSF, strongNinoCatchesSF)
[pNadaWeakNino,hNadaWeakNino] = ranksum(laNadaCatchesSF, weakNinoCatchesSF)
[pNadaStrongNina,hNadaStrongNina] = ranksum(laNadaCatchesSF, strongNinaCatchesSF)
[pNadaWeakNina,hNadaWeakNina] = ranksum(laNadaCatchesSF, weakNinaCatchesSF)

%Wilcoxon tests on paired and independent data in Eureka
[pStrong,hStrong] = signrank(strongNinoCatchesEureka, strongNinaCatchesEureka)
[pWeak,hWeak] = signrank(weakNinoCatchesEureka, weakNinaCatchesEureka)
[pNadaStrongNino,hNadaStrongNino] = ranksum(laNadaCatchesEureka, strongNinoCatchesEureka)
[pNadaWeakNino,hNadaWeakNino] = ranksum(laNadaCatchesEureka, weakNinoCatchesEureka)
[pNadaStrongNina,hNadaStrongNina] = ranksum(laNadaCatchesEureka, strongNinaCatchesEureka)
[pNadaWeakNina,hNadaWeakNina] = ranksum(laNadaCatchesEureka, weakNinaCatchesEureka)

%Anova 1-Way Across All 6 Ports during "Strong" El Nino periods
ports = {'San Diego', 'Los Angeles', 'Santa Barbara','Monterey',...
    'San Francisco', 'Eureka'};
matrixfish = [strongNinoCatchesSD; strongNinoCatchesLA;...
    strongNinoCatchesSB; strongNinoCatchesMonterey; strongNinoCatchesSF;...
    strongNinoCatchesEureka];
[p,tbl] = anova1(matrixfish', ports);
title('1-Way Anova');
ylabel('Tuna Caught');

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%            PLOTS            %%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PLOT MEI Data
figure;
time = (datetime(1950,00,01) + calmonths(1:636))';
area(time, MEI, 'EdgeColor', 'none', 'FaceColor', [1 0 0])
ylabel('Standardized Departure','FontSize',20);
xlabel('Year','FontSize',20);
title('Multivariate ENSO Index (1950-2002)','FontSize',26);

% PIE graph of monthly average tuna catches 
figure;
labelsAll = {'Strong El Nino', 'Weak El Nino', 'La Nada', 'Weak La Nina'...
    'Strong La Nina'};
explode1 = [1 0 1 0 0];
pieFig1 = pie([mean(strongNinoCatchesAll), mean(weakNinoCatchesAll),...
    mean(laNadaCatchesAll), mean(weakNinaCatchesAll),...
    mean(strongNinaCatchesAll)],explode1);
title('Monthly Average Tuna Caught in 6 CA Ports(2002-1950)');
colormap parula;
colormap([0.6350, 0.0780, 0.184;0.9686    0.5451    0.5451;...
    1 1 1;0.2078    0.4039    0.9412;0.0196    0.0196    1.0000]);
T = pieFig1(strcmpi(get(pieFig1,'Type'),'text'));
P = cell2mat(get(T,'Position'));
set(T,{'Position'},num2cell(P*0.6,2))
legend(labelsAll,'Location', 'southoutside', 'Orientation', 'horizontal',...
    'FontSize',12);

%Plotting total tuna counts of Strong & Weak El Nino/La Nina
figure;
subplot(1,2,1)
c = categorical({'Strong El Nino','Strong La Nina'});
cNew = reordercats(c,{'Strong El Nino','Strong La Nina'});
barFig5 = bar(cNew,[sumStrongNinoCatchesAll sumStrongNinaCatchesAll]);
barFig5.FaceColor = 'flat';
barFig5.CData(1,:) = [0.6350, 0.0780, 0.1840];
barFig5.CData(2,:) = [0.0196, 0.0196, 1.0000];
xlabel('El Nino & La Nino Periods','FontSize',16);
ylabel('Tuna caught','FontSize',16);
title('Total tuna caught in 6 CA Ports During "Strong" Periods (1950-2002)',...
    'FontSize',18);
subplot(1,2,2)
c1 = categorical({'Weak El Nino', 'Weak La Nina'});
cNew1 = reordercats(c1,{'Weak El Nino', 'Weak La Nina'});
barFig6 = bar(cNew1 , [sumWeakNinoCatchesAll sumWeakNinaCatchesAll]);
barFig6.FaceColor = 'flat';
barFig6.CData(1,:) = [0.9686    0.5451    0.5451];
barFig6.CData(2,:) = [0.2078    0.4039    0.9412];
xlabel('El Nino & La Nino Periods','FontSize',16);
ylabel('Tuna caught','FontSize',16);
title('Total tuna caught in 6 CA Ports During "Weak" Periods (1950-2002)','FontSize',18);

% Horizontal Bar Graph of Tuna Caught At Each Port
figure;
subplot(1,2,1);
labelPorts = categorical({'San Diego', 'Los Angeles', 'Santa Barbara',...
    'Monterey', 'San Francisco', 'Eureka'});
labelPortsNew = reordercats(labelPorts,{'San Diego', 'Los Angeles',...
    'Santa Barbara', 'Monterey','San Francisco', 'Eureka'});
barFig2 = barh(labelPortsNew , [sum(strongNinoCatchesSD) sum(strongNinaCatchesSD); ...
    sum(strongNinoCatchesLA) sum(strongNinaCatchesLA);...
    sum(strongNinoCatchesSB) sum(strongNinaCatchesSB);...
    sum(strongNinoCatchesMonterey) sum(strongNinaCatchesMonterey);...
    sum(strongNinoCatchesSF) sum(strongNinaCatchesSF);...
    sum(strongNinoCatchesEureka) sum(strongNinaCatchesEureka)]);
barFig2(1).FaceColor = [0.6350, 0.0780, 0.1840];
barFig2(2).FaceColor = [0 0.5 .9];
xlabel('Number of Tuna Caught','FontSize',16);
ylabel('Ports','FontSize',16);
title('Tuna Counts During "Strong" El Nino & La Nina Periods (1950-2002)','FontSize',18);
legend('El Nino', 'La Nina','Location','east','FontSize',26);
subplot(1,2,2)
barFig3 = barh(labelPortsNew , [sum(weakNinoCatchesSD) sum(weakNinaCatchesSD); ...
    sum(weakNinoCatchesLA) sum(weakNinaCatchesLA);...
    sum(weakNinoCatchesSB) sum(weakNinaCatchesSB);...
    sum(weakNinoCatchesMonterey) sum(weakNinaCatchesMonterey);...
    sum(weakNinoCatchesSF) sum(weakNinaCatchesSF);...
    sum(weakNinoCatchesEureka) sum(weakNinaCatchesEureka)]);
barFig3(1).FaceColor = [0.6350, 0.0780, 0.1840];
barFig3(2).FaceColor = [0 0.5 .9];
xlabel('Number of Tuna Caught','FontSize',16);
ylabel('Ports','FontSize',16);
title('Tuna Counts During "Weak" El Nino & La Nina Periods (1950-2002)','FontSize',16);
legend('El Nino', 'La Nina','Location','east','FontSize',26);

%Bar Graph of average monthly tuna catches at each port
figure;
labelPorts2 = categorical({'San Diego', 'Los Angeles', 'Santa Barbara',...
    'Monterey', 'San Francisco', 'Eureka'});
labelPortsNew = reordercats(labelPorts2,{'San Diego', 'Los Angeles',...
    'Santa Barbara', 'Monterey','San Francisco', 'Eureka'});
barFig4 = bar(labelPortsNew,...
   [mean(strongNinoCatchesSD) mean(weakNinoCatchesSD) mean(laNadaCatchesSD) mean(weakNinaCatchesSD) mean(strongNinaCatchesSD); ...
    mean(strongNinoCatchesLA) mean(weakNinoCatchesLA) mean(laNadaCatchesLA) mean(weakNinaCatchesLA) mean(strongNinaCatchesLA);...
    mean(strongNinoCatchesSB) mean(weakNinoCatchesSB) mean(laNadaCatchesSB) mean(weakNinaCatchesSB) mean(strongNinaCatchesSB);...
    mean(strongNinoCatchesMonterey) mean(weakNinoCatchesMonterey) mean(laNadaCatchesMonterey) mean(weakNinaCatchesMonterey) mean(strongNinaCatchesMonterey) ;...
    mean(strongNinoCatchesSF) mean(weakNinoCatchesSF) mean(laNadaCatchesSF) mean(weakNinaCatchesSF) mean(strongNinaCatchesSF);...
    mean(strongNinoCatchesEureka) mean(weakNinoCatchesEureka) mean(laNadaCatchesEureka) mean(weakNinaCatchesEureka) mean(strongNinaCatchesEureka)]);
ylabel('Number of Tuna Caught - Monthly Average','FontSize',18);
xlabel('Ports','FontSize',18);
title('Monthly Average Tuna Counts At Each Port(1950-2002)','FontSize',26);
barFig4(1).FaceColor = [0.6350, 0.0780, 0.1840];
barFig4(2).FaceColor = [0.9686    0.5451    0.5451];
barFig4(3).FaceColor = [1, 1, 1];
barFig4(4).FaceColor = [0.2078    0.4039    0.9412];
barFig4(5).FaceColor = [0.0196    0.0196    1.0000];
legend('Strong El Nino', 'Weak El Nino','La Nada','Weak La Nina', ...
    'Strong La Nina','Location','east','FontSize',26);
toc