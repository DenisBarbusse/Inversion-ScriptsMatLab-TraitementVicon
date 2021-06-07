RESULTS_folder = {uigetdir};


RA_UP = [];
RA_DOWN = [];
RA_SD_UP = [];
RA_SD_DOWN = [];


RtPa_UP = [];
RtPa_DOWN = [];
RtPa_SD_UP = [];
RtPa_SD_DOWN = [];


RtPd_UP = [];
RtPd_DOWN = [];
RtPd_SD_UP = [];
RtPd_SD_DOWN = [];


EAng_ALL = [];
EAng_UP = [];
EAng_DOWN = [];
EAng_SD_ALL = [];
EAng_SD_UP = [];
EAng_SD_DOWN = [];


ECon_ALL = [];
ECon_UP = [];
ECon_DOWN = [];


EVar_ALL = [];
EVar_UP = [];
EVar_DOWN = [];


T_ALL = [];
T_UP = [];
T_DOWN = [];
T_SD_ALL = [];
T_SD_UP = [];
T_SD_DOWN = [];


AMP_ALL = [];
AMP_UP = [];
AMP_DOWN = [];
AMP_SD_ALL = [];
AMP_SD_UP = [];
AMP_SD_DOWN = [];


Vmax_ALL = [];
Vmax_UP = [];
Vmax_DOWN = [];
Vmax_SD_ALL = [];
Vmax_SD_UP = [];
Vmax_SD_DOWN = [];


DevLat_ALL = [];
DevLat_UP = [];
DevLat_DOWN = [];
DevLat_SD_ALL = [];
DevLat_SD_UP = [];
DevLat_SD_DOWN = [];
DevLat_MinMax_ALL = [];
DevLat_MinMax_UP = [];
DevLat_MinMax_DOWN = [];


AngWrist_ALL = [];
AngWrist_UP = [];
AngWrist_DOWN = [];
AngWrist_SD_ALL = [];
AngWrist_SD_UP = [];
AngWrist_SD_DOWN = [];
AngWrist_MinMax_ALL = [];
AngWrist_MinMax_UP = [];
AngWrist_MinMax_DOWN = [];


AngElbow_ALL = [];
AngElbow_UP = [];
AngElbow_DOWN = [];
AngElbow_SD_ALL = [];
AngElbow_SD_UP = [];
AngElbow_SD_DOWN = [];
AngElbow_MinMax_ALL = [];
AngElbow_MinMax_UP = [];
AngElbow_MinMax_DOWN = [];

j = 1;

