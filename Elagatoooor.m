RESULTS_folder = {uigetdir};


N = 3;


load(['Try' num2str(N) '.mat']);

Start = 20;
End = length(Z);

Z = Z(Start:End,:);
T = T(Start:End,:);

save('Try3','Z','T')