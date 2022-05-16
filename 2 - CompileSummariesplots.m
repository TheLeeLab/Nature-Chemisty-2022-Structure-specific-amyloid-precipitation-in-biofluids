% Generate file with All results 
% Plot global histograms and scatter plots

close all
clear all
clc

% Magnification:
% xxx px square, 1px=241nm for 60x 
areaFV=(0.241*383)^2;


cd('E:\Aloe Vera\20190530-Elena Dyes Analysis\summary')

%A0=load('Blank__PEG6.dat');
  %  A0(any(isnan(A0),2),:)=[];%delete NaN

%A1=load('Blank__PEG9.dat');
    %A1(any(isnan(A1),2),:)=[];
    
%A2=load('lank__PEG15.dat');
    %A2(any(isnan(A2),2),:)=[];
    
%A3=load('Blank__PibX.dat');
    %A3(any(isnan(A3),2),:)=[];
    
A4=load('PEG6__dimer.dat');
    A4(any(isnan(A4),2),:)=[];
    
A5=load('PEG9__dimer.dat');
    A5(any(isnan(A5),2),:)=[];
    
A6=load('EG15__dimer.dat');
    A6(any(isnan(A6),2),:)=[];
    
A7=load('Pib_X______.dat');
    A7(any(isnan(A7),2),:)=[];
     
  
    %%
%[a ~]=size(A0);
%A0_per_FV=histcounts(A0(:,1),A0(a,1)); % vector with number of spots per field of view
%A0_avg=mean(A0_per_FV); % avg spots per field of view
%A0_std=std(A0_per_FV); % sd per field of view
%A0_per_um2=A0_avg/areaFV; %per um2
%A0_std_per_um2=A0_std/areaFV; %per um2

%%
%[a ~]=size(A1);
%A1_per_FV=histcounts(A1(:,1),A1(a,1)); % vector with number of spots per field of view
%A1_avg=mean(A1_per_FV); % avg spots per field of view
%A1_std=std(A1_per_FV); % sd per field of view
%A1_per_um2=A1_avg/areaFV; %per um2
%A1_std_per_um2=A1_std/areaFV; %per um2
%%
%[a ~]=size(A2);
%A2_per_FV=histcounts(A2(:,1),A2(a,1)); % vector with number of spots per field of view
%A2_avg=mean(A2_per_FV); % avg spots per field of view
%A2_std=std(A2_per_FV); % sd per field of view
%A2_per_um2=A2_avg/areaFV; %per um2
%A2_std_per_um2=A2_std/areaFV; %per um2

%%
%[a ~]=size(A3);
%A3_per_FV=histcounts(A3(:,1),A3(a,1)); % vector with number of spots per field of view
%A3_avg=mean(A3_per_FV); % avg spots per field of view
%A3_std=std(A3_per_FV); % sd per field of view
%A3_per_um2=A3_avg/areaFV; %per um2
%A3_std_per_um2=A3_std/areaFV; %per um2

%%
[a ~]=size(A4);
A4_per_FV=histcounts(A4(:,1),A4(a,1)); % vector with number of spots per field of view
A4_avg=mean(A4_per_FV); % avg spots per field of view
A4_std=std(A4_per_FV); % sd per field of view
A4_per_um2=A4_avg/areaFV; %per um2
A4_std_per_um2=A4_std/areaFV; %per um2

%%
[a ~]=size(A5);
A5_per_FV=histcounts(A5(:,1),A5(a,1)); % vector with number of spots per field of view
A5_avg=mean(A5_per_FV); % avg spots per field of view
A5_std=std(A5_per_FV); % sd per field of view
A5_per_um2=A5_avg/areaFV; %per um2
A5_std_per_um2=A5_std/areaFV; %per um2

%%
[a ~]=size(A6);
A6_per_FV=histcounts(A6(:,1),A6(a,1)); % vector with number of spots per field of view
A6_avg=mean(A6_per_FV); % avg spots per field of view
A6_std=std(A6_per_FV); % sd per field of view
A6_per_um2=A6_avg/areaFV; %per um2
A6_std_per_um2=A6_std/areaFV; %per um2

%%
[a ~]=size(A7);
A7_per_FV=histcounts(A7(:,1),A7(a,1)); % vector with number of spots per field of view
A7_avg=mean(A7_per_FV); % avg spots per field of view
A7_std=std(A7_per_FV); % sd per field of view
A7_per_um2=A7_avg/areaFV; %per um2
A7_std_per_um2=A7_std/areaFV; %per um2

%% save data
%summary_A0={'Blank_PEG6' A0_avg A0_std A0_per_um2 A0_std_per_um2};
%summary_A1={'Blank_PEG9' A1_avg A1_std A1_per_um2 A1_std_per_um2};
%summary_A2={'Blank_PEG15' A2_avg A2_std A2_per_um2 A2_std_per_um2};
%summary_A3={'Bank_PibX' A3_avg A3_std A3_per_um2 A3_std_per_um2};
summary_A4={'PEG6_dimer' A4_avg A4_std A4_per_um2 A4_std_per_um2};
summary_A5={'PEG9_dimer' A5_avg A5_std A5_per_um2 A5_std_per_um2};
summary_A6={'PEG15_dimer' A6_avg A6_std A6_per_um2 A6_std_per_um2};
summary_A7={'Pib_X______' A7_avg A7_std A7_per_um2 A7_std_per_um2};


summaryall=[summary_A4; summary_A5;summary_A6;summary_A7;];

T=array2table(summaryall,'VariableNames',{'sample' 'avgerage' 'standarddev' 'avgerageum2' 'standarddevum2'})

writetable(T,'results.txt','Delimiter','tab')

%Aleks rocks - # of spots in each field of view (plot individual # box
%plot)
samples = 32;%change every time (128 max number of FV)
dddata = zeros(128,samples);
dddata(:) = -1;
dddata = [(1:128)' dddata];

%Column 1

%dddata(1:length(A0_per_FV),2) = A0_per_FV;

%dddata(1:length(A1_per_FV),3) = A1_per_FV;

%dddata(1:length(A2_per_FV),4) = A2_per_FV;

%dddata(1:length(A3_per_FV),5) = A3_per_FV;

dddata(1:length(A4_per_FV),6) = A4_per_FV;

dddata(1:length(A5_per_FV),7) = A5_per_FV;

dddata(1:length(A6_per_FV),8) = A6_per_FV;

dddata(1:length(A7_per_FV),9) = A7_per_FV;

FV=array2table(dddata,'VariableNames',{'FOV' 'A4' 'A5' 'A6' 'A7'})

writetable(FV,'resultsFV.txt','Delimiter','tab')