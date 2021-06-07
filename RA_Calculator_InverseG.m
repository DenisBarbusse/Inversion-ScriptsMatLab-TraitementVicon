Try_folder = {uigetdir};


VerticalAMP_MaxMin_OffsetOnset_EndStart = [];

FingerPosition_XYZ_M_SD_Min_Max_AMP = [];
ShoulderPosition_XYZ_M_SD_Min_Max_AMP = [];

LateralDeviation_M_SD_Min_Max = [];
ArmLength_M_SD_start_end_min_max = [];

ElbowAngle_CS_AK_M_SD_start_end_min_max = [];
WristAngle_CS_AK_M_SD_start_end_min_max = [];

ZMax_Ind_XYZ_UpTrys = [];
ZMax_Ind_XYZ_DownTrys = [];
FinalPosition_UpTrys = [];
FinalPosition_DownTrys = [];
Shoulder_FinalP_UpTrys = [];
Shoulder_FinalP_DownTrys = [];

NofVPeaks_UpTrys = [];
NofVPeaks_DownTrys = [];

PositionAfterMaxVPeak_Indice_XYZ_10_UpTrys = [];
PositionAfterMaxVPeak_Indice_XYZ_20_UpTrys = [];
PositionAfterMaxVPeak_Indice_XYZ_30_UpTrys = [];
PositionAfterMaxVPeak_Indice_XYZ_10_DownTrys = [];
PositionAfterMaxVPeak_Indice_XYZ_20_DownTrys = [];
PositionAfterMaxVPeak_Indice_XYZ_30_DownTrys = [];

Shoulder_PAfterMaxVPeak_Indice_XYZ_10_UpTrys = [];
Shoulder_PAfterMaxVPeak_Indice_XYZ_20_UpTrys = [];
Shoulder_PAfterMaxVPeak_Indice_XYZ_30_UpTrys = [];
Shoulder_PAfterMaxVPeak_Indice_XYZ_10_DownTrys = [];
Shoulder_PAfterMaxVPeak_Indice_XYZ_20_DownTrys = [];
Shoulder_PAfterMaxVPeak_Indice_XYZ_30_DownTrys = [];

T = [];
Vmax = [];
Velocity_M_SD_Min_Max = [];

RA = [];
RtPa = [];
RtPd = [];

CC = 1;
DD = 2;
FF = 1;

