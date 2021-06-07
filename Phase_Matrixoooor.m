RESULTS_folder = {uigetdir};


T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_All = [];
T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_Up = [];
T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_Down = [];
T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD_All = [];
T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD_Up = [];
T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD_Down = [];


RA_RtPa_RtPd_All = [];
RA_RtPa_RtPd_Up = [];
RA_RtPa_RtPd_Down = [];
RA_RtPa_RtPd_M_SD_All = [];
RA_RtPa_RtPd_M_SD_Up = [];
RA_RtPa_RtPd_M_SD_Down = [];


LateralDeviation_All = [];
LateralDeviation_Up = [];
LateralDeviation_Down = [];
LateralDeviation_M_SD_Min_Max_All = [];
LateralDeviation_M_SD_Min_Max_Up = [];
LateralDeviation_M_SD_Min_Max_Down = [];


FinalPosition_Up = [];
FinalPosition_Down = [];
FinalPosition_M_SD_Min_Max_Up = [];
FinalPosition_M_SD_Min_Max_Down = [];
ZMax_Up = [];
ZMax_Down = [];
Shoulder_FinalP_Up = [];
Shoulder_FinalP_Down = [];
Shoulder_FinalP_M_SD_Min_Max_Up = [];
Shoulder_FinalP_M_SD_Min_Max_Down = [];


NofVPeaks_Up = [];
NofVPeaks_Down = [];
PositionAfterMaxVPeak_10_20_30_Up = [];
PositionAfterMaxVPeak_10_20_30_Down = [];
PositionAfterMaxVPeak_10_20_30_M_SD_Min_Max_Up = [];
PositionAfterMaxVPeak_10_20_30_M_SD_Min_Max_Down = [];
Shoulder_PAfterMaxVPeak_10_20_30_Up = [];
Shoulder_PAfterMaxVPeak_10_20_30_Down = [];
Shoulder_PAfterMaxVPeak_10_20_30_M_SD_Min_Max_Up = [];
Shoulder_PAfterMaxVPeak_10_20_30_M_SD_Min_Max_Down = [];


FingerPosition_All = [];
FingerPosition_Up = [];
FingerPosition_Down = [];
FingerPosition_XYZ_M_SD_Min_Max_AMP_All = [];
FingerPosition_XYZ_M_SD_Min_Max_AMP_Up = [];
FingerPosition_XYZ_M_SD_Min_Max_AMP_Down = [];


ShoulderPosition_All = [];
ShoulderPosition_Up = [];
ShoulderPosition_Down = [];
ShoulderPosition_XYZ_M_SD_Min_Max_AMP_All = [];
ShoulderPosition_XYZ_M_SD_Min_Max_AMP_Up = [];
ShoulderPosition_XYZ_M_SD_Min_Max_AMP_Down = [];


TargetUp = [];
TargetDown = [];


ArmLength_All = [];
ArmLength_Up = [];
ArmLength_Down = [];
ArmLength_M_SD_start_end_min_max_All = [];
ArmLength_M_SD_start_end_min_max_Up = [];
ArmLength_M_SD_start_end_min_max_Down = [];


ElbowAngle_CauchySchwartz_AlKashi_All = [];
ElbowAngle_CauchySchwartz_AlKashi_Up = [];
ElbowAngle_CauchySchwartz_AlKashi_Down = [];
ElbowAngle_CS_AK_M_SD_start_end_min_max_All = [];
ElbowAngle_CS_AK_M_SD_start_end_min_max_Up = [];
ElbowAngle_CS_AK_M_SD_start_end_min_max_Down = [];


WristAngle_CauchySchwartz_AlKashi_All = [];
WristAngle_CauchySchwartz_AlKashi_Up = [];
WristAngle_CauchySchwartz_AlKashi_Down = [];
WristAngle_CS_AK_M_SD_start_end_min_max_All = [];
WristAngle_CS_AK_M_SD_start_end_min_max_Up = [];
WristAngle_CS_AK_M_SD_start_end_min_max_Down = [];


Velocity_All = [];
Velocity_Up = [];
Velocity_Down = [];
Velocity_M_SD_Min_Max_All = [];
Velocity_M_SD_Min_Max_Up = [];
Velocity_M_SD_Min_Max_Down = [];
Velocity_Normalized_All = [];
Velocity_Normalized_Up = [];
Velocity_Normalized_Down = [];


FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Up = [];
FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_M_SD_Up = [];
FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Up = [];
FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_M_SD_Up = [];
AnglePerfectAngleTry_FinalP_PAfterMaxVP_10_20_30_Up = [];
ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Up = [];
ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_M_SD_min_max_Up = [];


FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Down = [];
FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_M_SD_Down = [];
FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Down = [];
FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_M_SD_Down = [];
AnglePerfectAngleTry_FinalP_PAfterMaxVP_10_20_30_Down = [];
ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Down = [];
ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_M_SD_min_max_Down = [];


ErreurConstante_FinalP_PAfterMaxVP_10_20_30_Up = [];
ErreurConstante_FinalP_PAfterMaxVP_10_20_30_Down = [];
ErreurVariable_FinalP_PAfterMaxVP_10_20_30_Up = [];
ErreurVariable_FinalP_PAfterMaxVP_10_20_30_Down = [];


j = 1;



for i = 1:length(RESULTS_folder)
   R_lst = dir(fullfile(RESULTS_folder{i},'Results_*'));
   
   
    while j < 19
        
         
        load(['Results_S' num2str(j) '_P4.mat']);
        
        
        T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_All = [T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_All
            T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax];
        T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_Up = [T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_Up
            T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_UpTrys];
        T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_Down = [T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_Down
            T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_DownTrys];
        T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD_All = [T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD_All
            T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD];
        T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD_Up = [T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD_Up
            T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD_UpTrys];
        T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD_Down = [T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD_Down
            T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD_DownTrys];
        
        
        RA_RtPa_RtPd_All = [RA_RtPa_RtPd_All
            RA_RtPa_RtPd];
        RA_RtPa_RtPd_Up = [RA_RtPa_RtPd_Up
            RA_RtPa_RtPd_UpTrys];
        RA_RtPa_RtPd_Down = [RA_RtPa_RtPd_Down
            RA_RtPa_RtPd_DownTrys];
        RA_RtPa_RtPd_M_SD_All = [RA_RtPa_RtPd_M_SD_All
            RA_RtPa_RtPd_M_SD];
        RA_RtPa_RtPd_M_SD_Up = [RA_RtPa_RtPd_M_SD_Up
            RA_RtPa_RtPd_M_SD_UpTrys];
        RA_RtPa_RtPd_M_SD_Down = [RA_RtPa_RtPd_M_SD_Down
            RA_RtPa_RtPd_M_SD_DownTrys];
        
        
        LateralDeviation_All = [LateralDeviation_All LateralDeviation];
        LateralDeviation_Up = [LateralDeviation_Up LateralDeviation_UpTrys];
        LateralDeviation_Down = [LateralDeviation_Down LateralDeviation_DownTrys];
        LateralDeviation_M_SD_Min_Max_All = [LateralDeviation_M_SD_Min_Max_All
            LateralDeviation_M_SD_Min_Max];
        LateralDeviation_M_SD_Min_Max_Up = [LateralDeviation_M_SD_Min_Max_Up
            LateralDeviation_M_SD_Min_Max_UpTrys];
        LateralDeviation_M_SD_Min_Max_Down = [LateralDeviation_M_SD_Min_Max_Down
            LateralDeviation_M_SD_Min_Max_DownTrys];
        
        
        FinalPosition_Up = [FinalPosition_Up
            FinalPosition_UpTrys];
        FinalPosition_Down = [FinalPosition_Down
            FinalPosition_DownTrys];
        FinalPosition_M_SD_Min_Max_Up = [FinalPosition_M_SD_Min_Max_Up
            FinalPosition_M_SD_Min_Max_UpTrys];
        FinalPosition_M_SD_Min_Max_Down = [FinalPosition_M_SD_Min_Max_Down
            FinalPosition_M_SD_Min_Max_DownTrys];
        ZMax_Up = [ZMax_Up
            ZMax_Ind_XYZ_UpTrys];
        ZMax_Down = [ZMax_Down
            ZMax_Ind_XYZ_DownTrys];
        Shoulder_FinalP_Up = [Shoulder_FinalP_Up
            Shoulder_FinalP_UpTrys];
        Shoulder_FinalP_Down = [Shoulder_FinalP_Down
            Shoulder_FinalP_DownTrys];
        Shoulder_FinalP_M_SD_Min_Max_Up = [Shoulder_FinalP_M_SD_Min_Max_Up
            Shoulder_FinalP_M_SD_Min_Max_UpTrys];
        Shoulder_FinalP_M_SD_Min_Max_Down = [Shoulder_FinalP_M_SD_Min_Max_Down
            Shoulder_FinalP_M_SD_Min_Max_DownTrys];
        
        
        NofVPeaks_Up = [NofVPeaks_Up
            NofVPeaks_UpTrys];
        NofVPeaks_Down = [NofVPeaks_Down
            NofVPeaks_DownTrys];
        PositionAfterMaxVPeak_10_20_30_Up = [PositionAfterMaxVPeak_10_20_30_Up
            PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys];
        PositionAfterMaxVPeak_10_20_30_Down = [PositionAfterMaxVPeak_10_20_30_Down
            PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys];
        PositionAfterMaxVPeak_10_20_30_M_SD_Min_Max_Up = [PositionAfterMaxVPeak_10_20_30_M_SD_Min_Max_Up
            PositionAfterMaxVPeak_Ind_XYZ_10_20_30_M_SD_Min_Max_UpTrys];
        PositionAfterMaxVPeak_10_20_30_M_SD_Min_Max_Down = [PositionAfterMaxVPeak_10_20_30_M_SD_Min_Max_Down
            PositionAfterMaxVPeak_Ind_XYZ_10_20_30_M_SD_Min_Max_DownTrys];
        Shoulder_PAfterMaxVPeak_10_20_30_Up = [Shoulder_PAfterMaxVPeak_10_20_30_Up
            Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys];
        Shoulder_PAfterMaxVPeak_10_20_30_Down = [Shoulder_PAfterMaxVPeak_10_20_30_Down
            Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys];
        Shoulder_PAfterMaxVPeak_10_20_30_M_SD_Min_Max_Up = [Shoulder_PAfterMaxVPeak_10_20_30_M_SD_Min_Max_Up
            Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_M_SD_Min_Max_UpTrys];
        Shoulder_PAfterMaxVPeak_10_20_30_M_SD_Min_Max_Down = [Shoulder_PAfterMaxVPeak_10_20_30_M_SD_Min_Max_Down
            Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_M_SD_Min_Max_DownTrys];

        
        FingerPosition_All = [FingerPosition_All FingerPosition];
        FingerPosition_Up = [FingerPosition_Up FingerPosition_UpTrys];
        FingerPosition_Down = [FingerPosition_Down FingerPosition_DownTrys];
        FingerPosition_XYZ_M_SD_Min_Max_AMP_All = [FingerPosition_XYZ_M_SD_Min_Max_AMP_All
            FingerPosition_XYZ_M_SD_Min_Max_AMP];
        FingerPosition_XYZ_M_SD_Min_Max_AMP_Up = [FingerPosition_XYZ_M_SD_Min_Max_AMP_Up
            FingerPosition_XYZ_M_SD_Min_Max_AMP_UpTrys];
        FingerPosition_XYZ_M_SD_Min_Max_AMP_Down = [FingerPosition_XYZ_M_SD_Min_Max_AMP_Down
            FingerPosition_XYZ_M_SD_Min_Max_AMP_DownTrys];

        
        ShoulderPosition_All = [ShoulderPosition_All ShoulderPosition];
        ShoulderPosition_Up = [ShoulderPosition_Up ShoulderPosition_UpTrys];
        ShoulderPosition_Down = [ShoulderPosition_Down ShoulderPosition_DownTrys];
        ShoulderPosition_XYZ_M_SD_Min_Max_AMP_All = [ShoulderPosition_XYZ_M_SD_Min_Max_AMP_All
            ShoulderPosition_XYZ_M_SD_Min_Max_AMP];
        ShoulderPosition_XYZ_M_SD_Min_Max_AMP_Up = [ShoulderPosition_XYZ_M_SD_Min_Max_AMP_Up
            ShoulderPosition_XYZ_M_SD_Min_Max_AMP_UpTrys];
        ShoulderPosition_XYZ_M_SD_Min_Max_AMP_Down = [ShoulderPosition_XYZ_M_SD_Min_Max_AMP_Down
            ShoulderPosition_XYZ_M_SD_Min_Max_AMP_DownTrys];
        
        
        TargetUp = [TargetUp
            TargetUp];
        TargetDown = [TargetDown
            TargetDown];
        
        
        ArmLength_All = [ArmLength_All ArmLength];
        ArmLength_Up = [ArmLength_Up ArmLength_UpTrys];
        ArmLength_Down = [ArmLength_Down ArmLength_DownTrys];
        ArmLength_M_SD_start_end_min_max_All = [ArmLength_M_SD_start_end_min_max_All
            ArmLength_M_SD_start_end_min_max];
        ArmLength_M_SD_start_end_min_max_Up = [ArmLength_M_SD_start_end_min_max_Up
            ArmLength_M_SD_start_end_min_max_UpTrys];
        ArmLength_M_SD_start_end_min_max_Down = [ArmLength_M_SD_start_end_min_max_Down
            ArmLength_M_SD_start_end_min_max_DownTrys];
        
        
        ElbowAngle_CauchySchwartz_AlKashi_All = [ElbowAngle_CauchySchwartz_AlKashi_All ElbowAngle_CauchySchwartz_AlKashi];
        ElbowAngle_CauchySchwartz_AlKashi_Up = [ElbowAngle_CauchySchwartz_AlKashi_Up ElbowAngle_CauchySchwartz_AlKashi_UpTrys];
        ElbowAngle_CauchySchwartz_AlKashi_Down = [ElbowAngle_CauchySchwartz_AlKashi_Down ElbowAngle_CauchySchwartz_AlKashi_DownTrys];
        ElbowAngle_CS_AK_M_SD_start_end_min_max_All = [ElbowAngle_CS_AK_M_SD_start_end_min_max_All
            ElbowAngle_CS_AK_M_SD_start_end_min_max];
        ElbowAngle_CS_AK_M_SD_start_end_min_max_Up = [ElbowAngle_CS_AK_M_SD_start_end_min_max_Up
            ElbowAngle_CS_AK_M_SD_start_end_min_max_UpTrys];
        ElbowAngle_CS_AK_M_SD_start_end_min_max_Down = [ElbowAngle_CS_AK_M_SD_start_end_min_max_Down
            ElbowAngle_CS_AK_M_SD_start_end_min_max_DownTrys];
        
        
        WristAngle_CauchySchwartz_AlKashi_All = [WristAngle_CauchySchwartz_AlKashi_All WristAngle_CauchySchwartz_AlKashi];
        WristAngle_CauchySchwartz_AlKashi_Up = [WristAngle_CauchySchwartz_AlKashi_Up WristAngle_CauchySchwartz_AlKashi_UpTrys];
        WristAngle_CauchySchwartz_AlKashi_Down = [WristAngle_CauchySchwartz_AlKashi_Down WristAngle_CauchySchwartz_AlKashi_DownTrys];
        WristAngle_CS_AK_M_SD_start_end_min_max_All = [WristAngle_CS_AK_M_SD_start_end_min_max_All
            WristAngle_CS_AK_M_SD_start_end_min_max];
        WristAngle_CS_AK_M_SD_start_end_min_max_Up = [WristAngle_CS_AK_M_SD_start_end_min_max_Up
            WristAngle_CS_AK_M_SD_start_end_min_max_UpTrys];
        WristAngle_CS_AK_M_SD_start_end_min_max_Down = [WristAngle_CS_AK_M_SD_start_end_min_max_Down
            WristAngle_CS_AK_M_SD_start_end_min_max_DownTrys];
        
        
        Velocity_All = [Velocity_All Velocity];
        Velocity_Up = [Velocity_Up Velocity_UpTrys];
        Velocity_Down = [Velocity_Down Velocity_DownTrys];
        Velocity_M_SD_Min_Max_All = [Velocity_M_SD_Min_Max_All
            Velocity_M_SD_Min_Max];
        Velocity_M_SD_Min_Max_Up = [Velocity_M_SD_Min_Max_Up
            Velocity_M_SD_Min_Max_UpTrys];
        Velocity_M_SD_Min_Max_Down = [Velocity_M_SD_Min_Max_Down
            Velocity_M_SD_Min_Max_DownTrys];
        Velocity_Normalized_All = [Velocity_Normalized_All Velocity_Normalized];
        Velocity_Normalized_Up = [Velocity_Normalized_Up Velocity_Normalized_UpTrys];
        Velocity_Normalized_Down = [Velocity_Normalized_Down Velocity_Normalized_DownTrys];
        
        
        FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Up = [FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Up
            FingerTargetUp_XYZ_FinalP_PAfterMaxVPeak_10_20_30];
        FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_M_SD_Up = [FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_M_SD_Up
            FingerTargetUp_XYZ_FinalP_PMaxVPeak_10_20_30_M_SD];
        FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Up = [FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Up
            FingerTargetUp_Tra_Sag_Fro_3D_FinalP_PAfterMaxVPeak_10_20_30];
        FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_M_SD_Up = [FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_M_SD_Up
            FingerTargetUp_Tra_Sag_Fro_3D_FinalP_PMaxVPeak_10_20_30_M_SD];
        AnglePerfectAngleTry_FinalP_PAfterMaxVP_10_20_30_Up = [AnglePerfectAngleTry_FinalP_PAfterMaxVP_10_20_30_Up
            AnglePerfectAngleTryUp_FinalP_PAfterMaxVPeak_10_20_30];
        ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Up = [ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Up
            ErreurAngulaireUp_FinalP_PAfterMaxVPeak_10_20_30];
        ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_M_SD_min_max_Up = [ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_M_SD_min_max_Up
            ErreurAngulaireUp_FinalP_PAfterMaxVPeak_10_20_30_M_SD_min_max];
        
        
        FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Down = [FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Down
            FingerTargetDown_XYZ_FinalP_PAfterMaxVPeak_10_20_30];
        FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_M_SD_Down = [FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_M_SD_Down
            FingerTargetDown_XYZ_FinalP_PMaxVPeak_10_20_30_M_SD];
        FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Down = [FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Down
            FingerTargetDown_Tra_Sag_Fro_3D_FinalP_PAfterMaxVPeak_10_20_30];
        FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_M_SD_Down = [FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_M_SD_Down
            FingerTargetDown_Tra_Sag_Fro_3D_FinalP_PMaxVPeak_10_20_30_M_SD];
        AnglePerfectAngleTry_FinalP_PAfterMaxVP_10_20_30_Down = [AnglePerfectAngleTry_FinalP_PAfterMaxVP_10_20_30_Down
            AnglePerfectAngleTryDown_FinalP_PAfterMaxVPeak_10_20_30];
        ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Down = [ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Down
            ErreurAngulaireDown_FinalP_PAfterMaxVPeak_10_20_30];
        ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_M_SD_min_max_Down = [ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_M_SD_min_max_Down
            ErreurAngulaireDown_FinalP_PAfterMaxVPeak_10_20_30_M_SD_min_max];
        
        
        ErreurConstante_FinalP_PAfterMaxVP_10_20_30_Up = [ErreurConstante_FinalP_PAfterMaxVP_10_20_30_Up
            ErreurConstanteUp_FinalP_PAfterMaxVPeak_10_20_30];
        ErreurConstante_FinalP_PAfterMaxVP_10_20_30_Down = [ErreurConstante_FinalP_PAfterMaxVP_10_20_30_Down
            ErreurConstanteDown_FinalP_PAfterMaxVPeak_10_20_30];
        ErreurVariable_FinalP_PAfterMaxVP_10_20_30_Up = [ErreurVariable_FinalP_PAfterMaxVP_10_20_30_Up
            ErreurVariableUp_FinalP_PAfterMaxVPeak_10_20_30];
        ErreurVariable_FinalP_PAfterMaxVP_10_20_30_Down = [ErreurVariable_FinalP_PAfterMaxVP_10_20_30_Down
            ErreurVariableDown_FinalP_PAfterMaxVPeak_10_20_30];
        
        
        j = j+1; 
        
        
    end
    
    
    save('Results_P4','T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_All','T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_Up','T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_Down','T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD_All','T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD_Up','T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD_Down','RA_RtPa_RtPd_All','RA_RtPa_RtPd_Up','RA_RtPa_RtPd_Down','RA_RtPa_RtPd_M_SD_All','RA_RtPa_RtPd_M_SD_Up','RA_RtPa_RtPd_M_SD_Down','LateralDeviation_All','LateralDeviation_Up','LateralDeviation_Down','LateralDeviation_M_SD_Min_Max_All','LateralDeviation_M_SD_Min_Max_Up','LateralDeviation_M_SD_Min_Max_Down','FinalPosition_Up','FinalPosition_Down','FinalPosition_M_SD_Min_Max_Up','FinalPosition_M_SD_Min_Max_Down','ZMax_Up','ZMax_Down','Shoulder_FinalP_Up','Shoulder_FinalP_Down','Shoulder_FinalP_M_SD_Min_Max_Up','Shoulder_FinalP_M_SD_Min_Max_Down','NofVPeaks_Up','NofVPeaks_Down','PositionAfterMaxVPeak_10_20_30_Up','PositionAfterMaxVPeak_10_20_30_Down','PositionAfterMaxVPeak_10_20_30_M_SD_Min_Max_Up','PositionAfterMaxVPeak_10_20_30_M_SD_Min_Max_Down','Shoulder_PAfterMaxVPeak_10_20_30_Up','Shoulder_PAfterMaxVPeak_10_20_30_Down','Shoulder_PAfterMaxVPeak_10_20_30_M_SD_Min_Max_Up','Shoulder_PAfterMaxVPeak_10_20_30_M_SD_Min_Max_Down','FingerPosition_All','FingerPosition_Up','FingerPosition_Down','FingerPosition_XYZ_M_SD_Min_Max_AMP_All','FingerPosition_XYZ_M_SD_Min_Max_AMP_Up','FingerPosition_XYZ_M_SD_Min_Max_AMP_Down','ShoulderPosition_All','ShoulderPosition_Up','ShoulderPosition_Down','ShoulderPosition_XYZ_M_SD_Min_Max_AMP_All','ShoulderPosition_XYZ_M_SD_Min_Max_AMP_Up','ShoulderPosition_XYZ_M_SD_Min_Max_AMP_Down','TargetUp','TargetDown','ArmLength_All','ArmLength_Up','ArmLength_Down','ArmLength_M_SD_start_end_min_max_All','ArmLength_M_SD_start_end_min_max_Up','ArmLength_M_SD_start_end_min_max_Down','ElbowAngle_CauchySchwartz_AlKashi_All','ElbowAngle_CauchySchwartz_AlKashi_Up','ElbowAngle_CauchySchwartz_AlKashi_Down','ElbowAngle_CS_AK_M_SD_start_end_min_max_All','ElbowAngle_CS_AK_M_SD_start_end_min_max_Up','ElbowAngle_CS_AK_M_SD_start_end_min_max_Down','WristAngle_CauchySchwartz_AlKashi_All','WristAngle_CauchySchwartz_AlKashi_Up','WristAngle_CauchySchwartz_AlKashi_Down','WristAngle_CS_AK_M_SD_start_end_min_max_All','WristAngle_CS_AK_M_SD_start_end_min_max_Up','WristAngle_CS_AK_M_SD_start_end_min_max_Down','Velocity_All','Velocity_Up','Velocity_Down','Velocity_M_SD_Min_Max_All','Velocity_M_SD_Min_Max_Up','Velocity_M_SD_Min_Max_Down','Velocity_Normalized_All','Velocity_Normalized_Up','Velocity_Normalized_Down','FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Up','FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_M_SD_Up','FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Up','FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_M_SD_Up','AnglePerfectAngleTry_FinalP_PAfterMaxVP_10_20_30_Up','ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Up','ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_M_SD_min_max_Up','FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Down','FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_M_SD_Down','FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Down','FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_M_SD_Down','AnglePerfectAngleTry_FinalP_PAfterMaxVP_10_20_30_Down','ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Down','ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_M_SD_min_max_Down','ErreurConstante_FinalP_PAfterMaxVP_10_20_30_Up','ErreurConstante_FinalP_PAfterMaxVP_10_20_30_Down','ErreurVariable_FinalP_PAfterMaxVP_10_20_30_Up','ErreurVariable_FinalP_PAfterMaxVP_10_20_30_Down');

      
end