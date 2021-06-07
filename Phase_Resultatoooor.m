RESULTS_folder = {uigetdir};


T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD_ALL = [];
T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD_UP = [];
T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD_DOWN = [];


RA_RtPa_RtPd_M_SD_ALL = [];
RA_RtPa_RtPd_M_SD_UP = [];
RA_RtPa_RtPd_M_SD_DOWN = [];


LateralDeviation_M_SD_Min_Max_ALL = [];
LateralDeviation_M_SD_Min_Max_UP = [];
LateralDeviation_M_SD_Min_Max_DOWN = [];


FingerPosition_AMP_XYZ_M_SD_ALL = [];
FingerPosition_AMP_XYZ_M_SD_UP = [];
FingerPosition_AMP_XYZ_M_SD_DOWN = [];


ShoulderPosition_AMP_XYZ_M_SD_ALL = [];
ShoulderPosition_AMP_XYZ_M_SD_UP = [];
ShoulderPosition_AMP_XYZ_M_SD_DOWN = [];


ArmLength_M_SD_ALL = [];
ArmLength_M_SD_UP = [];
ArmLength_M_SD_DOWN = [];


ElbowAngle_CS_AK_M_SD_Min_Max_ALL = [];
ElbowAngle_CS_AK_M_SD_Min_Max_UP = [];
ElbowAngle_CS_AK_M_SD_Min_Max_DOWN = [];
WristAngle_CS_AK_M_SD_Min_Max_ALL = [];
WristAngle_CS_AK_M_SD_Min_Max_UP = [];
WristAngle_CS_AK_M_SD_Min_Max_DOWN = [];


Velocity_Max_M_SD_ALL = [];
Velocity_Max_M_SD_UP = [];
Velocity_Max_M_SD_DOWN = [];


FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_M_SD_UP = [];
FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_M_SD_UP = [];
ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_M_SD_Min_Max_UP = [];


FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_M_SD_DOWN = [];
FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_M_SD_DOWN = [];
ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_M_SD_Min_Max_DOWN = [];


ErreurConstante_FinalP_PAfterMaxVP_10_20_30_M_SD_Min_Max_UP = [];
ErreurConstante_FinalP_PAfterMaxVP_10_20_30_M_SD_Min_Max_DOWN = [];
ErreurVariable_FinalP_PAfterMaxVP_10_20_30_M_SD_Min_Max_UP = [];
ErreurVariable_FinalP_PAfterMaxVP_10_20_30_M_SD_Min_Max_DOWN = [];

        
j = 1;


