RESULTS_folder = {uigetdir};


EA_FinalP_UP_NormalG = NaN(250,6);
EA_FinalP_UP_InverseG = NaN(250,6);
EA_FinalP_DOWN_NormalG = NaN(250,6);
EA_FinalP_DOWN_InverseG = NaN(250,6);

EA_P10_UP_NormalG = NaN(250,6);
EA_P10_UP_InverseG = NaN(250,6);
EA_P10_DOWN_NormalG = NaN(250,6);
EA_P10_DOWN_InverseG = NaN(250,6);

EA_P20_UP_NormalG = NaN(250,6);
EA_P20_UP_InverseG = NaN(250,6);
EA_P20_DOWN_NormalG = NaN(250,6);
EA_P20_DOWN_InverseG = NaN(250,6);

EA_P30_UP_NormalG = NaN(250,6);
EA_P30_UP_InverseG = NaN(250,6);
EA_P30_DOWN_NormalG = NaN(250,6);
EA_P30_DOWN_InverseG = NaN(250,6);


j = 1;
p = 1;
q = 1;

for i = 1:length(RESULTS_folder)
   R_lst = dir(fullfile(RESULTS_folder{i},'Results*'));
   
   
    while j < 13
       
        load(['Results_P' num2str(j) '.mat']);
        
        if rem(j,2) > 0
            
            EA_FinalP_UP_NormalG(1:length(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Up),p) = ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Up(:,1);
            EA_FinalP_DOWN_NormalG(1:length(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Down),p) = ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Down(:,1);
            
            EA_P10_UP_NormalG(1:length(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Up),p) = ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Up(:,2);
            EA_P10_DOWN_NormalG(1:length(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Down),p) = ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Down(:,2);
            
            EA_P20_UP_NormalG(1:length(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Up),p) = ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Up(:,3);
            EA_P20_DOWN_NormalG(1:length(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Down),p) = ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Down(:,3);
            
            EA_P30_UP_NormalG(1:length(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Up),p) = ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Up(:,4);
            EA_P30_DOWN_NormalG(1:length(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Down),p) = ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Down(:,4);
            
            p = p+1;
            
        else
            
            EA_FinalP_UP_InverseG(1:length(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Up),q) = ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Up(:,1);
            EA_FinalP_DOWN_InverseG(1:length(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Down),q) = ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Down(:,1);
            
            EA_P10_UP_InverseG(1:length(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Up),q) = ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Up(:,2);
            EA_P10_DOWN_InverseG(1:length(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Down),q) = ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Down(:,2);
            
            EA_P20_UP_InverseG(1:length(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Up),q) = ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Up(:,3);
            EA_P20_DOWN_InverseG(1:length(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Down),q) = ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Down(:,3);
            
            EA_P30_UP_InverseG(1:length(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Up),q) = ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Up(:,4);
            EA_P30_DOWN_InverseG(1:length(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Down),q) = ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Down(:,4);
            
            q = q+1;
        
        end
        
           
        j = j+1;
        
        
    end
    
    
end


save('EAng','EA_FinalP_UP_NormalG','EA_FinalP_UP_InverseG','EA_FinalP_DOWN_NormalG','EA_FinalP_DOWN_InverseG','EA_P10_UP_NormalG','EA_P10_UP_InverseG','EA_P10_DOWN_NormalG','EA_P10_DOWN_InverseG','EA_P20_UP_NormalG','EA_P20_UP_InverseG','EA_P20_DOWN_NormalG','EA_P20_DOWN_InverseG','EA_P30_UP_NormalG','EA_P30_UP_InverseG','EA_P30_DOWN_NormalG','EA_P30_DOWN_InverseG');