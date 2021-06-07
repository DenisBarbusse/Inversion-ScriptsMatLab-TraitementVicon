RESULTS_folder = {uigetdir};


EA = [];

        
j = 1;


for i = 1:length(RESULTS_folder)
   R_lst = dir(fullfile(RESULTS_folder{i},'Results*'));
   
   
    while j < 13
       
        
        load(['Results_P' num2str(j) '.mat']);
        
        EAng = [ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Up(:,1)
            ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Down(:,1)];
        
        EA = [EA
            nanmean(EAng) nanstd(EAng)];
        
        j = j+1;
       
       
    end
    
    
end


save('EA','EA')