for i = 1:length(Try_folder)
    Try_lst = dir(fullfile(Try_folder{i},'Try*'));
    
    
    FingerPosition = NaN(300,(3*(length(Try_lst))));
    ShoulderPosition = NaN(300,(3*(length(Try_lst))));
    
    LateralDeviation = NaN(300,length(Try_lst));
    
    ArmLength = NaN(300,length(Try_lst));
    
    Velocity = NaN(300,length(Try_lst));
    Velocity_Normalized = [];
    ElbowAngle_CauchySchwartz_AlKashi = NaN(300,2*length(Try_lst));
    WristAngle_CauchySchwartz_AlKashi = NaN(300,2*length(Try_lst));
    
    
    for j = 1:length(Try_lst)
        Try = load(['Try' num2str(j) '.mat']);
        
        
        FingerPosition(1:length(Try.T),FF) = Try.T(:,17);
        FingerPosition(1:length(Try.T),(FF+1)) = Try.T(:,18);
        FingerPosition(1:length(Try.T),(FF+2)) = Try.T(:,19);
        FingerPosition_XYZ_M_SD_Min_Max_AMP = [FingerPosition_XYZ_M_SD_Min_Max_AMP
            mean(Try.T(:,17)) std(Try.T(:,17)) min(Try.T(:,17)) max(Try.T(:,17)) abs(max(Try.T(:,17))-min(Try.T(:,17))) mean(Try.T(:,18)) std(Try.T(:,18)) min(Try.T(:,18)) max(Try.T(:,18)) abs(max(Try.T(:,18))-min(Try.T(:,18))) mean(Try.T(:,19)) std(Try.T(:,19)) min(Try.T(:,19)) max(Try.T(:,19)) abs(max(Try.T(:,19))-min(Try.T(:,19)))];
        
        ShoulderPosition(1:length(Try.T),FF) = Try.T(:,2);
        ShoulderPosition(1:length(Try.T),(FF+1)) = Try.T(:,3);
        ShoulderPosition(1:length(Try.T),(FF+2)) = Try.T(:,4);
        ShoulderPosition_XYZ_M_SD_Min_Max_AMP = [ShoulderPosition_XYZ_M_SD_Min_Max_AMP
            mean(Try.T(:,2)) std(Try.T(:,2)) min(Try.T(:,2)) max(Try.T(:,2)) abs(max(Try.T(:,2))-min(Try.T(:,2))) mean(Try.T(:,3)) std(Try.T(:,3)) min(Try.T(:,3)) max(Try.T(:,3)) abs(max(Try.T(:,3))-min(Try.T(:,3))) mean(Try.T(:,4)) std(Try.T(:,4)) min(Try.T(:,4)) max(Try.T(:,4)) abs(max(Try.T(:,4))-min(Try.T(:,4)))];
        
        FF = FF+3;
        
        Z = Try.Z(:,2);
        Z_filtered = butter_emgs(Z,100,3,5,'low-pass','false','true');
        
        %calcul de la vitesse
        V = abs(derive(Z_filtered,1));
        
        Velocity(1:length(V),j) = V;
        
        Velocity_M_SD_Min_Max = [Velocity_M_SD_Min_Max
            mean(V) std(V) min(V) max(V)];
        
        [V_normalized,YYY] = normalize2(V,'spline',1000);
        
        Velocity_Normalized = [Velocity_Normalized V_normalized];
        
        %calcul de la vitesse max et de son indice
        [vmax Indice_vmax] = max(V);
        
        Vmax = [Vmax 
            vmax];
        
        %calcul de l'amplitude latérale du mouvement
        Y_position = Try.T(:,18);
        
        Y_start = mean(Y_position(1:10,1));
        
        Lateral_d = Y_position-Y_start;
        
        LateralDeviation(1:length(Lateral_d),j) = Lateral_d;
        
        Lateral_D_M = mean(Lateral_d);
        Lateral_D_SD = std(Lateral_d);
        Lateral_D_Min = min(Lateral_d);
        Lateral_D_Max = max(Lateral_d);
        
        LateralDeviation_M_SD_Min_Max = [LateralDeviation_M_SD_Min_Max
            Lateral_D_M Lateral_D_SD Lateral_D_Min Lateral_D_Max];
        
        %calcul de la longueur du bras 
        Arm_length = [];
        
        
        for l = 1:length(Z);
            Arm_length = [Arm_length
                sqrt((Try.T(l,2)-Try.T(l,17)^2)+(Try.T(l,3)-Try.T(l,18)^2)+(Try.T(l,4)-Try.T(l,19)^2))];
        end
        
        
        ArmLength(1:length(Arm_length),j) = Arm_length;
        
        Arm_length_M_SD = [mean(Arm_length) std(Arm_length)];
        Arm_length_start = mean(Arm_length(1:10));
        Arm_length_end = mean(Arm_length(length(Arm_length)-10:length(Arm_length)));
        Arm_length_min = min(Arm_length);
        Arm_length_max = max(Arm_length);
        
        Arm_length_M_SD_start_end_min_max = [Arm_length_M_SD Arm_length_start Arm_length_end Arm_length_min Arm_length_max ];
        
        ArmLength_M_SD_start_end_min_max = [ArmLength_M_SD_start_end_min_max
            Arm_length_M_SD_start_end_min_max];
        
        %calcul des variations de l'angle du coude et du poignet
        
        ElbowAngle_CauchySchwartz = [];
        ElbowAngle_AlKashi = [];
        
        WristAngle_CauchySchwartz = [];
        WristAngle_AlKashi = [];
        
        
        for EE = 1:length(Z);
            
            
            LengthElbowWrist = sqrt(((abs(Try.T(EE,5)-Try.T(EE,11)))^2)+((abs(Try.T(EE,6)-Try.T(EE,12)))^2)+((abs(Try.T(EE,7)-Try.T(EE,13)))^2));
            LengthElbowShoulder = sqrt(((abs(Try.T(EE,5)-Try.T(EE,2)))^2)+((abs(Try.T(EE,6)-Try.T(EE,3)))^2)+((abs(Try.T(EE,7)-Try.T(EE,4)))^2));
            LengthWristShoulder = sqrt(((abs(Try.T(EE,11)-Try.T(EE,2)))^2)+((abs(Try.T(EE,12)-Try.T(EE,3)))^2)+((abs(Try.T(EE,13)-Try.T(EE,4)))^2));
            
            ElbowAngle_CauchySchwartz = [ElbowAngle_CauchySchwartz
                acosd((0.5*((LengthElbowWrist^2)+(LengthElbowShoulder^2)-(LengthWristShoulder^2)))/(LengthElbowWrist*LengthElbowShoulder))];
            ElbowAngle_AlKashi = [ElbowAngle_AlKashi
                acosd(((LengthElbowWrist^2)+(LengthElbowShoulder^2)-(LengthWristShoulder^2))/(-2*LengthElbowWrist*LengthElbowShoulder))];
            
            LengthWristFinger = sqrt(((abs(Try.T(EE,11)-Try.T(EE,17)))^2)+((abs(Try.T(EE,12)-Try.T(EE,18)))^2)+((abs(Try.T(EE,13)-Try.T(EE,19)))^2));
            LengthWristElbow = sqrt(((abs(Try.T(EE,11)-Try.T(EE,5)))^2)+((abs(Try.T(EE,12)-Try.T(EE,6)))^2)+((abs(Try.T(EE,13)-Try.T(EE,7)))^2));
            LengthFingerElbow = sqrt(((abs(Try.T(EE,17)-Try.T(EE,5)))^2)+((abs(Try.T(EE,18)-Try.T(EE,6)))^2)+((abs(Try.T(EE,19)-Try.T(EE,7)))^2));
            
            WristAngle_CauchySchwartz = [WristAngle_CauchySchwartz
                acosd((0.5*((LengthWristFinger^2)+(LengthWristElbow^2)-(LengthFingerElbow^2)))/(LengthWristFinger*LengthWristElbow))];
            WristAngle_AlKashi = [WristAngle_AlKashi
                acosd(((LengthWristFinger^2)+(LengthWristElbow^2)-(LengthFingerElbow^2))/(-2*LengthWristFinger*LengthWristElbow))];
            
            
        end
        
        
        
        ElbowAngle_CauchySchwartz_AlKashi(1:length(ElbowAngle_CauchySchwartz),CC) = ElbowAngle_CauchySchwartz;
        ElbowAngle_CauchySchwartz_AlKashi(1:length(ElbowAngle_AlKashi),DD) = ElbowAngle_AlKashi;
        
        Elbow_Angle_CS_AK_M_SD = [mean(ElbowAngle_CauchySchwartz) std(ElbowAngle_CauchySchwartz) mean(ElbowAngle_AlKashi) std(ElbowAngle_AlKashi)];
        Elbow_Angle_CS_AK_start = [mean(ElbowAngle_CauchySchwartz(1:10)) mean(ElbowAngle_AlKashi(1:10))];
        Elbow_Angle_CS_AK_end = [mean(ElbowAngle_CauchySchwartz(length(ElbowAngle_CauchySchwartz)-10:length(ElbowAngle_CauchySchwartz))) mean(ElbowAngle_AlKashi(length(ElbowAngle_AlKashi)-10:length(ElbowAngle_AlKashi)))];
        Elbow_Angle_CS_AK_min = [min(ElbowAngle_CauchySchwartz) min(ElbowAngle_AlKashi)];
        Elbow_Angle_CS_AK_max = [max(ElbowAngle_CauchySchwartz) max(ElbowAngle_AlKashi)];
            
        ElbowAngle_CS_AK_M_SD_start_end_min_max = [ElbowAngle_CS_AK_M_SD_start_end_min_max
            Elbow_Angle_CS_AK_M_SD Elbow_Angle_CS_AK_start Elbow_Angle_CS_AK_end Elbow_Angle_CS_AK_min Elbow_Angle_CS_AK_max];
           
        
        WristAngle_CauchySchwartz_AlKashi(1:length(WristAngle_CauchySchwartz),CC) = WristAngle_CauchySchwartz;
        WristAngle_CauchySchwartz_AlKashi(1:length(WristAngle_AlKashi),DD) = WristAngle_AlKashi;
        
        Wrist_Angle_CS_AK_M_SD = [mean(WristAngle_CauchySchwartz) std(WristAngle_CauchySchwartz) mean(WristAngle_AlKashi) std(WristAngle_AlKashi)];
        Wrist_Angle_CS_AK_start = [mean(WristAngle_CauchySchwartz(1:10)) mean(WristAngle_AlKashi(1:10))];
        Wrist_Angle_CS_AK_end = [mean(WristAngle_CauchySchwartz(length(WristAngle_CauchySchwartz)-10:length(WristAngle_CauchySchwartz))) mean(WristAngle_AlKashi(length(WristAngle_AlKashi)-10:length(WristAngle_AlKashi)))];
        Wrist_Angle_CS_AK_min = [min(WristAngle_CauchySchwartz) min(WristAngle_AlKashi)];
        Wrist_Angle_CS_AK_max = [max(WristAngle_CauchySchwartz) max(WristAngle_AlKashi)];
            
        WristAngle_CS_AK_M_SD_start_end_min_max = [WristAngle_CS_AK_M_SD_start_end_min_max
            Wrist_Angle_CS_AK_M_SD Wrist_Angle_CS_AK_start Wrist_Angle_CS_AK_end Wrist_Angle_CS_AK_min Wrist_Angle_CS_AK_max];
        
        
        CC = CC+2;
        DD = DD+2;
        
        
        %calcul de la position finale atteinte sur Z
        Z_start = [mean(Try.T(1:10,17)) mean(Try.T(1:10,18)) mean(Z(1:10,1))];
        Z_end = [mean(Try.T(length(Z)-10:length(Z),17)) mean(Try.T(length(Z)-10:length(Z),18)) mean(Z(length(Z)-10:length(Z),1))];
        Shoulder_FinalP = [mean(Try.T(length(Z)-10:length(Z),2)) mean(Try.T(length(Z)-10:length(Z),3)) mean(Try.T(length(Z)-10:length(Z),4))]; 
        
        
        if rem(j,2) > 0
            [Z_Min Indice_Z_Min] = min(Z);
            ZMax_Ind_XYZ_UpTrys = [ZMax_Ind_XYZ_UpTrys
                Indice_Z_Min Try.T(Indice_Z_Min,17) Try.T(Indice_Z_Min,18) Z_Min];
            
            FinalPosition_UpTrys = [FinalPosition_UpTrys
                Z_end];
            
            Shoulder_FinalP_UpTrys = [Shoulder_FinalP_UpTrys
                Shoulder_FinalP];
            
            [VPeaks_Up Indice_VPeaks_Up] = findpeaks(V,'MINPEAKHEIGHT',0.1*(max(V)));
            NofVPeaks_UpTrys = [NofVPeaks_UpTrys
                length(VPeaks_Up)];
            
            
            p = Indice_vmax;
            while V(p,1) > 0.1*vmax
                p = p+1;
            end
            PositionAfterMaxVPeak_Indice_XYZ_10_UpTrys = [PositionAfterMaxVPeak_Indice_XYZ_10_UpTrys 
                p Try.T(p,17) Try.T(p,18) Try.T(p,19)];
            
            Shoulder_PAfterMaxVPeak_Indice_XYZ_10_UpTrys = [Shoulder_PAfterMaxVPeak_Indice_XYZ_10_UpTrys
                p Try.T(p,2) Try.T(p,3) Try.T(p,4)];
            
            
            p = Indice_vmax;
            while V(p,1) > 0.2*vmax
                p = p+1;
            end
            PositionAfterMaxVPeak_Indice_XYZ_20_UpTrys = [PositionAfterMaxVPeak_Indice_XYZ_20_UpTrys 
                p Try.T(p,17) Try.T(p,18) Try.T(p,19)];
            
            Shoulder_PAfterMaxVPeak_Indice_XYZ_20_UpTrys = [Shoulder_PAfterMaxVPeak_Indice_XYZ_20_UpTrys
                p Try.T(p,2) Try.T(p,3) Try.T(p,4)];
            
            
            p = Indice_vmax;
            while V(p,1) > 0.3*vmax
                p = p+1;
            end
            PositionAfterMaxVPeak_Indice_XYZ_30_UpTrys = [PositionAfterMaxVPeak_Indice_XYZ_30_UpTrys 
                p Try.T(p,17) Try.T(p,18) Try.T(p,19)];
            
            Shoulder_PAfterMaxVPeak_Indice_XYZ_30_UpTrys = [Shoulder_PAfterMaxVPeak_Indice_XYZ_30_UpTrys
                p Try.T(p,2) Try.T(p,3) Try.T(p,4)];
        
            
        else 
            [Z_Max Indice_Z_Max] = max(Z);
            ZMax_Ind_XYZ_DownTrys = [ZMax_Ind_XYZ_DownTrys
                Indice_Z_Max Try.T(Indice_Z_Max,17) Try.T(Indice_Z_Max,18) Z_Max];
            
            FinalPosition_DownTrys = [FinalPosition_DownTrys
                Z_end];
            
            Shoulder_FinalP_DownTrys = [Shoulder_FinalP_DownTrys
                Shoulder_FinalP];
           
            [VPeaks_Down Indice_VPeaks_Down] = findpeaks(V,'MINPEAKHEIGHT',0.1*(max(V)));
            NofVPeaks_DownTrys = [NofVPeaks_DownTrys
                length(VPeaks_Down)];
            
            
            p = Indice_vmax;
            while V(p,1) > 0.1*vmax
                p = p+1;
            end
            PositionAfterMaxVPeak_Indice_XYZ_10_DownTrys = [PositionAfterMaxVPeak_Indice_XYZ_10_DownTrys 
                p Try.T(p,17) Try.T(p,18) Try.T(p,19)];
            
            Shoulder_PAfterMaxVPeak_Indice_XYZ_10_DownTrys = [Shoulder_PAfterMaxVPeak_Indice_XYZ_10_DownTrys
                p Try.T(p,2) Try.T(p,3) Try.T(p,4)];
            
            
            p = Indice_vmax;
            while V(p,1) > 0.2*vmax
                p = p+1;
            end
            PositionAfterMaxVPeak_Indice_XYZ_20_DownTrys = [PositionAfterMaxVPeak_Indice_XYZ_20_DownTrys 
                p Try.T(p,17) Try.T(p,18) Try.T(p,19)];
            
            Shoulder_PAfterMaxVPeak_Indice_XYZ_20_DownTrys = [Shoulder_PAfterMaxVPeak_Indice_XYZ_20_DownTrys
                p Try.T(p,2) Try.T(p,3) Try.T(p,4)];
            
            
            p = Indice_vmax;
            while V(p,1) > 0.3*vmax
                p = p+1;
            end
            PositionAfterMaxVPeak_Indice_XYZ_30_DownTrys = [PositionAfterMaxVPeak_Indice_XYZ_30_DownTrys 
                p Try.T(p,17) Try.T(p,18) Try.T(p,19)];
            
            Shoulder_PAfterMaxVPeak_Indice_XYZ_30_DownTrys = [Shoulder_PAfterMaxVPeak_Indice_XYZ_30_DownTrys
                p Try.T(p,2) Try.T(p,3) Try.T(p,4)];
        
            
        end

        
        TargetUp = [mean(Try.T(:,32)) mean(Try.T(:,33)) mean(Try.T(:,34))];
        TargetDown = [mean(Try.T(:,29)) mean(Try.T(:,30)) mean(Try.T(:,31))];
        
        
        h = Indice_vmax;
        while V(h,1) > 0.1*vmax
        h = h-1;
        end
        onset = h;

        
        k = Indice_vmax;
        while V(k,1) > 0.1*vmax
        k = k+1;
        end
        offset = k;
        
        
        %calcul de l'amplitude verticale du mouvement
        Vertical_Amp_Max_Min = max(Z)-min(Z);
        
        Vertical_Amp_Offset_Onset = abs(Z(offset)-Z(onset));
        
        Vertical_Amp_End_Start = abs(Z_end(1,3)-Z_start(1,3));
        
        VerticalAMP_MaxMin_OffsetOnset_EndStart = [VerticalAMP_MaxMin_OffsetOnset_EndStart
            Vertical_Amp_Max_Min Vertical_Amp_Offset_Onset Vertical_Amp_End_Start];
        
        %calcul du temps du mouvement
        t = offset-onset;
        T = [T
            t];
       
        %calcul du RA
        Ra = (Indice_vmax-onset)/(offset-onset);
        
        RA = [RA
            Ra];
        
        %calcul RtPa et RtPd
        A = derive(abs(derive(Z_filtered,1)),1);
        
        [Amax Indice_Amax] = max(A);
        
        Rtpa = (Indice_Amax-onset)/(offset-onset);
        
        RtPa = [RtPa
            Rtpa];

        [Amin Indice_Amin] = min(A);
        
        Rtpd = (Indice_Amin-onset)/(offset-onset);

        RtPd = [RtPd
            Rtpd];
        
        
    end
   
    
    T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax = [T VerticalAMP_MaxMin_OffsetOnset_EndStart Vmax];
    T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD = [mean(T) mean(VerticalAMP_MaxMin_OffsetOnset_EndStart(:,1)) mean(VerticalAMP_MaxMin_OffsetOnset_EndStart(:,2)) mean(VerticalAMP_MaxMin_OffsetOnset_EndStart(:,3)) mean(Vmax)
            std(T) std(VerticalAMP_MaxMin_OffsetOnset_EndStart(:,1)) std(VerticalAMP_MaxMin_OffsetOnset_EndStart(:,2)) std(VerticalAMP_MaxMin_OffsetOnset_EndStart(:,3)) std(Vmax)];
    
    
    RA_RtPa_RtPd = [RA RtPa RtPd];    
    RA_RtPa_RtPd_M_SD = [mean(RA) mean(RtPa) mean(RtPd)
            std(RA) std(RtPa) std(RtPd)];
    
    
    PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys = [PositionAfterMaxVPeak_Indice_XYZ_10_UpTrys PositionAfterMaxVPeak_Indice_XYZ_20_UpTrys PositionAfterMaxVPeak_Indice_XYZ_30_UpTrys];
    PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys = [PositionAfterMaxVPeak_Indice_XYZ_10_DownTrys PositionAfterMaxVPeak_Indice_XYZ_20_DownTrys PositionAfterMaxVPeak_Indice_XYZ_30_DownTrys];
    PositionAfterMaxVPeak_Ind_XYZ_10_20_30_M_SD_Min_Max_UpTrys = [mean(PositionAfterMaxVPeak_Indice_XYZ_10_UpTrys(:,2)) std(PositionAfterMaxVPeak_Indice_XYZ_10_UpTrys(:,2)) min(PositionAfterMaxVPeak_Indice_XYZ_10_UpTrys(:,2)) max(PositionAfterMaxVPeak_Indice_XYZ_10_UpTrys(:,2)) mean(PositionAfterMaxVPeak_Indice_XYZ_10_UpTrys(:,3)) std(PositionAfterMaxVPeak_Indice_XYZ_10_UpTrys(:,3)) min(PositionAfterMaxVPeak_Indice_XYZ_10_UpTrys(:,3)) max(PositionAfterMaxVPeak_Indice_XYZ_10_UpTrys(:,3)) mean(PositionAfterMaxVPeak_Indice_XYZ_10_UpTrys(:,4)) std(PositionAfterMaxVPeak_Indice_XYZ_10_UpTrys(:,4)) min(PositionAfterMaxVPeak_Indice_XYZ_10_UpTrys(:,4)) max(PositionAfterMaxVPeak_Indice_XYZ_10_UpTrys(:,4)) mean(PositionAfterMaxVPeak_Indice_XYZ_20_UpTrys(:,2)) std(PositionAfterMaxVPeak_Indice_XYZ_20_UpTrys(:,2)) min(PositionAfterMaxVPeak_Indice_XYZ_20_UpTrys(:,2)) max(PositionAfterMaxVPeak_Indice_XYZ_20_UpTrys(:,2)) mean(PositionAfterMaxVPeak_Indice_XYZ_20_UpTrys(:,3)) std(PositionAfterMaxVPeak_Indice_XYZ_20_UpTrys(:,3)) min(PositionAfterMaxVPeak_Indice_XYZ_20_UpTrys(:,3)) max(PositionAfterMaxVPeak_Indice_XYZ_20_UpTrys(:,3)) mean(PositionAfterMaxVPeak_Indice_XYZ_20_UpTrys(:,4)) std(PositionAfterMaxVPeak_Indice_XYZ_20_UpTrys(:,4)) min(PositionAfterMaxVPeak_Indice_XYZ_20_UpTrys(:,4)) max(PositionAfterMaxVPeak_Indice_XYZ_20_UpTrys(:,4)) mean(PositionAfterMaxVPeak_Indice_XYZ_30_UpTrys(:,2)) std(PositionAfterMaxVPeak_Indice_XYZ_30_UpTrys(:,2)) min(PositionAfterMaxVPeak_Indice_XYZ_30_UpTrys(:,2)) max(PositionAfterMaxVPeak_Indice_XYZ_30_UpTrys(:,2)) mean(PositionAfterMaxVPeak_Indice_XYZ_30_UpTrys(:,3)) std(PositionAfterMaxVPeak_Indice_XYZ_30_UpTrys(:,3)) min(PositionAfterMaxVPeak_Indice_XYZ_30_UpTrys(:,3)) max(PositionAfterMaxVPeak_Indice_XYZ_30_UpTrys(:,3)) mean(PositionAfterMaxVPeak_Indice_XYZ_30_UpTrys(:,4)) std(PositionAfterMaxVPeak_Indice_XYZ_30_UpTrys(:,4)) min(PositionAfterMaxVPeak_Indice_XYZ_30_UpTrys(:,4)) max(PositionAfterMaxVPeak_Indice_XYZ_30_UpTrys(:,4))];
    PositionAfterMaxVPeak_Ind_XYZ_10_20_30_M_SD_Min_Max_DownTrys = [mean(PositionAfterMaxVPeak_Indice_XYZ_10_DownTrys(:,2)) std(PositionAfterMaxVPeak_Indice_XYZ_10_DownTrys(:,2)) min(PositionAfterMaxVPeak_Indice_XYZ_10_DownTrys(:,2)) max(PositionAfterMaxVPeak_Indice_XYZ_10_DownTrys(:,2)) mean(PositionAfterMaxVPeak_Indice_XYZ_10_DownTrys(:,3)) std(PositionAfterMaxVPeak_Indice_XYZ_10_DownTrys(:,3)) min(PositionAfterMaxVPeak_Indice_XYZ_10_DownTrys(:,3)) max(PositionAfterMaxVPeak_Indice_XYZ_10_DownTrys(:,3)) mean(PositionAfterMaxVPeak_Indice_XYZ_10_DownTrys(:,4)) std(PositionAfterMaxVPeak_Indice_XYZ_10_DownTrys(:,4)) min(PositionAfterMaxVPeak_Indice_XYZ_10_DownTrys(:,4)) max(PositionAfterMaxVPeak_Indice_XYZ_10_DownTrys(:,4)) mean(PositionAfterMaxVPeak_Indice_XYZ_20_DownTrys(:,2)) std(PositionAfterMaxVPeak_Indice_XYZ_20_DownTrys(:,2)) min(PositionAfterMaxVPeak_Indice_XYZ_20_DownTrys(:,2)) max(PositionAfterMaxVPeak_Indice_XYZ_20_DownTrys(:,2)) mean(PositionAfterMaxVPeak_Indice_XYZ_20_DownTrys(:,3)) std(PositionAfterMaxVPeak_Indice_XYZ_20_DownTrys(:,3)) min(PositionAfterMaxVPeak_Indice_XYZ_20_DownTrys(:,3)) max(PositionAfterMaxVPeak_Indice_XYZ_20_DownTrys(:,3)) mean(PositionAfterMaxVPeak_Indice_XYZ_20_DownTrys(:,4)) std(PositionAfterMaxVPeak_Indice_XYZ_20_DownTrys(:,4)) min(PositionAfterMaxVPeak_Indice_XYZ_20_DownTrys(:,4)) max(PositionAfterMaxVPeak_Indice_XYZ_20_DownTrys(:,4)) mean(PositionAfterMaxVPeak_Indice_XYZ_30_DownTrys(:,2)) std(PositionAfterMaxVPeak_Indice_XYZ_30_DownTrys(:,2)) min(PositionAfterMaxVPeak_Indice_XYZ_30_DownTrys(:,2)) max(PositionAfterMaxVPeak_Indice_XYZ_30_DownTrys(:,2)) mean(PositionAfterMaxVPeak_Indice_XYZ_30_DownTrys(:,3)) std(PositionAfterMaxVPeak_Indice_XYZ_30_DownTrys(:,3)) min(PositionAfterMaxVPeak_Indice_XYZ_30_DownTrys(:,3)) max(PositionAfterMaxVPeak_Indice_XYZ_30_DownTrys(:,3)) mean(PositionAfterMaxVPeak_Indice_XYZ_30_DownTrys(:,4)) std(PositionAfterMaxVPeak_Indice_XYZ_30_DownTrys(:,4)) min(PositionAfterMaxVPeak_Indice_XYZ_30_DownTrys(:,4)) max(PositionAfterMaxVPeak_Indice_XYZ_30_DownTrys(:,4))];
    FinalPosition_M_SD_Min_Max_UpTrys = [mean(FinalPosition_UpTrys(:,1)) std(FinalPosition_UpTrys(:,1)) min(FinalPosition_UpTrys(:,1)) max(FinalPosition_UpTrys(:,1)) mean(FinalPosition_UpTrys(:,2)) std(FinalPosition_UpTrys(:,2)) min(FinalPosition_UpTrys(:,2)) max(FinalPosition_UpTrys(:,2)) mean(FinalPosition_UpTrys(:,3)) std(FinalPosition_UpTrys(:,3)) min(FinalPosition_UpTrys(:,3)) max(FinalPosition_UpTrys(:,3))];
    FinalPosition_M_SD_Min_Max_DownTrys = [mean(FinalPosition_DownTrys(:,1)) std(FinalPosition_DownTrys(:,1)) min(FinalPosition_DownTrys(:,1)) max(FinalPosition_DownTrys(:,1)) mean(FinalPosition_DownTrys(:,2)) std(FinalPosition_DownTrys(:,2)) min(FinalPosition_DownTrys(:,2)) max(FinalPosition_DownTrys(:,2)) mean(FinalPosition_DownTrys(:,3)) std(FinalPosition_DownTrys(:,3)) min(FinalPosition_DownTrys(:,3)) max(FinalPosition_DownTrys(:,3))];
    
    Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys = [Shoulder_PAfterMaxVPeak_Indice_XYZ_10_UpTrys Shoulder_PAfterMaxVPeak_Indice_XYZ_20_UpTrys Shoulder_PAfterMaxVPeak_Indice_XYZ_30_UpTrys];
    Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys = [Shoulder_PAfterMaxVPeak_Indice_XYZ_10_DownTrys Shoulder_PAfterMaxVPeak_Indice_XYZ_20_DownTrys Shoulder_PAfterMaxVPeak_Indice_XYZ_30_DownTrys];
    Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_M_SD_Min_Max_UpTrys = [mean(Shoulder_PAfterMaxVPeak_Indice_XYZ_10_UpTrys(:,2)) std(Shoulder_PAfterMaxVPeak_Indice_XYZ_10_UpTrys(:,2)) min(Shoulder_PAfterMaxVPeak_Indice_XYZ_10_UpTrys(:,2)) max(Shoulder_PAfterMaxVPeak_Indice_XYZ_10_UpTrys(:,2)) mean(Shoulder_PAfterMaxVPeak_Indice_XYZ_10_UpTrys(:,3)) std(Shoulder_PAfterMaxVPeak_Indice_XYZ_10_UpTrys(:,3)) min(Shoulder_PAfterMaxVPeak_Indice_XYZ_10_UpTrys(:,3)) max(Shoulder_PAfterMaxVPeak_Indice_XYZ_10_UpTrys(:,3)) mean(Shoulder_PAfterMaxVPeak_Indice_XYZ_10_UpTrys(:,4)) std(Shoulder_PAfterMaxVPeak_Indice_XYZ_10_UpTrys(:,4)) min(Shoulder_PAfterMaxVPeak_Indice_XYZ_10_UpTrys(:,4)) max(Shoulder_PAfterMaxVPeak_Indice_XYZ_10_UpTrys(:,4)) mean(Shoulder_PAfterMaxVPeak_Indice_XYZ_20_UpTrys(:,2)) std(Shoulder_PAfterMaxVPeak_Indice_XYZ_20_UpTrys(:,2)) min(Shoulder_PAfterMaxVPeak_Indice_XYZ_20_UpTrys(:,2)) max(Shoulder_PAfterMaxVPeak_Indice_XYZ_20_UpTrys(:,2)) mean(Shoulder_PAfterMaxVPeak_Indice_XYZ_20_UpTrys(:,3)) std(Shoulder_PAfterMaxVPeak_Indice_XYZ_20_UpTrys(:,3)) min(Shoulder_PAfterMaxVPeak_Indice_XYZ_20_UpTrys(:,3)) max(Shoulder_PAfterMaxVPeak_Indice_XYZ_20_UpTrys(:,3)) mean(Shoulder_PAfterMaxVPeak_Indice_XYZ_20_UpTrys(:,4)) std(Shoulder_PAfterMaxVPeak_Indice_XYZ_20_UpTrys(:,4)) min(Shoulder_PAfterMaxVPeak_Indice_XYZ_20_UpTrys(:,4)) max(Shoulder_PAfterMaxVPeak_Indice_XYZ_20_UpTrys(:,4)) mean(Shoulder_PAfterMaxVPeak_Indice_XYZ_30_UpTrys(:,2)) std(Shoulder_PAfterMaxVPeak_Indice_XYZ_30_UpTrys(:,2)) min(Shoulder_PAfterMaxVPeak_Indice_XYZ_30_UpTrys(:,2)) max(Shoulder_PAfterMaxVPeak_Indice_XYZ_30_UpTrys(:,2)) mean(Shoulder_PAfterMaxVPeak_Indice_XYZ_30_UpTrys(:,3)) std(Shoulder_PAfterMaxVPeak_Indice_XYZ_30_UpTrys(:,3)) min(Shoulder_PAfterMaxVPeak_Indice_XYZ_30_UpTrys(:,3)) max(Shoulder_PAfterMaxVPeak_Indice_XYZ_30_UpTrys(:,3)) mean(Shoulder_PAfterMaxVPeak_Indice_XYZ_30_UpTrys(:,4)) std(Shoulder_PAfterMaxVPeak_Indice_XYZ_30_UpTrys(:,4)) min(Shoulder_PAfterMaxVPeak_Indice_XYZ_30_UpTrys(:,4)) max(Shoulder_PAfterMaxVPeak_Indice_XYZ_30_UpTrys(:,4))];
    Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_M_SD_Min_Max_DownTrys = [mean(Shoulder_PAfterMaxVPeak_Indice_XYZ_10_DownTrys(:,2)) std(Shoulder_PAfterMaxVPeak_Indice_XYZ_10_DownTrys(:,2)) min(Shoulder_PAfterMaxVPeak_Indice_XYZ_10_DownTrys(:,2)) max(Shoulder_PAfterMaxVPeak_Indice_XYZ_10_DownTrys(:,2)) mean(Shoulder_PAfterMaxVPeak_Indice_XYZ_10_DownTrys(:,3)) std(Shoulder_PAfterMaxVPeak_Indice_XYZ_10_DownTrys(:,3)) min(Shoulder_PAfterMaxVPeak_Indice_XYZ_10_DownTrys(:,3)) max(Shoulder_PAfterMaxVPeak_Indice_XYZ_10_DownTrys(:,3)) mean(Shoulder_PAfterMaxVPeak_Indice_XYZ_10_DownTrys(:,4)) std(Shoulder_PAfterMaxVPeak_Indice_XYZ_10_DownTrys(:,4)) min(Shoulder_PAfterMaxVPeak_Indice_XYZ_10_DownTrys(:,4)) max(Shoulder_PAfterMaxVPeak_Indice_XYZ_10_DownTrys(:,4)) mean(Shoulder_PAfterMaxVPeak_Indice_XYZ_20_DownTrys(:,2)) std(Shoulder_PAfterMaxVPeak_Indice_XYZ_20_DownTrys(:,2)) min(Shoulder_PAfterMaxVPeak_Indice_XYZ_20_DownTrys(:,2)) max(Shoulder_PAfterMaxVPeak_Indice_XYZ_20_DownTrys(:,2)) mean(Shoulder_PAfterMaxVPeak_Indice_XYZ_20_DownTrys(:,3)) std(Shoulder_PAfterMaxVPeak_Indice_XYZ_20_DownTrys(:,3)) min(Shoulder_PAfterMaxVPeak_Indice_XYZ_20_DownTrys(:,3)) max(Shoulder_PAfterMaxVPeak_Indice_XYZ_20_DownTrys(:,3)) mean(Shoulder_PAfterMaxVPeak_Indice_XYZ_20_DownTrys(:,4)) std(Shoulder_PAfterMaxVPeak_Indice_XYZ_20_DownTrys(:,4)) min(Shoulder_PAfterMaxVPeak_Indice_XYZ_20_DownTrys(:,4)) max(Shoulder_PAfterMaxVPeak_Indice_XYZ_20_DownTrys(:,4)) mean(Shoulder_PAfterMaxVPeak_Indice_XYZ_30_DownTrys(:,2)) std(Shoulder_PAfterMaxVPeak_Indice_XYZ_30_DownTrys(:,2)) min(Shoulder_PAfterMaxVPeak_Indice_XYZ_30_DownTrys(:,2)) max(Shoulder_PAfterMaxVPeak_Indice_XYZ_30_DownTrys(:,2)) mean(Shoulder_PAfterMaxVPeak_Indice_XYZ_30_DownTrys(:,3)) std(Shoulder_PAfterMaxVPeak_Indice_XYZ_30_DownTrys(:,3)) min(Shoulder_PAfterMaxVPeak_Indice_XYZ_30_DownTrys(:,3)) max(Shoulder_PAfterMaxVPeak_Indice_XYZ_30_DownTrys(:,3)) mean(Shoulder_PAfterMaxVPeak_Indice_XYZ_30_DownTrys(:,4)) std(Shoulder_PAfterMaxVPeak_Indice_XYZ_30_DownTrys(:,4)) min(Shoulder_PAfterMaxVPeak_Indice_XYZ_30_DownTrys(:,4)) max(Shoulder_PAfterMaxVPeak_Indice_XYZ_30_DownTrys(:,4))];
    Shoulder_FinalP_M_SD_Min_Max_UpTrys = [mean(Shoulder_FinalP_UpTrys(:,1)) std(Shoulder_FinalP_UpTrys(:,1)) min(Shoulder_FinalP_UpTrys(:,1)) max(Shoulder_FinalP_UpTrys(:,1)) mean(Shoulder_FinalP_UpTrys(:,2)) std(Shoulder_FinalP_UpTrys(:,2)) min(Shoulder_FinalP_UpTrys(:,2)) max(Shoulder_FinalP_UpTrys(:,2)) mean(Shoulder_FinalP_UpTrys(:,3)) std(Shoulder_FinalP_UpTrys(:,3)) min(Shoulder_FinalP_UpTrys(:,3)) max(Shoulder_FinalP_UpTrys(:,3))];
    Shoulder_FinalP_M_SD_Min_Max_DownTrys = [mean(Shoulder_FinalP_DownTrys(:,1)) std(Shoulder_FinalP_DownTrys(:,1)) min(Shoulder_FinalP_DownTrys(:,1)) max(Shoulder_FinalP_DownTrys(:,1)) mean(Shoulder_FinalP_DownTrys(:,2)) std(Shoulder_FinalP_DownTrys(:,2)) min(Shoulder_FinalP_DownTrys(:,2)) max(Shoulder_FinalP_DownTrys(:,2)) mean(Shoulder_FinalP_DownTrys(:,3)) std(Shoulder_FinalP_DownTrys(:,3)) min(Shoulder_FinalP_DownTrys(:,3)) max(Shoulder_FinalP_DownTrys(:,3))];
    
    
    u = 1;
    up = 1;
    U = 1;
    UP = 1;
    uu = 1;
    uupp = 1;
    
    T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_UpTrys = [];
    RA_RtPa_RtPd_UpTrys = [];

    FingerPosition_UpTrys = NaN(300,((fix(length(Try_lst)/2))+(rem(length(Try_lst),2)))*3);
    FingerPosition_XYZ_M_SD_Min_Max_AMP_UpTrys = [];
    ShoulderPosition_UpTrys = NaN(300,((fix(length(Try_lst)/2))+(rem(length(Try_lst),2)))*3);
    ShoulderPosition_XYZ_M_SD_Min_Max_AMP_UpTrys = [];
    
    LateralDeviation_UpTrys = NaN(300,((fix(length(Try_lst)/2))+(rem(length(Try_lst),2))));
    LateralDeviation_M_SD_Min_Max_UpTrys = [];
    
    ArmLength_UpTrys = NaN(300,((fix(length(Try_lst)/2))+(rem(length(Try_lst),2))));
    ArmLength_M_SD_start_end_min_max_UpTrys = [];
    
    ElbowAngle_CauchySchwartz_AlKashi_UpTrys = NaN(300,2*((fix(length(Try_lst)/2))+(rem(length(Try_lst),2))));
    ElbowAngle_CS_AK_M_SD_start_end_min_max_UpTrys = [];
    WristAngle_CauchySchwartz_AlKashi_UpTrys = NaN(300,2*((fix(length(Try_lst)/2))+(rem(length(Try_lst),2))));
    WristAngle_CS_AK_M_SD_start_end_min_max_UpTrys = [];
    
    Velocity_UpTrys = NaN(300,((fix(length(Try_lst)/2))+(rem(length(Try_lst),2))));
    Velocity_M_SD_Min_Max_UpTrys = [];
    Velocity_Normalized_UpTrys = [];
    
    
        while u <= length(Try_lst)
            T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_UpTrys = [T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_UpTrys
                T(u,1) VerticalAMP_MaxMin_OffsetOnset_EndStart(u,1) VerticalAMP_MaxMin_OffsetOnset_EndStart(u,2) VerticalAMP_MaxMin_OffsetOnset_EndStart(u,3) Vmax(u,1)];
            RA_RtPa_RtPd_UpTrys = [RA_RtPa_RtPd_UpTrys
                RA(u,1) RtPa(u,1) RtPd(u,1)];
            
            FingerPosition_UpTrys(:,UP) = FingerPosition(:,U);
            FingerPosition_UpTrys(:,UP+1) = FingerPosition(:,U+1);
            FingerPosition_UpTrys(:,UP+2) = FingerPosition(:,U+2);
            FingerPosition_XYZ_M_SD_Min_Max_AMP_UpTrys = [FingerPosition_XYZ_M_SD_Min_Max_AMP_UpTrys
                FingerPosition_XYZ_M_SD_Min_Max_AMP(u,:)];
            
            ShoulderPosition_UpTrys(:,UP) = ShoulderPosition(:,U);
            ShoulderPosition_UpTrys(:,UP+1) = ShoulderPosition(:,U+1);
            ShoulderPosition_UpTrys(:,UP+2) = ShoulderPosition(:,U+2);
            ShoulderPosition_XYZ_M_SD_Min_Max_AMP_UpTrys = [ShoulderPosition_XYZ_M_SD_Min_Max_AMP_UpTrys
                ShoulderPosition_XYZ_M_SD_Min_Max_AMP(u,:)];
            
            LateralDeviation_UpTrys(:,up) = LateralDeviation(:,u);
            LateralDeviation_M_SD_Min_Max_UpTrys = [LateralDeviation_M_SD_Min_Max_UpTrys
                LateralDeviation_M_SD_Min_Max(u,:)];
            
            ArmLength_UpTrys(:,up) = ArmLength(:,u);
            ArmLength_M_SD_start_end_min_max_UpTrys = [ArmLength_M_SD_start_end_min_max_UpTrys
                ArmLength_M_SD_start_end_min_max(u,:)];
            
            ElbowAngle_CauchySchwartz_AlKashi_UpTrys(:,uupp)= ElbowAngle_CauchySchwartz_AlKashi(:,uu);
            ElbowAngle_CauchySchwartz_AlKashi_UpTrys(:,uupp+1)= ElbowAngle_CauchySchwartz_AlKashi(:,uu+1);
            ElbowAngle_CS_AK_M_SD_start_end_min_max_UpTrys = [ElbowAngle_CS_AK_M_SD_start_end_min_max_UpTrys
                ElbowAngle_CS_AK_M_SD_start_end_min_max(u,:)];
            WristAngle_CauchySchwartz_AlKashi_UpTrys(:,uupp)= WristAngle_CauchySchwartz_AlKashi(:,uu);
            WristAngle_CauchySchwartz_AlKashi_UpTrys(:,uupp+1)= WristAngle_CauchySchwartz_AlKashi(:,uu+1);
            WristAngle_CS_AK_M_SD_start_end_min_max_UpTrys = [WristAngle_CS_AK_M_SD_start_end_min_max_UpTrys
                WristAngle_CS_AK_M_SD_start_end_min_max(u,:)];
    
            Velocity_UpTrys(:,up) = Velocity(:,u);
            Velocity_M_SD_Min_Max_UpTrys = [Velocity_M_SD_Min_Max_UpTrys
                Velocity_M_SD_Min_Max(u,:)];
            Velocity_Normalized_UpTrys = [Velocity_Normalized_UpTrys Velocity_Normalized(:,u)];
            
            u = u+2;
            up = up+1;
            U = U+6;
            UP = UP+3;
            uu = uu+4;
            uupp = uupp+2;
            
            
        end

        
     T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD_UpTrys = [mean(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_UpTrys)
         std(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_UpTrys)];
     RA_RtPa_RtPd_M_SD_UpTrys = [mean(RA_RtPa_RtPd_UpTrys)
         std(RA_RtPa_RtPd_UpTrys)];
        
     
     d = 2; 
     do = 1;
     D = 4;
     DO = 1;
     dd = 2;
     ddoo = 1;
     
     T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_DownTrys = [];
     RA_RtPa_RtPd_DownTrys = [];
     
     FingerPosition_DownTrys = NaN(300,((fix(length(Try_lst)/2))*3));
     FingerPosition_XYZ_M_SD_Min_Max_AMP_DownTrys = [];
     ShoulderPosition_DownTrys = NaN(300,((fix(length(Try_lst)/2))*3));
     ShoulderPosition_XYZ_M_SD_Min_Max_AMP_DownTrys = [];
     
     LateralDeviation_DownTrys = NaN(300,((fix(length(Try_lst)/2))+(rem(length(Try_lst),2))));
     LateralDeviation_M_SD_Min_Max_DownTrys = [];
     
     ArmLength_DownTrys = NaN(300,((fix(length(Try_lst)/2))));
     ArmLength_M_SD_start_end_min_max_DownTrys = [];
     
     ElbowAngle_CauchySchwartz_AlKashi_DownTrys = NaN(300,2*((fix(length(Try_lst)/2))));
     ElbowAngle_CS_AK_M_SD_start_end_min_max_DownTrys = [];
     WristAngle_CauchySchwartz_AlKashi_DownTrys = NaN(300,2*((fix(length(Try_lst)/2))));
     WristAngle_CS_AK_M_SD_start_end_min_max_DownTrys = [];
    
     Velocity_DownTrys = NaN(300,((fix(length(Try_lst)/2))));
     Velocity_M_SD_Min_Max_DownTrys = [];
     Velocity_Normalized_DownTrys = [];
     
     
        while d <= length (Try_lst)
            T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_DownTrys = [T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_DownTrys
                T(d,1) VerticalAMP_MaxMin_OffsetOnset_EndStart(d,1) VerticalAMP_MaxMin_OffsetOnset_EndStart(d,2) VerticalAMP_MaxMin_OffsetOnset_EndStart(d,3) Vmax(d,1)];
            RA_RtPa_RtPd_DownTrys = [RA_RtPa_RtPd_DownTrys
                RA(d,1) RtPa(d,1) RtPd(d,1)];
            
            FingerPosition_DownTrys(:,DO) = FingerPosition(:,D);
            FingerPosition_DownTrys(:,DO+1) = FingerPosition(:,D+1);
            FingerPosition_DownTrys(:,DO+2) = FingerPosition(:,D+2);
            FingerPosition_XYZ_M_SD_Min_Max_AMP_DownTrys = [FingerPosition_XYZ_M_SD_Min_Max_AMP_DownTrys
                FingerPosition_XYZ_M_SD_Min_Max_AMP(d,:)];
            
            ShoulderPosition_DownTrys(:,DO) = ShoulderPosition(:,D);
            ShoulderPosition_DownTrys(:,DO+1) = ShoulderPosition(:,D+1);
            ShoulderPosition_DownTrys(:,DO+2) = ShoulderPosition(:,D+2);
            ShoulderPosition_XYZ_M_SD_Min_Max_AMP_DownTrys = [ShoulderPosition_XYZ_M_SD_Min_Max_AMP_DownTrys
                ShoulderPosition_XYZ_M_SD_Min_Max_AMP(d,:)];
            
            LateralDeviation_DownTrys(:,do) = LateralDeviation(:,d);
            LateralDeviation_M_SD_Min_Max_DownTrys = [LateralDeviation_M_SD_Min_Max_DownTrys
                LateralDeviation_M_SD_Min_Max(d,:)];
            
            ArmLength_DownTrys(:,do) = ArmLength(:,d);
            ArmLength_M_SD_start_end_min_max_DownTrys = [ArmLength_M_SD_start_end_min_max_DownTrys
                ArmLength_M_SD_start_end_min_max(d,:)];
            
            ElbowAngle_CauchySchwartz_AlKashi_DownTrys(:,ddoo)= ElbowAngle_CauchySchwartz_AlKashi(:,dd);
            ElbowAngle_CauchySchwartz_AlKashi_DownTrys(:,ddoo+1)= ElbowAngle_CauchySchwartz_AlKashi(:,dd+1);
            ElbowAngle_CS_AK_M_SD_start_end_min_max_DownTrys = [ElbowAngle_CS_AK_M_SD_start_end_min_max_DownTrys
                ElbowAngle_CS_AK_M_SD_start_end_min_max(d,:)];
            WristAngle_CauchySchwartz_AlKashi_DownTrys(:,ddoo)= WristAngle_CauchySchwartz_AlKashi(:,dd);
            WristAngle_CauchySchwartz_AlKashi_DownTrys(:,ddoo+1)= WristAngle_CauchySchwartz_AlKashi(:,dd+1);
            WristAngle_CS_AK_M_SD_start_end_min_max_DownTrys = [WristAngle_CS_AK_M_SD_start_end_min_max_DownTrys
                WristAngle_CS_AK_M_SD_start_end_min_max(d,:)];
    
            Velocity_DownTrys(:,do) = Velocity(:,d);
            Velocity_M_SD_Min_Max_DownTrys = [Velocity_M_SD_Min_Max_DownTrys
                Velocity_M_SD_Min_Max(d,:)];
            Velocity_Normalized_DownTrys = [Velocity_Normalized_DownTrys Velocity_Normalized(:,d)];
            
            d = d+2;
            do = do+1;
            D = D+6; 
            DO = DO+3;
            dd = dd+4;
            ddoo = ddoo+2;
            
            
        end

        
    T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD_DownTrys = [mean(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_DownTrys)
         std(T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_DownTrys)];
    RA_RtPa_RtPd_M_SD_DownTrys = [mean(RA_RtPa_RtPd_DownTrys)
         std(RA_RtPa_RtPd_DownTrys)];
     
    %calcul de l'erreur constante et de l'erreur variable
    BB = 1;
    FingerTargetUp_X_FinalP_PAfterMaxVPeak_10_20_30 = [];
    FingerTargetUp_Y_FinalP_PAfterMaxVPeak_10_20_30 = [];
    FingerTargetUp_Z_FinalP_PAfterMaxVPeak_10_20_30 = [];
    FingerTargetUp_Transveral_FinalP_PAfterMaxVPeak_10_20_30 = [];
    FingerTargetUp_Saggital_FinalP_PAfterMaxVPeak_10_20_30 = [];
    FingerTargetUp_Frontal_FinalP_PAfterMaxVPeak_10_20_30 = [];
    FingerTargetUp_3D_FinalP_PAfterMaxVPeak_10_20_30 = [];
    
    AnglePerfectAngleTryUp_FinalP_PAfterMaxVPeak_10_20_30 = [];
    ErreurAngulaireUp_FinalP_PAfterMaxVPeak_10_20_30 = [];
    
        while BB <= length(FinalPosition_UpTrys)
        
            
        FingerTargetUp_X_FinalP_PAfterMaxVPeak_10_20_30 = [FingerTargetUp_X_FinalP_PAfterMaxVPeak_10_20_30
            TargetUp(1,1)-FinalPosition_UpTrys(BB,1) TargetUp(1,1)-PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,2) TargetUp(1,1)-PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,6) TargetUp(1,1)-PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,10)];
        FingerTargetUp_Y_FinalP_PAfterMaxVPeak_10_20_30 = [FingerTargetUp_Y_FinalP_PAfterMaxVPeak_10_20_30
            FinalPosition_UpTrys(BB,2)-TargetUp(1,2) PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,3)-TargetUp(1,2) PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,7)-TargetUp(1,2) PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,11)-TargetUp(1,2)];
        FingerTargetUp_Z_FinalP_PAfterMaxVPeak_10_20_30 = [FingerTargetUp_Z_FinalP_PAfterMaxVPeak_10_20_30
            FinalPosition_UpTrys(BB,3)-TargetUp(1,3) PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,4)-TargetUp(1,3) PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,8)-TargetUp(1,3) PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,12)-TargetUp(1,3)];
        FingerTargetUp_Transveral_FinalP_PAfterMaxVPeak_10_20_30 = [FingerTargetUp_Transveral_FinalP_PAfterMaxVPeak_10_20_30
            sqrt(((abs(FinalPosition_UpTrys(BB,1)-TargetUp(1,1)))^2)+((abs(FinalPosition_UpTrys(BB,2)-TargetUp(1,2)))^2)) sqrt(((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,2)-TargetUp(1,1)))^2)+((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,3)-TargetUp(1,2)))^2)) sqrt(((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,6)-TargetUp(1,1)))^2)+((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,7)-TargetUp(1,2)))^2)) sqrt(((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,10)-TargetUp(1,1)))^2)+((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,11)-TargetUp(1,2)))^2))];
        FingerTargetUp_Saggital_FinalP_PAfterMaxVPeak_10_20_30 = [FingerTargetUp_Saggital_FinalP_PAfterMaxVPeak_10_20_30
            sqrt(((abs(FinalPosition_UpTrys(BB,1)-TargetUp(1,1)))^2)+((abs(FinalPosition_UpTrys(BB,3)-TargetUp(1,3)))^2)) sqrt(((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,2)-TargetUp(1,1)))^2)+((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,4)-TargetUp(1,3)))^2)) sqrt(((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,6)-TargetUp(1,1)))^2)+((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,8)-TargetUp(1,3)))^2)) sqrt(((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,10)-TargetUp(1,1)))^2)+((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,12)-TargetUp(1,3)))^2))];
        FingerTargetUp_Frontal_FinalP_PAfterMaxVPeak_10_20_30 = [FingerTargetUp_Frontal_FinalP_PAfterMaxVPeak_10_20_30
            sqrt(((abs(FinalPosition_UpTrys(BB,2)-TargetUp(1,2)))^2)+((abs(FinalPosition_UpTrys(BB,3)-TargetUp(1,3)))^2)) sqrt(((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,3)-TargetUp(1,2)))^2)+((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,4)-TargetUp(1,3)))^2)) sqrt(((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,7)-TargetUp(1,2)))^2)+((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,8)-TargetUp(1,3)))^2)) sqrt(((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,11)-TargetUp(1,2)))^2)+((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,12)-TargetUp(1,3)))^2))];
        FingerTargetUp_3D_FinalP_PAfterMaxVPeak_10_20_30 = [FingerTargetUp_3D_FinalP_PAfterMaxVPeak_10_20_30
            sqrt(((abs(FinalPosition_UpTrys(BB,1)-TargetUp(1,1)))^2)+((abs(FinalPosition_UpTrys(BB,2)-TargetUp(1,2)))^2)+((abs(FinalPosition_UpTrys(BB,3)-TargetUp(1,3)))^2)) sqrt(((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,2)-TargetUp(1,1)))^2)+((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,3)-TargetUp(1,2)))^2)+((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,4)-TargetUp(1,3)))^2)) sqrt(((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,6)-TargetUp(1,1)))^2)+((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,7)-TargetUp(1,2)))^2)+((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,8)-TargetUp(1,3)))^2)) sqrt(((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,10)-TargetUp(1,1)))^2)+((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,11)-TargetUp(1,2)))^2)+((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,12)-TargetUp(1,3)))^2))];
        
        AnglePerfectUp_FinalP = acosd((abs(Shoulder_FinalP_UpTrys(BB,1)-TargetUp(1,1)))/(sqrt(((abs(Shoulder_FinalP_UpTrys(BB,1)-TargetUp(1,1)))^2)+((abs(Shoulder_FinalP_UpTrys(BB,3)-TargetUp(1,3)))^2))));
        AngleTryUp_FinalP = acosd((abs(Shoulder_FinalP_UpTrys(BB,1)-FinalPosition_UpTrys(BB,1)))/(sqrt(((abs(Shoulder_FinalP_UpTrys(BB,1)-FinalPosition_UpTrys(BB,1)))^2)+((abs(Shoulder_FinalP_UpTrys(BB,3)-FinalPosition_UpTrys(1,3)))^2))));
        ErreurAngulaireUp_FinalP = AngleTryUp_FinalP-AnglePerfectUp_FinalP;
        
        AnglePerfectUp_PAfterMaxVPeak_10 = acosd((abs(Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,2)-TargetUp(1,1)))/(sqrt(((abs(Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,2)-TargetUp(1,1)))^2)+((abs(Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,4)-TargetUp(1,3)))^2))));
        AngleTryUp_PAfterMaxVPeak_10 = acosd((abs(Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,2)-PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,2)))/(sqrt(((abs(Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,2)-PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,2)))^2)+((abs(Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,4)-PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,4)))^2))));
        ErreurAngulaireUp_PAfterMaxVPeak_10 = AngleTryUp_PAfterMaxVPeak_10-AnglePerfectUp_PAfterMaxVPeak_10;
        
        AnglePerfectUp_PAfterMaxVPeak_20 = acosd((abs(Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,6)-TargetUp(1,1)))/(sqrt(((abs(Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,6)-TargetUp(1,1)))^2)+((abs(Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,8)-TargetUp(1,3)))^2))));
        AngleTryUp_PAfterMaxVPeak_20 = acosd((abs(Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,6)-PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,6)))/(sqrt(((abs(Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,6)-PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,6)))^2)+((abs(Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,8)-PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,8)))^2))));
        ErreurAngulaireUp_PAfterMaxVPeak_20 = AngleTryUp_PAfterMaxVPeak_20-AnglePerfectUp_PAfterMaxVPeak_20;
        
        AnglePerfectUp_PAfterMaxVPeak_30 = acosd((abs(Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,10)-TargetUp(1,1)))/(sqrt(((abs(Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,10)-TargetUp(1,1)))^2)+((abs(Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,12)-TargetUp(1,3)))^2))));
        AngleTryUp_PAfterMaxVPeak_30 = acosd((abs(Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,10)-PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,10)))/(sqrt(((abs(Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,10)-PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,10)))^2)+((abs(Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,12)-PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(BB,12)))^2))));
        ErreurAngulaireUp_PAfterMaxVPeak_30 = AngleTryUp_PAfterMaxVPeak_30-AnglePerfectUp_PAfterMaxVPeak_30;
         
        AnglePerfectAngleTryUp_FinalP_PAfterMaxVPeak_10_20_30 = [AnglePerfectAngleTryUp_FinalP_PAfterMaxVPeak_10_20_30
            AnglePerfectUp_FinalP AngleTryUp_FinalP AnglePerfectUp_PAfterMaxVPeak_10 AngleTryUp_PAfterMaxVPeak_10 AnglePerfectUp_PAfterMaxVPeak_20 AngleTryUp_PAfterMaxVPeak_20 AnglePerfectUp_PAfterMaxVPeak_30 AngleTryUp_PAfterMaxVPeak_30];
        ErreurAngulaireUp_FinalP_PAfterMaxVPeak_10_20_30 = [ErreurAngulaireUp_FinalP_PAfterMaxVPeak_10_20_30
            ErreurAngulaireUp_FinalP ErreurAngulaireUp_PAfterMaxVPeak_10 ErreurAngulaireUp_PAfterMaxVPeak_20 ErreurAngulaireUp_PAfterMaxVPeak_30];
        
        BB = BB+1;
        
        
        end

        
    ErreurAngulaireUp_FinalP_PAfterMaxVPeak_10_20_30_M_SD_min_max = [mean(ErreurAngulaireUp_FinalP_PAfterMaxVPeak_10_20_30(:,1)) std(ErreurAngulaireUp_FinalP_PAfterMaxVPeak_10_20_30(:,1)) min(ErreurAngulaireUp_FinalP_PAfterMaxVPeak_10_20_30(:,1)) max(ErreurAngulaireUp_FinalP_PAfterMaxVPeak_10_20_30(:,1)) mean(ErreurAngulaireUp_FinalP_PAfterMaxVPeak_10_20_30(:,2)) std(ErreurAngulaireUp_FinalP_PAfterMaxVPeak_10_20_30(:,2)) min(ErreurAngulaireUp_FinalP_PAfterMaxVPeak_10_20_30(:,2)) max(ErreurAngulaireUp_FinalP_PAfterMaxVPeak_10_20_30(:,2)) mean(ErreurAngulaireUp_FinalP_PAfterMaxVPeak_10_20_30(:,3)) std(ErreurAngulaireUp_FinalP_PAfterMaxVPeak_10_20_30(:,3)) min(ErreurAngulaireUp_FinalP_PAfterMaxVPeak_10_20_30(:,3)) max(ErreurAngulaireUp_FinalP_PAfterMaxVPeak_10_20_30(:,3)) mean(ErreurAngulaireUp_FinalP_PAfterMaxVPeak_10_20_30(:,4)) std(ErreurAngulaireUp_FinalP_PAfterMaxVPeak_10_20_30(:,4)) min(ErreurAngulaireUp_FinalP_PAfterMaxVPeak_10_20_30(:,4)) max(ErreurAngulaireUp_FinalP_PAfterMaxVPeak_10_20_30(:,4))];
    
    FingerTargetUp_XYZ_FinalP_PAfterMaxVPeak_10_20_30 = [FingerTargetUp_X_FinalP_PAfterMaxVPeak_10_20_30 FingerTargetUp_Y_FinalP_PAfterMaxVPeak_10_20_30 FingerTargetUp_Z_FinalP_PAfterMaxVPeak_10_20_30];
    FingerTargetUp_Tra_Sag_Fro_3D_FinalP_PAfterMaxVPeak_10_20_30 = [FingerTargetUp_Transveral_FinalP_PAfterMaxVPeak_10_20_30 FingerTargetUp_Saggital_FinalP_PAfterMaxVPeak_10_20_30 FingerTargetUp_Frontal_FinalP_PAfterMaxVPeak_10_20_30 FingerTargetUp_3D_FinalP_PAfterMaxVPeak_10_20_30];
    
    FingerTargetUp_XYZ_FinalP_PMaxVPeak_10_20_30_M_SD = [mean(FingerTargetUp_X_FinalP_PAfterMaxVPeak_10_20_30) std(FingerTargetUp_X_FinalP_PAfterMaxVPeak_10_20_30) mean(FingerTargetUp_Y_FinalP_PAfterMaxVPeak_10_20_30) std(FingerTargetUp_Y_FinalP_PAfterMaxVPeak_10_20_30) mean(FingerTargetUp_Z_FinalP_PAfterMaxVPeak_10_20_30) std(FingerTargetUp_Z_FinalP_PAfterMaxVPeak_10_20_30)];
    FingerTargetUp_Tra_Sag_Fro_3D_FinalP_PMaxVPeak_10_20_30_M_SD = [mean(FingerTargetUp_Transveral_FinalP_PAfterMaxVPeak_10_20_30) std(FingerTargetUp_Transveral_FinalP_PAfterMaxVPeak_10_20_30) mean(FingerTargetUp_Saggital_FinalP_PAfterMaxVPeak_10_20_30) std(FingerTargetUp_Saggital_FinalP_PAfterMaxVPeak_10_20_30) mean(FingerTargetUp_Frontal_FinalP_PAfterMaxVPeak_10_20_30) std(FingerTargetUp_Frontal_FinalP_PAfterMaxVPeak_10_20_30) mean(FingerTargetUp_3D_FinalP_PAfterMaxVPeak_10_20_30) std(FingerTargetUp_3D_FinalP_PAfterMaxVPeak_10_20_30)];
    
    
    
    AA = 1;
    FingerTargetDown_X_FinalP_PAfterMaxVPeak_10_20_30 = [];
    FingerTargetDown_Y_FinalP_PAfterMaxVPeak_10_20_30 = [];
    FingerTargetDown_Z_FinalP_PAfterMaxVPeak_10_20_30 = [];
    FingerTargetDown_Transveral_FinalP_PAfterMaxVPeak_10_20_30 = [];
    FingerTargetDown_Saggital_FinalP_PAfterMaxVPeak_10_20_30 = [];
    FingerTargetDown_Frontal_FinalP_PAfterMaxVPeak_10_20_30 = [];
    FingerTargetDown_3D_FinalP_PAfterMaxVPeak_10_20_30 = [];
    
    AnglePerfectAngleTryDown_FinalP_PAfterMaxVPeak_10_20_30 = [];
    ErreurAngulaireDown_FinalP_PAfterMaxVPeak_10_20_30 = [];
    
    
        while AA <= length(FinalPosition_DownTrys)
            
        
        FingerTargetDown_X_FinalP_PAfterMaxVPeak_10_20_30 = [FingerTargetDown_X_FinalP_PAfterMaxVPeak_10_20_30
            TargetDown(1,1)-FinalPosition_DownTrys(AA,1) TargetDown(1,1)-PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,2) TargetDown(1,1)-PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,6) TargetDown(1,1)-PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,10)];
        FingerTargetDown_Y_FinalP_PAfterMaxVPeak_10_20_30 = [FingerTargetDown_Y_FinalP_PAfterMaxVPeak_10_20_30
            FinalPosition_DownTrys(AA,2)-TargetDown(1,2) PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,3)-TargetDown(1,2) PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,7)-TargetDown(1,2) PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,11)-TargetDown(1,2)];
        FingerTargetDown_Z_FinalP_PAfterMaxVPeak_10_20_30 = [FingerTargetDown_Z_FinalP_PAfterMaxVPeak_10_20_30
            TargetDown(1,3)-FinalPosition_DownTrys(AA,3) TargetDown(1,3)-PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,4) TargetDown(1,3)-PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,8) TargetDown(1,3)-PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,12)];
        FingerTargetDown_Transveral_FinalP_PAfterMaxVPeak_10_20_30 = [FingerTargetDown_Transveral_FinalP_PAfterMaxVPeak_10_20_30
            sqrt(((abs(FinalPosition_DownTrys(AA,1)-TargetDown(1,1)))^2)+((abs(FinalPosition_DownTrys(AA,2)-TargetDown(1,2)))^2)) sqrt(((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,2)-TargetDown(1,1)))^2)+((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,3)-TargetDown(1,2)))^2)) sqrt(((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,6)-TargetDown(1,1)))^2)+((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,7)-TargetDown(1,2)))^2)) sqrt(((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,10)-TargetDown(1,1)))^2)+((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,11)-TargetDown(1,2)))^2))];
        FingerTargetDown_Saggital_FinalP_PAfterMaxVPeak_10_20_30 = [FingerTargetDown_Saggital_FinalP_PAfterMaxVPeak_10_20_30
            sqrt(((abs(FinalPosition_DownTrys(AA,1)-TargetDown(1,1)))^2)+((abs(FinalPosition_DownTrys(AA,3)-TargetDown(1,3)))^2)) sqrt(((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,2)-TargetDown(1,1)))^2)+((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,4)-TargetDown(1,3)))^2)) sqrt(((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,6)-TargetDown(1,1)))^2)+((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,8)-TargetDown(1,3)))^2)) sqrt(((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,10)-TargetDown(1,1)))^2)+((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,12)-TargetDown(1,3)))^2))];
        FingerTargetDown_Frontal_FinalP_PAfterMaxVPeak_10_20_30 = [FingerTargetDown_Frontal_FinalP_PAfterMaxVPeak_10_20_30
            sqrt(((abs(FinalPosition_DownTrys(AA,2)-TargetDown(1,2)))^2)+((abs(FinalPosition_DownTrys(AA,3)-TargetDown(1,3)))^2)) sqrt(((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,3)-TargetDown(1,2)))^2)+((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,4)-TargetDown(1,3)))^2)) sqrt(((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,7)-TargetDown(1,2)))^2)+((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,8)-TargetDown(1,3)))^2)) sqrt(((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,11)-TargetDown(1,2)))^2)+((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,12)-TargetDown(1,3)))^2))];
        FingerTargetDown_3D_FinalP_PAfterMaxVPeak_10_20_30 = [FingerTargetDown_3D_FinalP_PAfterMaxVPeak_10_20_30
            sqrt(((abs(FinalPosition_DownTrys(AA,1)-TargetDown(1,1)))^2)+((abs(FinalPosition_DownTrys(AA,2)-TargetDown(1,2)))^2)+((abs(FinalPosition_DownTrys(AA,3)-TargetDown(1,3)))^2)) sqrt(((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,2)-TargetDown(1,1)))^2)+((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,3)-TargetDown(1,2)))^2)+((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,4)-TargetDown(1,3)))^2)) sqrt(((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,6)-TargetDown(1,1)))^2)+((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,7)-TargetDown(1,2)))^2)+((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,8)-TargetDown(1,3)))^2)) sqrt(((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,10)-TargetDown(1,1)))^2)+((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,11)-TargetDown(1,2)))^2)+((abs(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,12)-TargetDown(1,3)))^2))];
        
        AnglePerfectDown_FinalP = acosd((abs(Shoulder_FinalP_DownTrys(AA,1)-TargetDown(1,1)))/(sqrt(((abs(Shoulder_FinalP_DownTrys(AA,1)-TargetDown(1,1)))^2)+((abs(Shoulder_FinalP_DownTrys(AA,3)-TargetDown(1,3)))^2))));
        AngleTryDown_FinalP = acosd((abs(Shoulder_FinalP_DownTrys(AA,1)-FinalPosition_DownTrys(AA,1)))/(sqrt(((abs(Shoulder_FinalP_DownTrys(AA,1)-FinalPosition_DownTrys(AA,1)))^2)+((abs(Shoulder_FinalP_DownTrys(AA,3)-FinalPosition_DownTrys(1,3)))^2))));
        ErreurAngulaireDown_FinalP = AngleTryDown_FinalP-AnglePerfectDown_FinalP;
        
        AnglePerfectDown_PAfterMaxVPeak_10 = acosd((abs(Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,2)-TargetDown(1,1)))/(sqrt(((abs(Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,2)-TargetDown(1,1)))^2)+((abs(Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,4)-TargetDown(1,3)))^2))));
        AngleTryDown_PAfterMaxVPeak_10 = acosd((abs(Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,2)-PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,2)))/(sqrt(((abs(Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,2)-PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,2)))^2)+((abs(Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,4)-PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,4)))^2))));
        ErreurAngulaireDown_PAfterMaxVPeak_10 = AngleTryDown_PAfterMaxVPeak_10-AnglePerfectDown_PAfterMaxVPeak_10;
        
        AnglePerfectDown_PAfterMaxVPeak_20 = acosd((abs(Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,6)-TargetDown(1,1)))/(sqrt(((abs(Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,6)-TargetDown(1,1)))^2)+((abs(Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,8)-TargetDown(1,3)))^2))));
        AngleTryDown_PAfterMaxVPeak_20 = acosd((abs(Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,6)-PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,6)))/(sqrt(((abs(Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,6)-PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,6)))^2)+((abs(Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,8)-PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,8)))^2))));
        ErreurAngulaireDown_PAfterMaxVPeak_20 = AngleTryDown_PAfterMaxVPeak_20-AnglePerfectDown_PAfterMaxVPeak_20;
        
        AnglePerfectDown_PAfterMaxVPeak_30 = acosd((abs(Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,10)-TargetDown(1,1)))/(sqrt(((abs(Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,10)-TargetDown(1,1)))^2)+((abs(Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,12)-TargetDown(1,3)))^2))));
        AngleTryDown_PAfterMaxVPeak_30 = acosd((abs(Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,10)-PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,10)))/(sqrt(((abs(Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,10)-PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,10)))^2)+((abs(Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,12)-PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(AA,12)))^2))));
        ErreurAngulaireDown_PAfterMaxVPeak_30 = AngleTryDown_PAfterMaxVPeak_30-AnglePerfectDown_PAfterMaxVPeak_30;
        
        AnglePerfectAngleTryDown_FinalP_PAfterMaxVPeak_10_20_30 = [AnglePerfectAngleTryDown_FinalP_PAfterMaxVPeak_10_20_30
            AnglePerfectDown_FinalP AngleTryDown_FinalP AnglePerfectDown_PAfterMaxVPeak_10 AngleTryDown_PAfterMaxVPeak_10 AnglePerfectDown_PAfterMaxVPeak_20 AngleTryDown_PAfterMaxVPeak_20 AnglePerfectDown_PAfterMaxVPeak_30 AngleTryDown_PAfterMaxVPeak_30];
        ErreurAngulaireDown_FinalP_PAfterMaxVPeak_10_20_30 = [ErreurAngulaireDown_FinalP_PAfterMaxVPeak_10_20_30
            ErreurAngulaireDown_FinalP ErreurAngulaireDown_PAfterMaxVPeak_10 ErreurAngulaireDown_PAfterMaxVPeak_20 ErreurAngulaireDown_PAfterMaxVPeak_30];
        
        AA = AA+1;
        
        
        end
    
        
        
    ErreurAngulaireDown_FinalP_PAfterMaxVPeak_10_20_30_M_SD_min_max = [mean(ErreurAngulaireDown_FinalP_PAfterMaxVPeak_10_20_30(:,1)) std(ErreurAngulaireDown_FinalP_PAfterMaxVPeak_10_20_30(:,1)) min(ErreurAngulaireDown_FinalP_PAfterMaxVPeak_10_20_30(:,1)) max(ErreurAngulaireDown_FinalP_PAfterMaxVPeak_10_20_30(:,1)) mean(ErreurAngulaireDown_FinalP_PAfterMaxVPeak_10_20_30(:,2)) std(ErreurAngulaireDown_FinalP_PAfterMaxVPeak_10_20_30(:,2)) min(ErreurAngulaireDown_FinalP_PAfterMaxVPeak_10_20_30(:,2)) max(ErreurAngulaireDown_FinalP_PAfterMaxVPeak_10_20_30(:,2)) mean(ErreurAngulaireDown_FinalP_PAfterMaxVPeak_10_20_30(:,3)) std(ErreurAngulaireDown_FinalP_PAfterMaxVPeak_10_20_30(:,3)) min(ErreurAngulaireDown_FinalP_PAfterMaxVPeak_10_20_30(:,3)) max(ErreurAngulaireDown_FinalP_PAfterMaxVPeak_10_20_30(:,3)) mean(ErreurAngulaireDown_FinalP_PAfterMaxVPeak_10_20_30(:,4)) std(ErreurAngulaireDown_FinalP_PAfterMaxVPeak_10_20_30(:,4)) min(ErreurAngulaireDown_FinalP_PAfterMaxVPeak_10_20_30(:,4)) max(ErreurAngulaireDown_FinalP_PAfterMaxVPeak_10_20_30(:,4))];
    
    FingerTargetDown_XYZ_FinalP_PAfterMaxVPeak_10_20_30 = [FingerTargetDown_X_FinalP_PAfterMaxVPeak_10_20_30 FingerTargetDown_Y_FinalP_PAfterMaxVPeak_10_20_30 FingerTargetDown_Z_FinalP_PAfterMaxVPeak_10_20_30];
    FingerTargetDown_Tra_Sag_Fro_3D_FinalP_PAfterMaxVPeak_10_20_30 = [FingerTargetDown_Transveral_FinalP_PAfterMaxVPeak_10_20_30 FingerTargetDown_Saggital_FinalP_PAfterMaxVPeak_10_20_30 FingerTargetDown_Frontal_FinalP_PAfterMaxVPeak_10_20_30 FingerTargetDown_3D_FinalP_PAfterMaxVPeak_10_20_30];
    
    FingerTargetDown_XYZ_FinalP_PMaxVPeak_10_20_30_M_SD = [mean(FingerTargetDown_X_FinalP_PAfterMaxVPeak_10_20_30) std(FingerTargetDown_X_FinalP_PAfterMaxVPeak_10_20_30) mean(FingerTargetDown_Y_FinalP_PAfterMaxVPeak_10_20_30) std(FingerTargetDown_Y_FinalP_PAfterMaxVPeak_10_20_30) mean(FingerTargetDown_Z_FinalP_PAfterMaxVPeak_10_20_30) std(FingerTargetDown_Z_FinalP_PAfterMaxVPeak_10_20_30)];
    FingerTargetDown_Tra_Sag_Fro_3D_FinalP_PMaxVPeak_10_20_30_M_SD = [mean(FingerTargetDown_Transveral_FinalP_PAfterMaxVPeak_10_20_30) std(FingerTargetDown_Transveral_FinalP_PAfterMaxVPeak_10_20_30) mean(FingerTargetDown_Saggital_FinalP_PAfterMaxVPeak_10_20_30) std(FingerTargetDown_Saggital_FinalP_PAfterMaxVPeak_10_20_30) mean(FingerTargetDown_Frontal_FinalP_PAfterMaxVPeak_10_20_30) std(FingerTargetDown_Frontal_FinalP_PAfterMaxVPeak_10_20_30) mean(FingerTargetDown_3D_FinalP_PAfterMaxVPeak_10_20_30) std(FingerTargetDown_3D_FinalP_PAfterMaxVPeak_10_20_30)];
    
    
    
    ErreurConstanteUp_FinalP_PAfterMaxVPeak_10_20_30 = [mean(FinalPosition_UpTrys(:,3)-TargetUp(:,3)) mean(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(:,4)-TargetUp(:,3)) mean(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(:,8)-TargetUp(:,3)) mean(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(:,12)-TargetUp(:,3))];
    ErreurConstanteDown_FinalP_PAfterMaxVPeak_10_20_30 = [mean(TargetDown(:,3)-FinalPosition_DownTrys(:,3)) mean(TargetDown(:,3)-PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(:,4)) mean(TargetDown(:,3)-PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(:,8)) mean(TargetDown(:,3)-PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(:,12))];
    
    ErreurVariableUp_FinalP_PAfterMaxVPeak_10_20_30 = [std(FinalPosition_UpTrys(:,3)) std(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(:,4)) std(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(:,8)) std(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys(:,12))];
    ErreurVariableDown_FinalP_PAfterMaxVPeak_10_20_30 = [std(FinalPosition_DownTrys(:,3)) std(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(:,4)) std(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(:,8)) std(PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys(:,12))];
    
    
    
    save('Results_S18_P12','T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax','T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_UpTrys','T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_DownTrys','T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD','T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD_UpTrys','T_VerticalAMP_MaxMin_OffsetOnset_EndStart_Vmax_M_SD_DownTrys','RA_RtPa_RtPd','RA_RtPa_RtPd_UpTrys','RA_RtPa_RtPd_DownTrys','RA_RtPa_RtPd_M_SD','RA_RtPa_RtPd_M_SD_UpTrys','RA_RtPa_RtPd_M_SD_DownTrys','LateralDeviation','LateralDeviation_UpTrys','LateralDeviation_DownTrys','LateralDeviation_M_SD_Min_Max','LateralDeviation_M_SD_Min_Max_UpTrys','LateralDeviation_M_SD_Min_Max_DownTrys','FinalPosition_UpTrys','FinalPosition_DownTrys','FinalPosition_M_SD_Min_Max_UpTrys','FinalPosition_M_SD_Min_Max_DownTrys','ZMax_Ind_XYZ_UpTrys','ZMax_Ind_XYZ_DownTrys','Shoulder_FinalP_UpTrys','Shoulder_FinalP_DownTrys','Shoulder_FinalP_M_SD_Min_Max_UpTrys','Shoulder_FinalP_M_SD_Min_Max_DownTrys','NofVPeaks_UpTrys','NofVPeaks_DownTrys','PositionAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys','PositionAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys','PositionAfterMaxVPeak_Ind_XYZ_10_20_30_M_SD_Min_Max_UpTrys','PositionAfterMaxVPeak_Ind_XYZ_10_20_30_M_SD_Min_Max_DownTrys','Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_UpTrys','Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_DownTrys','Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_M_SD_Min_Max_UpTrys','Shoulder_PAfterMaxVPeak_Ind_XYZ_10_20_30_M_SD_Min_Max_DownTrys','FingerPosition','FingerPosition_UpTrys','FingerPosition_DownTrys','FingerPosition_XYZ_M_SD_Min_Max_AMP','FingerPosition_XYZ_M_SD_Min_Max_AMP_UpTrys','FingerPosition_XYZ_M_SD_Min_Max_AMP_DownTrys','ShoulderPosition','ShoulderPosition_UpTrys','ShoulderPosition_DownTrys','ShoulderPosition_XYZ_M_SD_Min_Max_AMP','ShoulderPosition_XYZ_M_SD_Min_Max_AMP_UpTrys','ShoulderPosition_XYZ_M_SD_Min_Max_AMP_DownTrys','TargetUp','TargetDown','ArmLength','ArmLength_UpTrys','ArmLength_DownTrys','ArmLength_M_SD_start_end_min_max','ArmLength_M_SD_start_end_min_max_UpTrys','ArmLength_M_SD_start_end_min_max_DownTrys','ElbowAngle_CauchySchwartz_AlKashi','ElbowAngle_CauchySchwartz_AlKashi_UpTrys','ElbowAngle_CauchySchwartz_AlKashi_DownTrys','ElbowAngle_CS_AK_M_SD_start_end_min_max','ElbowAngle_CS_AK_M_SD_start_end_min_max_UpTrys','ElbowAngle_CS_AK_M_SD_start_end_min_max_DownTrys','WristAngle_CauchySchwartz_AlKashi','WristAngle_CauchySchwartz_AlKashi_UpTrys','WristAngle_CauchySchwartz_AlKashi_DownTrys','WristAngle_CS_AK_M_SD_start_end_min_max','WristAngle_CS_AK_M_SD_start_end_min_max_UpTrys','WristAngle_CS_AK_M_SD_start_end_min_max_DownTrys','Velocity','Velocity_UpTrys','Velocity_DownTrys','Velocity_M_SD_Min_Max','Velocity_M_SD_Min_Max_UpTrys','Velocity_M_SD_Min_Max_DownTrys','Velocity_Normalized','Velocity_Normalized_UpTrys','Velocity_Normalized_DownTrys','FingerTargetUp_XYZ_FinalP_PAfterMaxVPeak_10_20_30','FingerTargetUp_XYZ_FinalP_PMaxVPeak_10_20_30_M_SD','FingerTargetUp_Tra_Sag_Fro_3D_FinalP_PAfterMaxVPeak_10_20_30','FingerTargetUp_Tra_Sag_Fro_3D_FinalP_PMaxVPeak_10_20_30_M_SD','AnglePerfectAngleTryUp_FinalP_PAfterMaxVPeak_10_20_30','ErreurAngulaireUp_FinalP_PAfterMaxVPeak_10_20_30','ErreurAngulaireUp_FinalP_PAfterMaxVPeak_10_20_30_M_SD_min_max','FingerTargetDown_XYZ_FinalP_PAfterMaxVPeak_10_20_30','FingerTargetDown_XYZ_FinalP_PMaxVPeak_10_20_30_M_SD','FingerTargetDown_Tra_Sag_Fro_3D_FinalP_PAfterMaxVPeak_10_20_30','FingerTargetDown_Tra_Sag_Fro_3D_FinalP_PMaxVPeak_10_20_30_M_SD','AnglePerfectAngleTryDown_FinalP_PAfterMaxVPeak_10_20_30','ErreurAngulaireDown_FinalP_PAfterMaxVPeak_10_20_30','ErreurAngulaireDown_FinalP_PAfterMaxVPeak_10_20_30_M_SD_min_max','ErreurConstanteUp_FinalP_PAfterMaxVPeak_10_20_30','ErreurConstanteDown_FinalP_PAfterMaxVPeak_10_20_30','ErreurVariableUp_FinalP_PAfterMaxVPeak_10_20_30','ErreurVariableDown_FinalP_PAfterMaxVPeak_10_20_30');
    
    
    
end