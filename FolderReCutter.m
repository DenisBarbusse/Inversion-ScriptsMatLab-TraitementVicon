Folder = {uigetdir};

for i = 1:length(Folder)
    Folder_lst = dir(fullfile(Folder{i},'Try*'));

    for j = 1:length(Folder_lst)
        Try = load (['Try' num2str(j) '.mat']);
        
        Z = Try.T;
        
        Onset = Z(1,1);
        
        Offset = (Onset+length(Z(:,1)))-1;
        
        T = [Z(:,1) C3D.Cinematique.Donnees(Onset:Offset,:)];
        
        save (['Try' num2str(j) '.mat'],'Z' ,'T');
        
    end
    
end
