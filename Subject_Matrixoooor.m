RA_folder = {uigetdir};

T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_ALL = [];
T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_UP = [];
T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_DOWN = [];
T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD_ALL = [];
T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD_UP = [];
T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD_DOWN = [];


RA_RtPa_RtPd_ALL = [];
RA_RtPa_RtPd_UP = [];
RA_RtPa_RtPd_DOWN = [];
RA_RtPa_RtPd_M_SD_ALL = [];
RA_RtPa_RtPd_M_SD_UP = [];
RA_RtPa_RtPd_M_SD_DOWN = [];


LateralDeviation_ALL = [];
LateralDeviation_UP = [];
LateralDeviation_DOWN = [];
LateralDeviation_M_SD_Min_Max_ALL = [];
LateralDeviation_M_SD_Min_Max_UP = [];
LateralDeviation_M_SD_Min_Max_DOWN = [];


FinalPosition_UP = [];
FinalPosition_DOWN = [];
FinalPosition_M_SD_Min_Max_UP = [];
FinalPosition_M_SD_Min_Max_DOWN = [];
ZMax_UP = [];
ZMax_DOWN = [];
Shoulder_FinalP_UP = [];
Shoulder_FinalP_DOWN = [];
Shoulder_FinalP_M_SD_Min_Max_UP = [];
Shoulder_FinalP_M_SD_Min_Max_DOWN = [];


NofVPeaks_UP = [];
NofVPeaks_DOWN = [];
PositionAfterMaxVPeak_10_20_30_UP = [];
PositionAfterMaxVPeak_10_20_30_DOWN = [];
PositionAfterMaxVPeak_10_20_30_M_SD_Min_Max_UP = [];
PositionAfterMaxVPeak_10_20_30_M_SD_Min_Max_DOWN = [];
Shoulder_PAfterMaxVPeak_10_20_30_UP = [];
Shoulder_PAfterMaxVPeak_10_20_30_DOWN = [];
Shoulder_PAfterMaxVPeak_10_20_30_M_SD_Min_Max_UP = [];
Shoulder_PAfterMaxVPeak_10_20_30_M_SD_Min_Max_DOWN = [];


FingerPosition_ALL = [];
FingerPosition_UP = [];
FingerPosition_DOWN = [];
FingerPosition_XYZ_M_SD_Min_Max_AMP_ALL = [];
FingerPosition_XYZ_M_SD_Min_Max_AMP_UP = [];
FingerPosition_XYZ_M_SD_Min_Max_AMP_DOWN = [];


ShoulderPosition_ALL = [];
ShoulderPosition_UP = [];
ShoulderPosition_DOWN = [];
ShoulderPosition_XYZ_M_SD_Min_Max_AMP_ALL = [];
ShoulderPosition_XYZ_M_SD_Min_Max_AMP_UP = [];
ShoulderPosition_XYZ_M_SD_Min_Max_AMP_DOWN = [];


TargetUP = [];
TargetDOWN = [];


ArmLength_ALL = [];
ArmLength_UP = [];
ArmLength_DOWN = [];
ArmLength_M_SD_start_end_min_max_ALL = [];
ArmLength_M_SD_start_end_min_max_UP = [];
ArmLength_M_SD_start_end_min_max_DOWN = [];


ElbowAngle_CauchySchwartz_AlKashi_ALL = [];
ElbowAngle_CauchySchwartz_AlKashi_UP = [];
ElbowAngle_CauchySchwartz_AlKashi_DOWN = [];
ElbowAngle_CS_AK_M_SD_start_end_min_max_ALL = [];
ElbowAngle_CS_AK_M_SD_start_end_min_max_UP = [];
ElbowAngle_CS_AK_M_SD_start_end_min_max_DOWN = [];


WristAngle_CauchySchwartz_AlKashi_ALL = [];
WristAngle_CauchySchwartz_AlKashi_UP = [];
WristAngle_CauchySchwartz_AlKashi_DOWN = [];
WristAngle_CS_AK_M_SD_start_end_min_max_ALL = [];
WristAngle_CS_AK_M_SD_start_end_min_max_UP = [];
WristAngle_CS_AK_M_SD_start_end_min_max_DOWN = [];


Velocity_ALL = [];
Velocity_UP = [];
Velocity_DOWN = [];
Velocity_M_SD_Min_Max_ALL = [];
Velocity_M_SD_Min_Max_UP = [];
Velocity_M_SD_Min_Max_DOWN = [];
Velocity_Normalized_ALL = [];
Velocity_Normalized_UP = [];
Velocity_Normalized_DOWN = [];


FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_UP = [];
FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_M_SD_UP = [];
FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_UP = [];
FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_M_SD_UP = [];
AnglePerfectAngleTry_FinalP_PAfterMaxVP_10_20_30_UP = [];
ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_UP = [];
ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_M_SD_min_max_UP = [];


FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_DOWN = [];
FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_M_SD_DOWN = [];
FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_DOWN = [];
FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_M_SD_DOWN = [];
AnglePerfectAngleTry_FinalP_PAfterMaxVP_10_20_30_DOWN = [];
ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_DOWN = [];
ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_M_SD_min_max_DOWN = [];


ErreurConstante_FinalP_PAfterMaxVP_10_20_30_UP = [];
ErreurConstante_FinalP_PAfterMaxVP_10_20_30_DOWN = [];
ErreurVariable_FinalP_PAfterMaxVP_10_20_30_UP = [];
ErreurVariable_FinalP_PAfterMaxVP_10_20_30_DOWN = [];


j = 1;

for i = 1:length(RA_folder)
   RA_Vmax_lst = dir(fullfile(RA_folder{i},'RA_Vmax*'));
   
    while j < 13
       
        load(['Results_S18_P' num2str(j) '.mat']);
        
        
        T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_ALL = [T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_ALL
            T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax];
        T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_UP = [T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_UP
            T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_UpTrys];
        T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_DOWN = [T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_DOWN
            T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_DownTrys];
        T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD_ALL = [T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD_ALL
            T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD];
        T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD_UP = [T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD_UP
            T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD_UpTrys];
        T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD_DOWN = [T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD_DOWN
            T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD_DownTrys];
        
        
        RA_RtPa_RtPd_ALL = [RA_RtPa_RtPd_ALL
            RA_RtPa_RtPd];
        RA_RtPa_RtPd_UP = [RA_RtPa_RtPd_UP
            RA_RtPa_RtPd_UpTrys];
        RA_RtPa_RtPd_DOWN = [RA_RtPa_RtPd_DOWN
            RA_RtPa_RtPd_DownTrys];
        RA_RtPa_RtPd_M_SD_ALL = [RA_RtPa_RtPd_M_SD_ALL
            RA_RtPa_RtPd_M_SD];
        RA_RtPa_RtPd_M_SD_UP = [RA_RtPa_RtPd_M_SD_UP
            RA_RtPa_RtPd_M_SD_UpTrys];
        RA_RtPa_RtPd_M_SD_DOWN = [RA_RtPa_RtPd_M_SD_DOWN
            RA_RtPa_RtPd_M_SD_DownTrys];
        
        
        LateralDeviation_ALL = [LateralDeviation_ALL LateralDeviation];
        LateralDeviation_UP = [LateralDeviation_UP LateralDeviation_UpTrys];
        LateralDeviation_DOWN = [LateralDeviation_DOWN LateralDeviation_DownTrys];
        LateralDeviation_M_SD_Min_Max_ALL = [LateralDeviation_M_SD_Min_Max_ALL
            LateralDeviation_M_SD_Min_Max];
        LateralDeviation_M_SD_Min_Max_UP = [LateralDeviation_M_SD_Min_Max_UP
            LateralDeviation_M_SD_Min_Max_UpTrys];
        LateralDeviation_M_SD_Min_Max_DOWN = [LateralDeviation_M_SD_Min_Max_DOWN
            LateralDeviation_M_SD_Min_Max_DownTrys];
        
        
        FinalPosition_UP = [FinalPosition_UP
            FinalPosition_UpTrys];
        FinalPosition_DOWN = [FinalPosition_DOWN
            FinalPosition_DownTrys];
        FinalPosition_M_SD_Min_Max_UP = [FinalPosition_M_SD_Min_Max_UP
            FinalPosition_M_SD_Min_Max_UpTrys];
        FinalPosition_M_SD_Min_Max_DOWN = [FinalPosition_M_SD_Min_Max_DOWN
            FinalPosition_M_SD_Min_Max_DownTrys];
        ZMax_UP = [ZMax_UP
            ZMax_Ind_XYZ_UpTrys];
        ZMax_DOWN = [ZMax_DOWN
            ZMax_Ind_XYZ_DownTrys];
        Shoulder_FinalP_UP = [Shoulder_FinalP_UP
            Shoulder_FinalP_UpTrys];
        Shoulder_FinalP_DOWN = [Shoulder_FinalP_DOWN
            Shoulder_FinalP_DownTrys];
        Shoulder_FinalP_M_SD_Min_Max_UP = [Shoulder_FinalP_M_SD_Min_Max_UP
            Shoulder_FinalP_M_SD_Min_Max_UpTrys];
        Shoulder_FinalP_M_SD_Min_Max_DOWN = [Shoulder_FinalP_M_SD_Min_Max_DOWN
            Shoulder_FinalP_M_SD_Min_Max_DownTrys];
        
        
        NofVPeaks_UP = [NofVPeaks_UP
            NofVPeaks_UpTrys];
        NofVPeaks_DOWN = [NofVPeaks_DOWN
            NofVPeaks_DownTrys];
        PositionAfterMaxVPeak_10_20_30_UP = [PositionAfterMaxVPeak_10_20_30_UP
            PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys];
        PositionAfterMaxVPeak_10_20_30_DOWN = [PositionAfterMaxVPeak_10_20_30_DOWN
            PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys];
        PositionAfterMaxVPeak_10_20_30_M_SD_Min_Max_UP = [PositionAfterMaxVPeak_10_20_30_M_SD_Min_Max_UP
            PositionAfterMaxVPeak_Ind_XYZ_10_20_30_M_SD_Min_Max_UpTrys];
        PositionAfterMaxVPeak_10_20_30_M_SD_Min_Max_DOWN = [PositionAfterMaxVPeak_10_20_30_M_SD_Min_Max_DOWN
            PositionAfterMaxVPeak_Ind_XYZ_10_20_30_M_SD_Min_Max_DownTrys];
        Shoulder_PAfterMaxVPeak_10_20_30_UP = [Shoulder_PAfterMaxVPeak_10_20_30_UP
            Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys];
        Shoulder_PAfterMaxVPeak_10_20_30_DOWN = [Shoulder_PAfterMaxVPeak_10_20_30_DOWN
            Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys];
        Shoulder_PAfterMaxVPeak_10_20_30_M_SD_Min_Max_UP = [Shoulder_PAfterMaxVPeak_10_20_30_M_SD_Min_Max_UP
            Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_M_SD_Min_Max_UpTrys];
        Shoulder_PAfterMaxVPeak_10_20_30_M_SD_Min_Max_DOWN = [Shoulder_PAfterMaxVPeak_10_20_30_M_SD_Min_Max_DOWN
            Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_M_SD_Min_Max_DownTrys];

        
        FingerPosition_ALL = [FingerPosition_ALL FingerPosition];
        FingerPosition_UP = [FingerPosition_UP FingerPosition_UpTrys];
        FingerPosition_DOWN = [FingerPosition_DOWN FingerPosition_DownTrys];
        FingerPosition_XYZ_M_SD_Min_Max_AMP_ALL = [FingerPosition_XYZ_M_SD_Min_Max_AMP_ALL
            FingerPosition_XYZ_M_SD_Min_Max_AMP];
        FingerPosition_XYZ_M_SD_Min_Max_AMP_UP = [FingerPosition_XYZ_M_SD_Min_Max_AMP_UP
            FingerPosition_XYZ_M_SD_Min_Max_AMP_UpTrys];
        FingerPosition_XYZ_M_SD_Min_Max_AMP_DOWN = [FingerPosition_XYZ_M_SD_Min_Max_AMP_DOWN
            FingerPosition_XYZ_M_SD_Min_Max_AMP_DownTrys];

        
        ShoulderPosition_ALL = [ShoulderPosition_ALL ShoulderPosition];
        ShoulderPosition_UP = [ShoulderPosition_UP ShoulderPosition_UpTrys];
        ShoulderPosition_DOWN = [ShoulderPosition_DOWN ShoulderPosition_DownTrys];
        ShoulderPosition_XYZ_M_SD_Min_Max_AMP_ALL = [ShoulderPosition_XYZ_M_SD_Min_Max_AMP_ALL
            ShoulderPosition_XYZ_M_SD_Min_Max_AMP];
        ShoulderPosition_XYZ_M_SD_Min_Max_AMP_UP = [ShoulderPosition_XYZ_M_SD_Min_Max_AMP_UP
            ShoulderPosition_XYZ_M_SD_Min_Max_AMP_UpTrys];
        ShoulderPosition_XYZ_M_SD_Min_Max_AMP_DOWN = [ShoulderPosition_XYZ_M_SD_Min_Max_AMP_DOWN
            ShoulderPosition_XYZ_M_SD_Min_Max_AMP_DownTrys];
        
        
        TargetUP = [TargetUP
            TargetUp];
        TargetDOWN = [TargetDOWN
            TargetDown];
        
        
        ArmLength_ALL = [ArmLength_ALL ArmLength];
        ArmLength_UP = [ArmLength_UP ArmLength_UpTrys];
        ArmLength_DOWN = [ArmLength_DOWN ArmLength_DownTrys];
        ArmLength_M_SD_start_end_min_max_ALL = [ArmLength_M_SD_start_end_min_max_ALL
            ArmLength_M_SD_start_end_min_max];
        ArmLength_M_SD_start_end_min_max_UP = [ArmLength_M_SD_start_end_min_max_UP
            ArmLength_M_SD_start_end_min_max_UpTrys];
        ArmLength_M_SD_start_end_min_max_DOWN = [ArmLength_M_SD_start_end_min_max_DOWN
            ArmLength_M_SD_start_end_min_max_DownTrys];
        
        
        ElbowAngle_CauchySchwartz_AlKashi_ALL = [ElbowAngle_CauchySchwartz_AlKashi_ALL ElbowAngle_CauchySchwartz_AlKashi];
        ElbowAngle_CauchySchwartz_AlKashi_UP = [ElbowAngle_CauchySchwartz_AlKashi_UP ElbowAngle_CauchySchwartz_AlKashi_UpTrys];
        ElbowAngle_CauchySchwartz_AlKashi_DOWN = [ElbowAngle_CauchySchwartz_AlKashi_DOWN ElbowAngle_CauchySchwartz_AlKashi_DownTrys];
        ElbowAngle_CS_AK_M_SD_start_end_min_max_ALL = [ElbowAngle_CS_AK_M_SD_start_end_min_max_ALL
            ElbowAngle_CS_AK_M_SD_start_end_min_max];
        ElbowAngle_CS_AK_M_SD_start_end_min_max_UP = [ElbowAngle_CS_AK_M_SD_start_end_min_max_UP
            ElbowAngle_CS_AK_M_SD_start_end_min_max_UpTrys];
        ElbowAngle_CS_AK_M_SD_start_end_min_max_DOWN = [ElbowAngle_CS_AK_M_SD_start_end_min_max_DOWN
            ElbowAngle_CS_AK_M_SD_start_end_min_max_DownTrys];
        
        
        WristAngle_CauchySchwartz_AlKashi_ALL = [WristAngle_CauchySchwartz_AlKashi_ALL WristAngle_CauchySchwartz_AlKashi];
        WristAngle_CauchySchwartz_AlKashi_UP = [WristAngle_CauchySchwartz_AlKashi_UP WristAngle_CauchySchwartz_AlKashi_UpTrys];
        WristAngle_CauchySchwartz_AlKashi_DOWN = [WristAngle_CauchySchwartz_AlKashi_DOWN WristAngle_CauchySchwartz_AlKashi_DownTrys];
        WristAngle_CS_AK_M_SD_start_end_min_max_ALL = [WristAngle_CS_AK_M_SD_start_end_min_max_ALL
            WristAngle_CS_AK_M_SD_start_end_min_max];
        WristAngle_CS_AK_M_SD_start_end_min_max_UP = [WristAngle_CS_AK_M_SD_start_end_min_max_UP
            WristAngle_CS_AK_M_SD_start_end_min_max_UpTrys];
        WristAngle_CS_AK_M_SD_start_end_min_max_DOWN = [WristAngle_CS_AK_M_SD_start_end_min_max_DOWN
            WristAngle_CS_AK_M_SD_start_end_min_max_DownTrys];
        
        
        Velocity_ALL = [Velocity_ALL Velocity];
        Velocity_UP = [Velocity_UP Velocity_UpTrys];
        Velocity_DOWN = [Velocity_DOWN Velocity_DownTrys];
        Velocity_M_SD_Min_Max_ALL = [Velocity_M_SD_Min_Max_ALL
            Velocity_M_SD_Min_Max];
        Velocity_M_SD_Min_Max_UP = [Velocity_M_SD_Min_Max_UP
            Velocity_M_SD_Min_Max_UpTrys];
        Velocity_M_SD_Min_Max_DOWN = [Velocity_M_SD_Min_Max_DOWN
            Velocity_M_SD_Min_Max_DownTrys];
        Velocity_Normalized_ALL = [Velocity_Normalized_ALL Velocity_Normalized];
        Velocity_Normalized_UP = [Velocity_Normalized_UP Velocity_Normalized_UpTrys];
        Velocity_Normalized_DOWN = [Velocity_Normalized_DOWN Velocity_Normalized_DownTrys];
        
        
        FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_UP = [FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_UP
            FingerTargetUp_XYZ_FinalP_PAfterMaxVPeak_10_20_30];
        FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_M_SD_UP = [FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_M_SD_UP
            FingerTargetUp_XYZ_FinalP_PMaxVPeak_10_20_30_M_SD];
        FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_UP = [FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_UP
            FingerTargetUp_Tra_Sag_Fro_3D_FinalP_PAfterMaxVPeak_10_20_30];
        FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_M_SD_UP = [FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_M_SD_UP
            FingerTargetUp_Tra_Sag_Fro_3D_FinalP_PMaxVPeak_10_20_30_M_SD];
        AnglePerfectAngleTry_FinalP_PAfterMaxVP_10_20_30_UP = [AnglePerfectAngleTry_FinalP_PAfterMaxVP_10_20_30_UP
            AnglePerfectAngleTryUp_FinalP_PAfterMaxVPeak_10_20_30];
        ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_UP = [ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_UP
            ErreurAngulaireUp_FinalP_PAfterMaxVPeak_10_20_30];
        ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_M_SD_min_max_UP = [ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_M_SD_min_max_UP
            ErreurAngulaireUp_FinalP_PAfterMaxVPeak_10_20_30_M_SD_min_max];
        
        
        FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_DOWN = [FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_DOWN
            FingerTargetDown_XYZ_FinalP_PAfterMaxVPeak_10_20_30];
        FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_M_SD_DOWN = [FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_M_SD_DOWN
            FingerTargetDown_XYZ_FinalP_PMaxVPeak_10_20_30_M_SD];
        FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_DOWN = [FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_DOWN
            FingerTargetDown_Tra_Sag_Fro_3D_FinalP_PAfterMaxVPeak_10_20_30];
        FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_M_SD_DOWN = [FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_M_SD_DOWN
            FingerTargetDown_Tra_Sag_Fro_3D_FinalP_PMaxVPeak_10_20_30_M_SD];
        AnglePerfectAngleTry_FinalP_PAfterMaxVP_10_20_30_DOWN = [AnglePerfectAngleTry_FinalP_PAfterMaxVP_10_20_30_DOWN
            AnglePerfectAngleTryDown_FinalP_PAfterMaxVPeak_10_20_30];
        ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_DOWN = [ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_DOWN
            ErreurAngulaireDown_FinalP_PAfterMaxVPeak_10_20_30];
        ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_M_SD_min_max_DOWN = [ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_M_SD_min_max_DOWN
            ErreurAngulaireDown_FinalP_PAfterMaxVPeak_10_20_30_M_SD_min_max];
        
        
        ErreurConstante_FinalP_PAfterMaxVP_10_20_30_UP = [ErreurConstante_FinalP_PAfterMaxVP_10_20_30_UP
            ErreurConstanteUp_FinalP_PAfterMaxVPeak_10_20_30];
        ErreurConstante_FinalP_PAfterMaxVP_10_20_30_DOWN = [ErreurConstante_FinalP_PAfterMaxVP_10_20_30_DOWN
            ErreurConstanteDown_FinalP_PAfterMaxVPeak_10_20_30];
        ErreurVariable_FinalP_PAfterMaxVP_10_20_30_UP = [ErreurVariable_FinalP_PAfterMaxVP_10_20_30_UP
            ErreurVariableUp_FinalP_PAfterMaxVPeak_10_20_30];
        ErreurVariable_FinalP_PAfterMaxVP_10_20_30_DOWN = [ErreurVariable_FinalP_PAfterMaxVP_10_20_30_DOWN
            ErreurVariableDown_FinalP_PAfterMaxVPeak_10_20_30];
        
        
        j = j+1;
        
    end

