% To make stats out of spots detected with SFL's macro in ImageJ
% for Guida's pull down samples

close all
clear all
clc

%cd('G:\MICROSCOPY DATA\Aloe Vera\')
cd('E:\Aloe Vera\20190530-Elena Dyes Analysis')

%Select folders with patients to process:
waitfor(msgbox('Choose folders to process'));

all_folders=uipickfiles
%current path and lenght, to use for substracting patients string
current=pwd;
currentlength=length(current);

%loop over patients
for i=1:length(all_folders)
    %Extract folder name (Patient ID)
    patientfolder=all_folders{i};
    patientID=patientfolder(length(patientfolder)-10:length(patientfolder));
    %Create Patient Summary dat file: PatientID.dat
    patientsummary=[];
        
    %cd folder name
    cd (patientfolder);
    %create list of directories (each corresponds to 1 screen)
    scans=dir;
    scans(~[scans.isdir]) = [];  %remove non-directories
    scans={scans.name};
    scans=scans(3:length(scans))';
    %loop over scans folders
        fieldcount=0;
        for j=1:length(scans)
        cd(scans{j});
        %create list of directories (each corresponds to 1 field of view)
        fields = dir;
        fields(~[fields.isdir]) = [];  %remove non-directories
        fields = {fields.name};
        %cd to each field of view and read log file
            for k=3:length(fields) %first 2 elements are "." and ".."
            cd(fields{k});
            textfiles=dir('*txt');
            logfile={textfiles.name};
            logfile=logfile{1};
            logfile=importdata(logfile);
                if isstruct(logfile)==1
                    logfile=logfile.data;
                    [rows,columns]=size(logfile);
                    fieldcount=fieldcount+1;
                    idfield=ones(rows,1)*(fieldcount);
                    logfile=[idfield logfile];
                    %append to patientsummary
                    patientsummary=[patientsummary;logfile];
                end
            cd ..
            end
            cd ..
        end
        cd ..
        
        if isempty(patientsummary)==0
        %patientsummary(:,4:5)=[];%delete raw and background
        end
        % patientID: FV | x(px) | y(px) | rawInt | Bcg | Intensity-Bcg
        eval(['save summary/',patientID,'.dat patientsummary -ascii -tabs']);

end



