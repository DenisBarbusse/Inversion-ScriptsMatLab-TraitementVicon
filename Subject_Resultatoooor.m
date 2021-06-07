RESULTS_folder = {uigetdir};

T_UP = [];
T_DOWN = [];
AMP_UP = [];
AMP_DOWN = [];
Vmax_UP = [];
Vmax_DOWN = [];

RA_UP = [];
RA_DOWN = [];
RtPa_UP = [];
RtPa_DOWN = [];
RtPd_UP = [];
RtPd_DOWN = [];

j = 1;

for i = 1:length(RESULTS_folder)
   R_lst = dir(fullfile(RESULTS_folder{i},'Results_*'));
   
    while j < 19
       
        load(['Results_S' num2str(j) '.mat']);
        
        
        T_UP = [T_UP T_UP_Trys(:,1) T_UP_Trys(:,2)];
        
        T_DOWN = [T_DOWN T_DOWN_Trys(:,1) T_DOWN_Trys(:,2)];
        
        AMP_UP = [AMP_UP AMP_UP_Trys(:,1) AMP_UP_Trys(:,2)];
        
        AMP_DOWN = [AMP_DOWN AMP_DOWN_Trys(:,1) AMP_DOWN_Trys(:,2)];
        
        Vmax_UP = [Vmax_UP Vmax_UP_Trys(:,1) Vmax_UP_Trys(:,2)];
        
        Vmax_DOWN = [Vmax_DOWN Vmax_DOWN_Trys(:,1) Vmax_DOWN_Trys(:,2)];
        
        
        RA_UP = [RA_UP RA_UP_Trys(:,1) RA_UP_Trys(:,2)];
        
        RA_DOWN = [RA_DOWN RA_DOWN_Trys(:,1) RA_DOWN_Trys(:,2)];
        
        RtPa_UP = [RtPa_UP RtPa_UP_Trys(:,1) RtPa_UP_Trys(:,2)];
        
        RtPa_DOWN = [RtPa_DOWN RtPa_DOWN_Trys(:,1) RtPa_DOWN_Trys(:,2)];
        
        RtPd_UP = [RtPd_UP RtPd_UP_Trys(:,1) RtPd_UP_Trys(:,2)];
        
        RtPd_DOWN = [RtPd_DOWN RtPd_DOWN_Trys(:,1) RtPd_DOWN_Trys(:,2)];
    
        
        j = j+1;
        
    end

    save('SUBJECTS_RESULTS','T_UP','T_DOWN','AMP_UP','AMP_DOWN','Vmax_UP','Vmax_DOWN','RA_UP','RA_DOWN','RtPa_UP','RtPa_DOWN','RtPd_UP','RtPd_DOWN')    
        
end