for i = 1:length(RESULTS_folder)
   R_lst = dir(fullfile(RESULTS_folder{i},'Results*'));
   
   
    while j < 19
       
        load(['Results_S' num2str(j) '_P12.mat']);
            
        
           RA_UP = [RA_UP
               nanmean(RA_RtPa_RtPd_UpTrys(:,1))];
           RA_DOWN = [RA_DOWN
               nanmean(RA_RtPa_RtPd_DownTrys(:,1))];
           RA_SD_UP = [RA_SD_UP
               nanstd(RA_RtPa_RtPd_UpTrys(:,1))];
           RA_SD_DOWN = [RA_SD_DOWN
               nanstd(RA_RtPa_RtPd_DownTrys(:,1))];

           
           RtPa_UP = [RtPa_UP
               nanmean(RA_RtPa_RtPd_UpTrys(:,2))];
           RtPa_DOWN = [RtPa_DOWN
               nanmean(RA_RtPa_RtPd_DownTrys(:,2))];
           RtPa_SD_UP = [RtPa_SD_UP
               nanstd(RA_RtPa_RtPd_UpTrys(:,2))];
           RtPa_SD_DOWN = [RtPa_SD_DOWN
               nanstd(RA_RtPa_RtPd_DownTrys(:,2))];
           
           
           RtPd_UP = [RtPd_UP
               nanmean(RA_RtPa_RtPd_UpTrys(:,3))];
           RtPd_DOWN = [RtPd_DOWN
               nanmean(RA_RtPa_RtPd_DownTrys(:,3))];
           RtPd_SD_UP = [RtPd_SD_UP
               nanstd(RA_RtPa_RtPd_UpTrys(:,3))];
           RtPd_SD_DOWN = [RtPd_SD_DOWN
               nanstd(RA_RtPa_RtPd_DownTrys(:,3))];
           
           
           EAng_all = [ErreurAngulaireUp_FinalP_PAfterMaxVPeak_10_20_30(:,2)
               ErreurAngulaireDown_FinalP_PAfterMaxVPeak_10_20_30(:,2)];
           EAng_ALL = [EAng_ALL
               nanmean(EAng_all(:,1))];
           EAng_UP = [EAng_UP
               nanmean(ErreurAngulaireUp_FinalP_PAfterMaxVPeak_10_20_30(:,2))];
           EAng_DOWN = [EAng_DOWN
               nanmean(ErreurAngulaireDown_FinalP_PAfterMaxVPeak_10_20_30(:,2))];
           EAng_SD_ALL = [EAng_SD_ALL
               nanstd(EAng_all(:,1))];
           EAng_SD_UP = [EAng_SD_UP
               nanstd(ErreurAngulaireUp_FinalP_PAfterMaxVPeak_10_20_30(:,2))];
           EAng_SD_DOWN = [EAng_SD_DOWN
               nanstd(ErreurAngulaireDown_FinalP_PAfterMaxVPeak_10_20_30(:,2))];

           
           ECon_all = [ErreurConstanteUp_FinalP_PAfterMaxVPeak_10_20_30(:,2)
               ErreurConstanteDown_FinalP_PAfterMaxVPeak_10_20_30(:,2)];
           ECon_ALL = [ECon_ALL
               nanmean(ECon_all(:,1))];
           ECon_UP = [ECon_UP
               ErreurConstanteUp_FinalP_PAfterMaxVPeak_10_20_30(:,2)];
           ECon_DOWN = [ECon_DOWN
               ErreurConstanteDown_FinalP_PAfterMaxVPeak_10_20_30(:,2)];
          
           
           EVar_all = [ErreurVariableUp_FinalP_PAfterMaxVPeak_10_20_30(:,2)
               ErreurVariableDown_FinalP_PAfterMaxVPeak_10_20_30(:,2)];
           EVar_ALL = [EVar_ALL
               nanmean(EVar_all(:,1))];
           EVar_UP = [EVar_UP
               ErreurVariableUp_FinalP_PAfterMaxVPeak_10_20_30(:,2)];
           EVar_DOWN = [EVar_DOWN
               ErreurVariableDown_FinalP_PAfterMaxVPeak_10_20_30(:,2)];
           
           
           
           T_ALL = [T_ALL
               nanmean(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax(:,1))];
           T_UP = [T_UP
               nanmean(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_UpTrys(:,1))];
           T_DOWN = [T_DOWN
               nanmean(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_DownTrys(:,1))];
           T_SD_ALL = [T_SD_ALL
               nanstd(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax(:,1))];
           T_SD_UP = [T_SD_UP
               nanstd(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_UpTrys(:,1))];
           T_SD_DOWN = [T_SD_DOWN
               nanstd(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_DownTrys(:,1))];
           
           
           AMP_ALL = [AMP_ALL
               nanmean(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax(:,2))];
           AMP_UP = [AMP_UP
               nanmean(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_UpTrys(:,2))];
           AMP_DOWN = [AMP_DOWN
               nanmean(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_DownTrys(:,2))];
           AMP_SD_ALL = [AMP_SD_ALL
               nanstd(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax(:,2))];
           AMP_SD_UP = [AMP_SD_UP
               nanstd(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_UpTrys(:,2))];
           AMP_SD_DOWN = [AMP_SD_DOWN
               nanstd(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_DownTrys(:,2))];
           
           
           Vmax_ALL = [Vmax_ALL
               nanmean(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax(:,5))];
           Vmax_UP = [Vmax_UP
               nanmean(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_UpTrys(:,5))];
           Vmax_DOWN = [Vmax_DOWN
               nanmean(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_DownTrys(:,5))];
           Vmax_SD_ALL = [Vmax_SD_ALL
               nanstd(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax(:,5))];
           Vmax_SD_UP = [Vmax_SD_UP
               nanstd(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_UpTrys(:,5))];
           Vmax_SD_DOWN = [Vmax_SD_DOWN
               nanstd(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_DownTrys(:,5))];
           
           
           DevLat_ALL = [DevLat_ALL
               nanmean(LateralDeviation_M_SD_Min_Max(:,1))];
           DevLat_UP = [DevLat_UP
               nanmean(LateralDeviation_M_SD_Min_Max_UpTrys(:,1))];
           DevLat_DOWN = [DevLat_DOWN
               nanmean(LateralDeviation_M_SD_Min_Max_DownTrys(:,1))];
           DevLat_SD_ALL = [DevLat_SD_ALL
               nanstd(LateralDeviation_M_SD_Min_Max(:,1))];
           DevLat_SD_UP = [DevLat_SD_UP
               nanstd(LateralDeviation_M_SD_Min_Max_UpTrys(:,1))];
           DevLat_SD_DOWN = [DevLat_SD_DOWN
               nanstd(LateralDeviation_M_SD_Min_Max_DownTrys(:,1))];
           DevLat_MinMax_ALL = [DevLat_MinMax_ALL
               nanmin(LateralDeviation_M_SD_Min_Max(:,3)) nanmax(LateralDeviation_M_SD_Min_Max(:,4))];
           DevLat_MinMax_UP = [DevLat_MinMax_UP
               nanmin(LateralDeviation_M_SD_Min_Max_UpTrys(:,3)) nanmax(LateralDeviation_M_SD_Min_Max_UpTrys(:,4))];
           DevLat_MinMax_DOWN = [DevLat_MinMax_DOWN
               nanmin(LateralDeviation_M_SD_Min_Max_DownTrys(:,3)) nanmax(LateralDeviation_M_SD_Min_Max_DownTrys(:,4))];
           
           
           AngWrist_ALL = [AngWrist_ALL
               nanmean(WristAngle_CS_AK_M_SD_start_end_min_max(:,1))];
           AngWrist_UP = [AngWrist_UP
               nanmean(WristAngle_CS_AK_M_SD_start_end_min_max_UpTrys(:,1))];
           AngWrist_DOWN = [AngWrist_DOWN
               nanmean(WristAngle_CS_AK_M_SD_start_end_min_max_DownTrys(:,1))];
           AngWrist_SD_ALL = [AngWrist_SD_ALL
               nanstd(WristAngle_CS_AK_M_SD_start_end_min_max(:,1))];
           AngWrist_SD_UP = [AngWrist_SD_UP
               nanstd(WristAngle_CS_AK_M_SD_start_end_min_max_UpTrys(:,1))];
           AngWrist_SD_DOWN = [AngWrist_SD_DOWN
               nanstd(WristAngle_CS_AK_M_SD_start_end_min_max_DownTrys(:,1))];
           AngWrist_MinMax_ALL = [AngWrist_MinMax_ALL
               nanmin(WristAngle_CS_AK_M_SD_start_end_min_max(:,9)) nanmax(WristAngle_CS_AK_M_SD_start_end_min_max(:,11))];
           AngWrist_MinMax_UP = [AngWrist_MinMax_UP
               nanmin(WristAngle_CS_AK_M_SD_start_end_min_max_UpTrys(:,9)) nanmax(WristAngle_CS_AK_M_SD_start_end_min_max_UpTrys(:,11))];
           AngWrist_MinMax_DOWN = [AngWrist_MinMax_DOWN
               nanmin(WristAngle_CS_AK_M_SD_start_end_min_max_DownTrys(:,9)) nanmax(WristAngle_CS_AK_M_SD_start_end_min_max_DownTrys(:,11))];
           
           
           AngElbow_ALL = [AngElbow_ALL
               nanmean(ElbowAngle_CS_AK_M_SD_start_end_min_max(:,1))];
           AngElbow_UP = [AngElbow_UP
               nanmean(ElbowAngle_CS_AK_M_SD_start_end_min_max_UpTrys(:,1))];
           AngElbow_DOWN = [AngElbow_DOWN
               nanmean(ElbowAngle_CS_AK_M_SD_start_end_min_max_DownTrys(:,1))];
           AngElbow_SD_ALL = [AngElbow_SD_ALL
               nanstd(ElbowAngle_CS_AK_M_SD_start_end_min_max(:,1))];
           AngElbow_SD_UP = [AngElbow_SD_UP
               nanstd(ElbowAngle_CS_AK_M_SD_start_end_min_max_UpTrys(:,1))];
           AngElbow_SD_DOWN = [AngElbow_SD_DOWN
               nanstd(ElbowAngle_CS_AK_M_SD_start_end_min_max_DownTrys(:,1))];
           AngElbow_MinMax_ALL = [AngElbow_MinMax_ALL
               nanmin(ElbowAngle_CS_AK_M_SD_start_end_min_max(:,9)) nanmax(ElbowAngle_CS_AK_M_SD_start_end_min_max(:,11))];
           AngElbow_MinMax_UP = [AngElbow_MinMax_UP
               nanmin(ElbowAngle_CS_AK_M_SD_start_end_min_max_UpTrys(:,9)) nanmax(ElbowAngle_CS_AK_M_SD_start_end_min_max_UpTrys(:,11))];
           AngElbow_MinMax_DOWN = [AngElbow_MinMax_DOWN
               nanmin(ElbowAngle_CS_AK_M_SD_start_end_min_max_DownTrys(:,9)) nanmax(ElbowAngle_CS_AK_M_SD_start_end_min_max_DownTrys(:,11))];
           
           
        j = j+1;
        
        
    end
    
    
