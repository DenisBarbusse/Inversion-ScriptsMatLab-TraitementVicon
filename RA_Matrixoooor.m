RESULTS_folder = {uigetdir};


RA_UP_NormalG = [];
RA_UP_InverseG = [];
RA_DOWN_NormalG = [];
RA_DOWN_InverseG = [];

RtPa_UP_NormalG = [];
RtPa_UP_InverseG = [];
RtPa_DOWN_NormalG = [];
RtPa_DOWN_InverseG = [];

RtPd_UP_NormalG = [];
RtPd_UP_InverseG = [];
RtPd_DOWN_NormalG = [];
RtPd_DOWN_InverseG = [];


j = 1;

u = 1;
v = 1;

for i = 1:length(RESULTS_folder)
   R_lst = dir(fullfile(RESULTS_folder{i},'Results*'));
   
   
    while j < 19
       
        load(['Results_S' num2str(j) '.mat']);
            
        
            RA_UP_NormalG = [RA_UP_NormalG
                RA_RtPa_RtPd_M_SD_UP(1,1) RA_RtPa_RtPd_M_SD_UP(5,1) RA_RtPa_RtPd_M_SD_UP(9,1) RA_RtPa_RtPd_M_SD_UP(13,1) RA_RtPa_RtPd_M_SD_UP(17,1) RA_RtPa_RtPd_M_SD_UP(21,1)];
            RA_DOWN_NormalG = [RA_DOWN_NormalG
                RA_RtPa_RtPd_M_SD_DOWN(1,1) RA_RtPa_RtPd_M_SD_DOWN(5,1) RA_RtPa_RtPd_M_SD_DOWN(9,1) RA_RtPa_RtPd_M_SD_DOWN(13,1) RA_RtPa_RtPd_M_SD_DOWN(17,1) RA_RtPa_RtPd_M_SD_DOWN(21,1)];
            
            RtPa_UP_NormalG = [RtPa_UP_NormalG
                RA_RtPa_RtPd_M_SD_UP(1,2) RA_RtPa_RtPd_M_SD_UP(5,2) RA_RtPa_RtPd_M_SD_UP(9,2) RA_RtPa_RtPd_M_SD_UP(13,2) RA_RtPa_RtPd_M_SD_UP(17,2) RA_RtPa_RtPd_M_SD_UP(21,2)];
            RtPa_DOWN_NormalG = [RtPa_DOWN_NormalG
                RA_RtPa_RtPd_M_SD_DOWN(1,2) RA_RtPa_RtPd_M_SD_DOWN(5,2) RA_RtPa_RtPd_M_SD_DOWN(9,2) RA_RtPa_RtPd_M_SD_DOWN(13,2) RA_RtPa_RtPd_M_SD_DOWN(17,2) RA_RtPa_RtPd_M_SD_DOWN(21,2)];
            
            RtPd_UP_NormalG = [RtPd_UP_NormalG
                RA_RtPa_RtPd_M_SD_UP(1,3) RA_RtPa_RtPd_M_SD_UP(5,3) RA_RtPa_RtPd_M_SD_UP(9,3) RA_RtPa_RtPd_M_SD_UP(13,3) RA_RtPa_RtPd_M_SD_UP(17,3) RA_RtPa_RtPd_M_SD_UP(21,3)];
            RtPd_DOWN_NormalG = [RtPd_DOWN_NormalG
                RA_RtPa_RtPd_M_SD_DOWN(1,3) RA_RtPa_RtPd_M_SD_DOWN(5,3) RA_RtPa_RtPd_M_SD_DOWN(9,3) RA_RtPa_RtPd_M_SD_DOWN(13,3) RA_RtPa_RtPd_M_SD_DOWN(17,3) RA_RtPa_RtPd_M_SD_DOWN(21,3)];
            
            
            RA_UP_InverseG = [RA_UP_InverseG
                RA_RtPa_RtPd_M_SD_UP(3,1) RA_RtPa_RtPd_M_SD_UP(7,1) RA_RtPa_RtPd_M_SD_UP(11,1) RA_RtPa_RtPd_M_SD_UP(15,1) RA_RtPa_RtPd_M_SD_UP(19,1) RA_RtPa_RtPd_M_SD_UP(23,1)];
            RA_DOWN_InverseG = [RA_DOWN_InverseG
                RA_RtPa_RtPd_M_SD_DOWN(3,1) RA_RtPa_RtPd_M_SD_DOWN(7,1) RA_RtPa_RtPd_M_SD_DOWN(11,1) RA_RtPa_RtPd_M_SD_DOWN(15,1) RA_RtPa_RtPd_M_SD_DOWN(19,1) RA_RtPa_RtPd_M_SD_UP(23,1)];
            
            RtPa_UP_InverseG = [RtPa_UP_InverseG 
                RA_RtPa_RtPd_M_SD_UP(3,2) RA_RtPa_RtPd_M_SD_UP(7,2) RA_RtPa_RtPd_M_SD_UP(11,2) RA_RtPa_RtPd_M_SD_UP(15,2) RA_RtPa_RtPd_M_SD_UP(19,2) RA_RtPa_RtPd_M_SD_UP(23,2)];
            RtPa_DOWN_InverseG = [RtPa_DOWN_InverseG 
                RA_RtPa_RtPd_M_SD_DOWN(3,2) RA_RtPa_RtPd_M_SD_DOWN(7,2) RA_RtPa_RtPd_M_SD_DOWN(11,2) RA_RtPa_RtPd_M_SD_DOWN(15,2) RA_RtPa_RtPd_M_SD_DOWN(19,2) RA_RtPa_RtPd_M_SD_UP(23,2)];
            
            RtPd_UP_InverseG = [RtPd_UP_InverseG
                RA_RtPa_RtPd_M_SD_UP(3,3) RA_RtPa_RtPd_M_SD_UP(7,3) RA_RtPa_RtPd_M_SD_UP(11,3) RA_RtPa_RtPd_M_SD_UP(15,3) RA_RtPa_RtPd_M_SD_UP(19,3) RA_RtPa_RtPd_M_SD_UP(23,3)];
            RtPd_DOWN_InverseG = [RtPd_DOWN_InverseG
                RA_RtPa_RtPd_M_SD_DOWN(3,3) RA_RtPa_RtPd_M_SD_DOWN(7,3) RA_RtPa_RtPd_M_SD_DOWN(11,3) RA_RtPa_RtPd_M_SD_DOWN(15,3) RA_RtPa_RtPd_M_SD_DOWN(19,3) RA_RtPa_RtPd_M_SD_UP(23,3)];
            

        j = j+1;
        
        
    end
    
    
end


save('RA','RA_UP_NormalG','RA_DOWN_NormalG','RtPa_UP_NormalG','RtPa_DOWN_NormalG','RtPd_UP_NormalG','RtPd_DOWN_NormalG','RA_UP_InverseG','RA_DOWN_InverseG','RtPa_UP_InverseG','RtPa_DOWN_InverseG','RtPd_UP_InverseG','RtPd_DOWN_InverseG');