for i = 1:length(RESULTS_folder)
   R_lst = dir(fullfile(RESULTS_folder{i},'Results*'));
   
   
    while j < 13
       
        
        load(['Results_P' num2str(j) '.mat']);
        
        
        T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD_ALL = [T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD_ALL
            mean(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_All(:,1)) std(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_All(:,1)) mean(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_All(:,2)) std(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_All(:,2)) mean(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_All(:,3)) std(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_All(:,3)) mean(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_All(:,4)) std(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_All(:,4)) mean(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_All(:,5)) std(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_All(:,5))];
        T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD_UP = [T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD_UP
            mean(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_Up(:,1)) std(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_Up(:,1)) mean(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_Up(:,2)) std(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_Up(:,2)) mean(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_Up(:,3)) std(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_Up(:,3)) mean(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_Up(:,4)) std(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_Up(:,4)) mean(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_Up(:,5)) std(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_Up(:,5))];
        T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD_DOWN = [T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD_DOWN
            mean(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_Down(:,1)) std(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_Down(:,1)) mean(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_Down(:,2)) std(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_Down(:,2)) mean(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_Down(:,3)) std(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_Down(:,3)) mean(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_Down(:,4)) std(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_Down(:,4)) mean(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_Down(:,5)) std(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_Down(:,5))];
       
        
        RA_RtPa_RtPd_M_SD_ALL = [RA_RtPa_RtPd_M_SD_ALL
            mean(RA_RtPa_RtPd_All(:,1)) std(RA_RtPa_RtPd_All(:,1)) mean(RA_RtPa_RtPd_All(:,2)) std(RA_RtPa_RtPd_All(:,2)) mean(RA_RtPa_RtPd_All(:,3)) std(RA_RtPa_RtPd_All(:,3))];
        RA_RtPa_RtPd_M_SD_UP = [RA_RtPa_RtPd_M_SD_UP
            mean(RA_RtPa_RtPd_Up(:,1)) std(RA_RtPa_RtPd_Up(:,1)) mean(RA_RtPa_RtPd_Up(:,2)) std(RA_RtPa_RtPd_Up(:,2)) mean(RA_RtPa_RtPd_Up(:,3)) std(RA_RtPa_RtPd_Up(:,3))];
        RA_RtPa_RtPd_M_SD_DOWN = [RA_RtPa_RtPd_M_SD_DOWN
            mean(RA_RtPa_RtPd_Down(:,1)) std(RA_RtPa_RtPd_Down(:,1)) mean(RA_RtPa_RtPd_Down(:,2)) std(RA_RtPa_RtPd_Down(:,2)) mean(RA_RtPa_RtPd_Down(:,3)) std(RA_RtPa_RtPd_Down(:,3))];
        
        
        LateralDeviation_M_SD_Min_Max_ALL = [LateralDeviation_M_SD_Min_Max_ALL
            mean(nanmean(LateralDeviation_All)) mean(nanstd(LateralDeviation_All)) mean(nanmin(LateralDeviation_All)) mean(nanmax(LateralDeviation_All))];
        LateralDeviation_M_SD_Min_Max_UP = [LateralDeviation_M_SD_Min_Max_UP
            mean(nanmean(LateralDeviation_Up)) mean(nanstd(LateralDeviation_Up)) mean(nanmin(LateralDeviation_Up)) mean(nanmax(LateralDeviation_Up))];
        LateralDeviation_M_SD_Min_Max_DOWN = [LateralDeviation_M_SD_Min_Max_DOWN
            nanmean(nanmean(LateralDeviation_Down)) nanmean(nanstd(LateralDeviation_Down)) nanmean(nanmin(LateralDeviation_Down)) nanmean(nanmax(LateralDeviation_Down))];

        
        FingerPosition_AMP_XYZ_M_SD_ALL = [FingerPosition_AMP_XYZ_M_SD_ALL
            mean(FingerPosition_XYZ_M_SD_Min_Max_AMP_All(:,5)) std(FingerPosition_XYZ_M_SD_Min_Max_AMP_All(:,5)) mean(FingerPosition_XYZ_M_SD_Min_Max_AMP_All(:,10)) std(FingerPosition_XYZ_M_SD_Min_Max_AMP_All(:,10)) mean(FingerPosition_XYZ_M_SD_Min_Max_AMP_All(:,15)) std(FingerPosition_XYZ_M_SD_Min_Max_AMP_All(:,15))];
        FingerPosition_AMP_XYZ_M_SD_UP = [FingerPosition_AMP_XYZ_M_SD_UP
            mean(FingerPosition_XYZ_M_SD_Min_Max_AMP_Up(:,5)) std(FingerPosition_XYZ_M_SD_Min_Max_AMP_Up(:,5)) mean(FingerPosition_XYZ_M_SD_Min_Max_AMP_Up(:,10)) std(FingerPosition_XYZ_M_SD_Min_Max_AMP_Up(:,10)) mean(FingerPosition_XYZ_M_SD_Min_Max_AMP_Up(:,15)) std(FingerPosition_XYZ_M_SD_Min_Max_AMP_Up(:,15))];
        FingerPosition_AMP_XYZ_M_SD_DOWN = [FingerPosition_AMP_XYZ_M_SD_DOWN
            mean(FingerPosition_XYZ_M_SD_Min_Max_AMP_Down(:,5)) std(FingerPosition_XYZ_M_SD_Min_Max_AMP_Down(:,5)) mean(FingerPosition_XYZ_M_SD_Min_Max_AMP_Down(:,10)) std(FingerPosition_XYZ_M_SD_Min_Max_AMP_Down(:,10)) mean(FingerPosition_XYZ_M_SD_Min_Max_AMP_Down(:,15)) std(FingerPosition_XYZ_M_SD_Min_Max_AMP_Down(:,15))];
        
        
        ShoulderPosition_AMP_XYZ_M_SD_ALL = [ShoulderPosition_AMP_XYZ_M_SD_ALL
            mean(ShoulderPosition_XYZ_M_SD_Min_Max_AMP_All(:,5)) std(ShoulderPosition_XYZ_M_SD_Min_Max_AMP_All(:,5)) mean(ShoulderPosition_XYZ_M_SD_Min_Max_AMP_All(:,10)) std(ShoulderPosition_XYZ_M_SD_Min_Max_AMP_All(:,10)) mean(ShoulderPosition_XYZ_M_SD_Min_Max_AMP_All(:,15)) std(ShoulderPosition_XYZ_M_SD_Min_Max_AMP_All(:,15))];
        ShoulderPosition_AMP_XYZ_M_SD_UP = [ShoulderPosition_AMP_XYZ_M_SD_UP
            mean(ShoulderPosition_XYZ_M_SD_Min_Max_AMP_Up(:,5)) std(ShoulderPosition_XYZ_M_SD_Min_Max_AMP_Up(:,5)) mean(ShoulderPosition_XYZ_M_SD_Min_Max_AMP_Up(:,10)) std(ShoulderPosition_XYZ_M_SD_Min_Max_AMP_Up(:,10)) mean(ShoulderPosition_XYZ_M_SD_Min_Max_AMP_Up(:,15)) std(ShoulderPosition_XYZ_M_SD_Min_Max_AMP_Up(:,15))];
        ShoulderPosition_AMP_XYZ_M_SD_DOWN = [ShoulderPosition_AMP_XYZ_M_SD_DOWN
            mean(ShoulderPosition_XYZ_M_SD_Min_Max_AMP_Down(:,5)) std(ShoulderPosition_XYZ_M_SD_Min_Max_AMP_Down(:,5)) mean(ShoulderPosition_XYZ_M_SD_Min_Max_AMP_Down(:,10)) std(ShoulderPosition_XYZ_M_SD_Min_Max_AMP_Down(:,10)) mean(ShoulderPosition_XYZ_M_SD_Min_Max_AMP_Down(:,15)) std(ShoulderPosition_XYZ_M_SD_Min_Max_AMP_Down(:,15))];
        

        ArmLength_M_SD_ALL = [ArmLength_M_SD_ALL
            mean(nanmean(ArmLength_All)) mean(nanstd(ArmLength_All))];
        ArmLength_M_SD_UP = [ArmLength_M_SD_UP
            mean(nanmean(ArmLength_Up)) mean(nanstd(ArmLength_Up))];
        ArmLength_M_SD_DOWN = [ArmLength_M_SD_DOWN
            mean(nanmean(ArmLength_Down)) mean(nanstd(ArmLength_Down))];
        
        
        
        
        [A B] = size(ElbowAngle_CauchySchwartz_AlKashi_All);
        C = 1;
        D = 2;
        
        
        ElbowAngle_CauchySchwartz_ALL = [];
        ElbowAngle_AlKashi_ALL = [];
        WristAngle_CauchySchwartz_ALL = [];
        WristAngle_AlKashi_ALL = [];
        
        
        while D <= B;
            
            
            ElbowAngle_CauchySchwartz_ALL = [ElbowAngle_CauchySchwartz_ALL ElbowAngle_CauchySchwartz_AlKashi_All(:,C)];
            ElbowAngle_AlKashi_ALL = [ElbowAngle_AlKashi_ALL ElbowAngle_CauchySchwartz_AlKashi_All(:,D)];
            WristAngle_CauchySchwartz_ALL = [WristAngle_CauchySchwartz_ALL WristAngle_CauchySchwartz_AlKashi_All(:,C)];
            WristAngle_AlKashi_ALL = [WristAngle_AlKashi_ALL WristAngle_CauchySchwartz_AlKashi_All(:,D)];
            
            
            C = C+2;
            D = D+2;
            
            
        end
        
        
        ElbowAngle_CS_AK_M_SD_Min_Max_ALL = [ElbowAngle_CS_AK_M_SD_Min_Max_ALL
            mean(nanmean(ElbowAngle_CauchySchwartz_ALL)) mean(nanstd(ElbowAngle_CauchySchwartz_ALL)) mean(nanmin(ElbowAngle_CauchySchwartz_ALL)) mean(nanmax(ElbowAngle_CauchySchwartz_ALL)) mean(nanmean(ElbowAngle_AlKashi_ALL)) mean(nanstd(ElbowAngle_AlKashi_ALL)) mean(nanmin(ElbowAngle_AlKashi_ALL)) mean(nanmax(ElbowAngle_AlKashi_ALL))];
        WristAngle_CS_AK_M_SD_Min_Max_ALL = [WristAngle_CS_AK_M_SD_Min_Max_ALL
            mean(nanmean(WristAngle_CauchySchwartz_ALL)) mean(nanstd(WristAngle_CauchySchwartz_ALL)) mean(nanmin(WristAngle_CauchySchwartz_ALL)) mean(nanmax(WristAngle_CauchySchwartz_ALL)) mean(nanmean(WristAngle_AlKashi_ALL)) mean(nanstd(WristAngle_AlKashi_ALL)) mean(nanmin(WristAngle_AlKashi_ALL)) mean(nanmax(WristAngle_AlKashi_ALL))];
        
        
        
        
        [E F] = size(ElbowAngle_CauchySchwartz_AlKashi_Up);
        G = 1;
        H = 2;
        
        
        ElbowAngle_CauchySchwartz_UP = [];
        ElbowAngle_AlKashi_UP = [];
        WristAngle_CauchySchwartz_UP = [];
        WristAngle_AlKashi_UP = [];
        
        
        while H <= F;
            
            
            ElbowAngle_CauchySchwartz_UP = [ElbowAngle_CauchySchwartz_UP ElbowAngle_CauchySchwartz_AlKashi_Up(:,G)];
            ElbowAngle_AlKashi_UP = [ElbowAngle_AlKashi_UP ElbowAngle_CauchySchwartz_AlKashi_Up(:,H)];
            WristAngle_CauchySchwartz_UP = [WristAngle_CauchySchwartz_UP WristAngle_CauchySchwartz_AlKashi_Up(:,G)];
            WristAngle_AlKashi_UP = [WristAngle_AlKashi_UP WristAngle_CauchySchwartz_AlKashi_Up(:,H)];
            
            
            G = G+2;
            H = H+2;
            
            
        end
        
        
        ElbowAngle_CS_AK_M_SD_Min_Max_UP = [ElbowAngle_CS_AK_M_SD_Min_Max_UP
            mean(nanmean(ElbowAngle_CauchySchwartz_UP)) mean(nanstd(ElbowAngle_CauchySchwartz_UP)) mean(nanmin(ElbowAngle_CauchySchwartz_UP)) mean(nanmax(ElbowAngle_CauchySchwartz_UP)) mean(nanmean(ElbowAngle_AlKashi_UP)) mean(nanstd(ElbowAngle_AlKashi_UP)) mean(nanmin(ElbowAngle_AlKashi_UP)) mean(nanmax(ElbowAngle_AlKashi_UP))];
        WristAngle_CS_AK_M_SD_Min_Max_UP = [WristAngle_CS_AK_M_SD_Min_Max_UP
            mean(nanmean(WristAngle_CauchySchwartz_UP)) mean(nanstd(WristAngle_CauchySchwartz_UP)) mean(nanmin(WristAngle_CauchySchwartz_UP)) mean(nanmax(WristAngle_CauchySchwartz_UP)) mean(nanmean(WristAngle_AlKashi_UP)) mean(nanstd(WristAngle_AlKashi_UP)) mean(nanmin(WristAngle_AlKashi_UP)) mean(nanmax(WristAngle_AlKashi_UP))];
        
        
        
        
        [I J] = size(ElbowAngle_CauchySchwartz_AlKashi_Down);
        K = 1;
        L = 2;
        
        
        ElbowAngle_CauchySchwartz_DOWN = [];
        ElbowAngle_AlKashi_DOWN = [];
        WristAngle_CauchySchwartz_DOWN = [];
        WristAngle_AlKashi_DOWN = [];
        
        
        while L <= J;
            
            
            ElbowAngle_CauchySchwartz_DOWN = [ElbowAngle_CauchySchwartz_DOWN ElbowAngle_CauchySchwartz_AlKashi_Down(:,K)];
            ElbowAngle_AlKashi_DOWN = [ElbowAngle_AlKashi_DOWN ElbowAngle_CauchySchwartz_AlKashi_Down(:,L)];
            WristAngle_CauchySchwartz_DOWN = [WristAngle_CauchySchwartz_DOWN WristAngle_CauchySchwartz_AlKashi_Down(:,K)];
            WristAngle_AlKashi_DOWN = [WristAngle_AlKashi_DOWN WristAngle_CauchySchwartz_AlKashi_Down(:,L)];
            
            
            K = K+2;
            L = L+2;
            
            
        end
        
        
        ElbowAngle_CS_AK_M_SD_Min_Max_DOWN = [ElbowAngle_CS_AK_M_SD_Min_Max_DOWN
            mean(nanmean(ElbowAngle_CauchySchwartz_DOWN)) mean(nanstd(ElbowAngle_CauchySchwartz_DOWN)) mean(nanmin(ElbowAngle_CauchySchwartz_DOWN)) mean(nanmax(ElbowAngle_CauchySchwartz_DOWN)) mean(nanmean(ElbowAngle_AlKashi_DOWN)) mean(nanstd(ElbowAngle_AlKashi_DOWN)) mean(nanmin(ElbowAngle_AlKashi_DOWN)) mean(nanmax(ElbowAngle_AlKashi_DOWN))];
        WristAngle_CS_AK_M_SD_Min_Max_DOWN = [WristAngle_CS_AK_M_SD_Min_Max_DOWN
            mean(nanmean(WristAngle_CauchySchwartz_DOWN)) mean(nanstd(WristAngle_CauchySchwartz_DOWN)) mean(nanmin(WristAngle_CauchySchwartz_DOWN)) mean(nanmax(WristAngle_CauchySchwartz_DOWN)) mean(nanmean(WristAngle_AlKashi_DOWN)) mean(nanstd(WristAngle_AlKashi_DOWN)) mean(nanmin(WristAngle_AlKashi_DOWN)) mean(nanmax(WristAngle_AlKashi_DOWN))];
        
        
        Velocity_Max_M_SD_ALL = [Velocity_Max_M_SD_ALL
            mean(Velocity_M_SD_Min_Max_All(:,4)) std(Velocity_M_SD_Min_Max_All(:,4))];
        Velocity_Max_M_SD_UP = [Velocity_Max_M_SD_UP
            mean(Velocity_M_SD_Min_Max_Up(:,4)) std(Velocity_M_SD_Min_Max_Up(:,4))];
        Velocity_Max_M_SD_DOWN = [Velocity_Max_M_SD_DOWN
            mean(Velocity_M_SD_Min_Max_Down(:,4)) std(Velocity_M_SD_Min_Max_Down(:,4))];
        
        
        FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_M_SD_UP = [FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_M_SD_UP
            mean(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Up(:,1)) std(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Up(:,1)) mean(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Up(:,2)) std(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Up(:,2)) mean(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Up(:,3)) std(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Up(:,3)) mean(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Up(:,4)) std(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Up(:,4)) mean(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Up(:,5)) std(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Up(:,5)) mean(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Up(:,6)) std(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Up(:,6)) mean(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Up(:,7)) std(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Up(:,7)) mean(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Up(:,8)) std(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Up(:,8)) mean(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Up(:,9)) std(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Up(:,9)) mean(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Up(:,10)) std(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Up(:,10)) mean(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Up(:,11)) std(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Up(:,11)) mean(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Up(:,12)) std(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Up(:,12))];
        FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_M_SD_UP = [FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_M_SD_UP
            mean(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Up(:,1)) std(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Up(:,1)) mean(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Up(:,2)) std(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Up(:,2)) mean(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Up(:,3)) std(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Up(:,3)) mean(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Up(:,4)) std(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Up(:,4)) mean(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Up(:,5)) std(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Up(:,5)) mean(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Up(:,6)) std(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Up(:,6)) mean(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Up(:,7)) std(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Up(:,7)) mean(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Up(:,8)) std(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Up(:,8)) mean(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Up(:,9)) std(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Up(:,9)) mean(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Up(:,10)) std(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Up(:,10)) mean(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Up(:,11)) std(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Up(:,11)) mean(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Up(:,12)) std(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Up(:,12)) mean(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Up(:,13)) std(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Up(:,13)) mean(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Up(:,14)) std(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Up(:,14)) mean(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Up(:,15)) std(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Up(:,15)) mean(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Up(:,16)) std(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Up(:,16))];
        ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_M_SD_Min_Max_UP = [ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_M_SD_Min_Max_UP
            mean(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Up(:,1)) std(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Up(:,1)) min(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Up(:,1)) max(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Up(:,1)) mean(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Up(:,2)) std(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Up(:,2)) min(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Up(:,2)) max(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Up(:,2)) mean(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Up(:,3)) std(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Up(:,3)) min(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Up(:,3)) max(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Up(:,3)) mean(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Up(:,4)) std(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Up(:,4)) min(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Up(:,4)) max(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Up(:,4))];

        
        FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_M_SD_DOWN = [FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_M_SD_DOWN
            mean(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Down(:,1)) std(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Down(:,1)) mean(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Down(:,2)) std(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Down(:,2)) mean(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Down(:,3)) std(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Down(:,3)) mean(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Down(:,4)) std(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Down(:,4)) mean(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Down(:,5)) std(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Down(:,5)) mean(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Down(:,6)) std(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Down(:,6)) mean(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Down(:,7)) std(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Down(:,7)) mean(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Down(:,8)) std(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Down(:,8)) mean(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Down(:,9)) std(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Down(:,9)) mean(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Down(:,10)) std(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Down(:,10)) mean(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Down(:,11)) std(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Down(:,11)) mean(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Down(:,12)) std(FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_Down(:,12))];
        FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_M_SD_DOWN = [FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_M_SD_DOWN
            mean(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Down(:,1)) std(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Down(:,1)) mean(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Down(:,2)) std(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Down(:,2)) mean(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Down(:,3)) std(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Down(:,3)) mean(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Down(:,4)) std(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Down(:,4)) mean(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Down(:,5)) std(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Down(:,5)) mean(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Down(:,6)) std(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Down(:,6)) mean(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Down(:,7)) std(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Down(:,7)) mean(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Down(:,8)) std(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Down(:,8)) mean(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Down(:,9)) std(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Down(:,9)) mean(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Down(:,10)) std(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Down(:,10)) mean(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Down(:,11)) std(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Down(:,11)) mean(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Down(:,12)) std(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Down(:,12)) mean(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Down(:,13)) std(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Down(:,13)) mean(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Down(:,14)) std(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Down(:,14)) mean(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Down(:,15)) std(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Down(:,15)) mean(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Down(:,16)) std(FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_Down(:,16))];
        ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_M_SD_Min_Max_DOWN = [ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_M_SD_Min_Max_DOWN
            mean(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Down(:,1)) std(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Down(:,1)) min(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Down(:,1)) max(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Down(:,1)) mean(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Down(:,2)) std(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Down(:,2)) min(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Down(:,2)) max(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Down(:,2)) mean(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Down(:,3)) std(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Down(:,3)) min(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Down(:,3)) max(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Down(:,3)) mean(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Down(:,4)) std(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Down(:,4)) min(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Down(:,4)) max(ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_Down(:,4))];

        
        ErreurConstante_FinalP_PAfterMaxVP_10_20_30_M_SD_Min_Max_UP = [ErreurConstante_FinalP_PAfterMaxVP_10_20_30_M_SD_Min_Max_UP
            mean(ErreurConstante_FinalP_PAfterMaxVP_10_20_30_Up(:,1)) std(ErreurConstante_FinalP_PAfterMaxVP_10_20_30_Up(:,1)) min(ErreurConstante_FinalP_PAfterMaxVP_10_20_30_Up(:,1)) max(ErreurConstante_FinalP_PAfterMaxVP_10_20_30_Up(:,1)) mean(ErreurConstante_FinalP_PAfterMaxVP_10_20_30_Up(:,2)) std(ErreurConstante_FinalP_PAfterMaxVP_10_20_30_Up(:,2)) min(ErreurConstante_FinalP_PAfterMaxVP_10_20_30_Up(:,2)) max(ErreurConstante_FinalP_PAfterMaxVP_10_20_30_Up(:,2)) mean(ErreurConstante_FinalP_PAfterMaxVP_10_20_30_Up(:,3)) std(ErreurConstante_FinalP_PAfterMaxVP_10_20_30_Up(:,3)) min(ErreurConstante_FinalP_PAfterMaxVP_10_20_30_Up(:,3)) max(ErreurConstante_FinalP_PAfterMaxVP_10_20_30_Up(:,3)) mean(ErreurConstante_FinalP_PAfterMaxVP_10_20_30_Up(:,4)) std(ErreurConstante_FinalP_PAfterMaxVP_10_20_30_Up(:,4)) min(ErreurConstante_FinalP_PAfterMaxVP_10_20_30_Up(:,4)) max(ErreurConstante_FinalP_PAfterMaxVP_10_20_30_Up(:,4))];
        ErreurConstante_FinalP_PAfterMaxVP_10_20_30_M_SD_Min_Max_DOWN = [ErreurConstante_FinalP_PAfterMaxVP_10_20_30_M_SD_Min_Max_DOWN
            mean(ErreurConstante_FinalP_PAfterMaxVP_10_20_30_Down(:,1)) std(ErreurConstante_FinalP_PAfterMaxVP_10_20_30_Down(:,1)) min(ErreurConstante_FinalP_PAfterMaxVP_10_20_30_Down(:,1)) max(ErreurConstante_FinalP_PAfterMaxVP_10_20_30_Down(:,1)) mean(ErreurConstante_FinalP_PAfterMaxVP_10_20_30_Down(:,2)) std(ErreurConstante_FinalP_PAfterMaxVP_10_20_30_Down(:,2)) min(ErreurConstante_FinalP_PAfterMaxVP_10_20_30_Down(:,2)) max(ErreurConstante_FinalP_PAfterMaxVP_10_20_30_Down(:,2)) mean(ErreurConstante_FinalP_PAfterMaxVP_10_20_30_Down(:,3)) std(ErreurConstante_FinalP_PAfterMaxVP_10_20_30_Down(:,3)) min(ErreurConstante_FinalP_PAfterMaxVP_10_20_30_Down(:,3)) max(ErreurConstante_FinalP_PAfterMaxVP_10_20_30_Down(:,3)) mean(ErreurConstante_FinalP_PAfterMaxVP_10_20_30_Down(:,4)) std(ErreurConstante_FinalP_PAfterMaxVP_10_20_30_Down(:,4)) min(ErreurConstante_FinalP_PAfterMaxVP_10_20_30_Down(:,4)) max(ErreurConstante_FinalP_PAfterMaxVP_10_20_30_Down(:,4))];
        ErreurVariable_FinalP_PAfterMaxVP_10_20_30_M_SD_Min_Max_UP = [ErreurVariable_FinalP_PAfterMaxVP_10_20_30_M_SD_Min_Max_UP
            mean(ErreurVariable_FinalP_PAfterMaxVP_10_20_30_Up(:,1)) std(ErreurVariable_FinalP_PAfterMaxVP_10_20_30_Up(:,1)) min(ErreurVariable_FinalP_PAfterMaxVP_10_20_30_Up(:,1)) max(ErreurVariable_FinalP_PAfterMaxVP_10_20_30_Up(:,1)) mean(ErreurVariable_FinalP_PAfterMaxVP_10_20_30_Up(:,2)) std(ErreurVariable_FinalP_PAfterMaxVP_10_20_30_Up(:,2)) min(ErreurVariable_FinalP_PAfterMaxVP_10_20_30_Up(:,2)) max(ErreurVariable_FinalP_PAfterMaxVP_10_20_30_Up(:,2)) mean(ErreurVariable_FinalP_PAfterMaxVP_10_20_30_Up(:,3)) std(ErreurVariable_FinalP_PAfterMaxVP_10_20_30_Up(:,3)) min(ErreurVariable_FinalP_PAfterMaxVP_10_20_30_Up(:,3)) max(ErreurVariable_FinalP_PAfterMaxVP_10_20_30_Up(:,3)) mean(ErreurVariable_FinalP_PAfterMaxVP_10_20_30_Up(:,4)) std(ErreurVariable_FinalP_PAfterMaxVP_10_20_30_Up(:,4)) min(ErreurVariable_FinalP_PAfterMaxVP_10_20_30_Up(:,4)) max(ErreurVariable_FinalP_PAfterMaxVP_10_20_30_Up(:,4))];
        ErreurVariable_FinalP_PAfterMaxVP_10_20_30_M_SD_Min_Max_DOWN = [ErreurVariable_FinalP_PAfterMaxVP_10_20_30_M_SD_Min_Max_DOWN
            mean(ErreurVariable_FinalP_PAfterMaxVP_10_20_30_Down(:,1)) std(ErreurVariable_FinalP_PAfterMaxVP_10_20_30_Down(:,1)) min(ErreurVariable_FinalP_PAfterMaxVP_10_20_30_Down(:,1)) max(ErreurVariable_FinalP_PAfterMaxVP_10_20_30_Down(:,1)) mean(ErreurVariable_FinalP_PAfterMaxVP_10_20_30_Down(:,2)) std(ErreurVariable_FinalP_PAfterMaxVP_10_20_30_Down(:,2)) min(ErreurVariable_FinalP_PAfterMaxVP_10_20_30_Down(:,2)) max(ErreurVariable_FinalP_PAfterMaxVP_10_20_30_Down(:,2)) mean(ErreurVariable_FinalP_PAfterMaxVP_10_20_30_Down(:,3)) std(ErreurVariable_FinalP_PAfterMaxVP_10_20_30_Down(:,3)) min(ErreurVariable_FinalP_PAfterMaxVP_10_20_30_Down(:,3)) max(ErreurVariable_FinalP_PAfterMaxVP_10_20_30_Down(:,3)) mean(ErreurVariable_FinalP_PAfterMaxVP_10_20_30_Down(:,4)) std(ErreurVariable_FinalP_PAfterMaxVP_10_20_30_Down(:,4)) min(ErreurVariable_FinalP_PAfterMaxVP_10_20_30_Down(:,4)) max(ErreurVariable_FinalP_PAfterMaxVP_10_20_30_Down(:,4))];
        
        
        j = j+1;
       
       
    end
    
    