end


save('FinalResultsP12','RA_UP','RA_DOWN','RA_SD_UP','RA_SD_DOWN','RtPa_UP','RtPa_DOWN','RtPa_SD_UP','RtPa_SD_DOWN','RtPd_UP','RtPd_DOWN','RtPd_SD_UP','RtPd_SD_DOWN','EAng_ALL','EAng_UP','EAng_DOWN','EAng_SD_ALL','EAng_SD_UP','EAng_SD_DOWN','ECon_ALL','ECon_UP','ECon_DOWN','EVar_ALL','EVar_UP','EVar_DOWN','T_ALL','T_UP','T_DOWN','T_SD_ALL','T_SD_UP','T_SD_DOWN','AMP_ALL','AMP_UP','AMP_DOWN','AMP_SD_ALL','AMP_SD_UP','AMP_SD_DOWN','Vmax_ALL','Vmax_UP','Vmax_DOWN','Vmax_SD_ALL','Vmax_SD_UP','Vmax_SD_DOWN','DevLat_ALL','DevLat_UP','DevLat_DOWN','DevLat_SD_ALL','DevLat_SD_UP','DevLat_SD_DOWN','DevLat_MinMax_ALL','DevLat_MinMax_UP','DevLat_MinMax_DOWN','AngWrist_ALL','AngWrist_UP','AngWrist_DOWN','AngWrist_SD_ALL','AngWrist_SD_UP','AngWrist_SD_DOWN','AngWrist_MinMax_ALL','AngWrist_MinMax_UP','AngWrist_MinMax_DOWN','AngElbow_ALL','AngElbow_UP','AngElbow_DOWN','AngElbow_SD_ALL','AngElbow_SD_UP','AngElbow_SD_DOWN','AngElbow_MinMax_ALL','AngElbow_MinMax_UP','AngElbow_MinMax_DOWN');