save('Results_S18','T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_ALL','T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_UP','T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_DOWN','T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD_ALL','T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD_UP','T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD_DOWN','RA_RtPa_RtPd_ALL','RA_RtPa_RtPd_UP','RA_RtPa_RtPd_DOWN','RA_RtPa_RtPd_M_SD_ALL','RA_RtPa_RtPd_M_SD_UP','RA_RtPa_RtPd_M_SD_DOWN','LateralDeviation_ALL','LateralDeviation_UP','LateralDeviation_DOWN','LateralDeviation_M_SD_Min_Max_ALL','LateralDeviation_M_SD_Min_Max_UP','LateralDeviation_M_SD_Min_Max_DOWN','FinalPosition_UP','FinalPosition_DOWN','FinalPosition_M_SD_Min_Max_UP','FinalPosition_M_SD_Min_Max_DOWN','ZMax_UP','ZMax_DOWN','Shoulder_FinalP_UP','Shoulder_FinalP_DOWN','Shoulder_FinalP_M_SD_Min_Max_UP','Shoulder_FinalP_M_SD_Min_Max_DOWN','NofVPeaks_UP','NofVPeaks_DOWN','PositionAfterMaxVPeak_10_20_30_UP','PositionAfterMaxVPeak_10_20_30_DOWN','PositionAfterMaxVPeak_10_20_30_M_SD_Min_Max_UP','PositionAfterMaxVPeak_10_20_30_M_SD_Min_Max_DOWN','Shoulder_PAfterMaxVPeak_10_20_30_UP','Shoulder_PAfterMaxVPeak_10_20_30_DOWN','Shoulder_PAfterMaxVPeak_10_20_30_M_SD_Min_Max_UP','Shoulder_PAfterMaxVPeak_10_20_30_M_SD_Min_Max_DOWN','FingerPosition_ALL','FingerPosition_UP','FingerPosition_DOWN','FingerPosition_XYZ_M_SD_Min_Max_AMP_ALL','FingerPosition_XYZ_M_SD_Min_Max_AMP_UP','FingerPosition_XYZ_M_SD_Min_Max_AMP_DOWN','ShoulderPosition_ALL','ShoulderPosition_UP','ShoulderPosition_DOWN','ShoulderPosition_XYZ_M_SD_Min_Max_AMP_ALL','ShoulderPosition_XYZ_M_SD_Min_Max_AMP_UP','ShoulderPosition_XYZ_M_SD_Min_Max_AMP_DOWN','TargetUP','TargetDOWN','ArmLength_ALL','ArmLength_UP','ArmLength_DOWN','ArmLength_M_SD_start_end_min_max_ALL','ArmLength_M_SD_start_end_min_max_UP','ArmLength_M_SD_start_end_min_max_DOWN','ElbowAngle_CauchySchwartz_AlKashi_ALL','ElbowAngle_CauchySchwartz_AlKashi_UP','ElbowAngle_CauchySchwartz_AlKashi_DOWN','ElbowAngle_CS_AK_M_SD_start_end_min_max_ALL','ElbowAngle_CS_AK_M_SD_start_end_min_max_UP','ElbowAngle_CS_AK_M_SD_start_end_min_max_DOWN','WristAngle_CauchySchwartz_AlKashi_ALL','WristAngle_CauchySchwartz_AlKashi_UP','WristAngle_CauchySchwartz_AlKashi_DOWN','WristAngle_CS_AK_M_SD_start_end_min_max_ALL','WristAngle_CS_AK_M_SD_start_end_min_max_UP','WristAngle_CS_AK_M_SD_start_end_min_max_DOWN','Velocity_ALL','Velocity_UP','Velocity_DOWN','Velocity_M_SD_Min_Max_ALL','Velocity_M_SD_Min_Max_UP','Velocity_M_SD_Min_Max_DOWN','Velocity_Normalized_ALL','Velocity_Normalized_UP','Velocity_Normalized_DOWN','FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_UP','FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_M_SD_UP','FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_UP','FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_M_SD_UP','AnglePerfectAngleTry_FinalP_PAfterMaxVP_10_20_30_UP','ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_UP','ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_M_SD_min_max_UP','FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_DOWN','FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_M_SD_DOWN','FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_DOWN','FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_M_SD_DOWN','AnglePerfectAngleTry_FinalP_PAfterMaxVP_10_20_30_DOWN','ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_DOWN','ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_M_SD_min_max_DOWN','ErreurConstante_FinalP_PAfterMaxVP_10_20_30_UP','ErreurConstante_FinalP_PAfterMaxVP_10_20_30_DOWN','ErreurVariable_FinalP_PAfterMaxVP_10_20_30_UP','ErreurVariable_FinalP_PAfterMaxVP_10_20_30_DOWN');
        
end