end


save('PHASES_RESULTS','T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD_ALL','T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD_UP','T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD_DOWN','RA_RtPa_RtPd_M_SD_ALL','RA_RtPa_RtPd_M_SD_UP','RA_RtPa_RtPd_M_SD_DOWN','LateralDeviation_M_SD_Min_Max_ALL','LateralDeviation_M_SD_Min_Max_UP','LateralDeviation_M_SD_Min_Max_DOWN','FingerPosition_AMP_XYZ_M_SD_ALL','FingerPosition_AMP_XYZ_M_SD_UP','FingerPosition_AMP_XYZ_M_SD_DOWN','ShoulderPosition_AMP_XYZ_M_SD_ALL','ShoulderPosition_AMP_XYZ_M_SD_UP','ShoulderPosition_AMP_XYZ_M_SD_DOWN','ArmLength_M_SD_ALL','ArmLength_M_SD_UP','ArmLength_M_SD_DOWN','ElbowAngle_CS_AK_M_SD_Min_Max_ALL','ElbowAngle_CS_AK_M_SD_Min_Max_UP','ElbowAngle_CS_AK_M_SD_Min_Max_DOWN','WristAngle_CS_AK_M_SD_Min_Max_ALL','WristAngle_CS_AK_M_SD_Min_Max_UP','WristAngle_CS_AK_M_SD_Min_Max_DOWN','Velocity_Max_M_SD_ALL','Velocity_Max_M_SD_UP','Velocity_Max_M_SD_DOWN','FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_M_SD_UP','FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_M_SD_UP','ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_M_SD_Min_Max_UP','FingerTarget_XYZ_FinalP_PAfterMaxVP_10_20_30_M_SD_DOWN','FingerTarget_TraSagFro3D_FinalP_PAfterMaxVP_10_20_30_M_SD_DOWN','ErreurAngulaire_FinalP_PAfterMaxVP_10_20_30_M_SD_Min_Max_DOWN','ErreurConstante_FinalP_PAfterMaxVP_10_20_30_M_SD_Min_Max_UP','ErreurConstante_FinalP_PAfterMaxVP_10_20_30_M_SD_Min_Max_DOWN','ErreurVariable_FinalP_PAfterMaxVP_10_20_30_M_SD_Min_Max_UP','ErreurVariable_FinalP_PAfterMaxVP_10_20_30_M_SD_Min_Max_DOWN')