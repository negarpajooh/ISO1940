clear;
clc;
close all
%% Annex A
e_per_Omega=2.5; % compressor, tuibine and machine tool drive
m=input('plz enter[m(kg)]  ');
n=input('plz enter[n(r/min)]  ');
LA=input('plz enter[LA(mm)]  ');
LB=input('plz enter[ LB(mm)]  ');
L=input('plz enter[L(mm)]  ');
Omega=pi*n/30;
Uper=(e_per_Omega*m)/Omega;
Uper=1000*Uper;
%%
answer1=questdlg('Please Select Method','Selection','Grade G','Bearing Force','Others','Grade G');
switch answer1
case 'Grade G'
    %% Grade G
disp('-------------------------------------------------------------------')
disp(' Grade G ')
disp('-------------------------------------------------------------------')
%% calculation
UperA=Uper*LB/L;
UperB=Uper*LA/L;
    case 'Bearing Force'
disp('-------------------------------------------------------------------')
disp(' Bearing Force Limit ')
disp('-------------------------------------------------------------------')
FA=input('plz enter FA ');
FB=input('plz enter FB ');
Omega=input('plz enter \Omega ');
UperA=FA/(Omega^2);
UperB=FB/(Omega^2);
    case 'Others'
answer2=questdlg('Please Select Method','Selection','Established Experience','Tolerance and Correction Plane','Established Experience');
switch answer2
        case 'Established Experience'
disp('-------------------------------------------------------------------')
disp(' Established Experience ')
disp('-------------------------------------------------------------------')
mnew=m;
nnew=n;
% UperA=Uper*LB/L;
% UperB=Uper*LA/L;
UperknownA=input('plz enter U_per_known_A ');
UperknownB=input('plz enter U_per_known_B ');
mknown=input('plz enter known mass rotor[m(kg)] ');
nknown=input('plz enter known speed rotor[n(r/min)] ');
UpernewA=(UperknownA*mnew*nknown)/(mknown*nnew);
UpernewB=(UperknownB*mnew*nknown)/(mknown*nnew);
UperA=UpernewA;
UperB=UpernewB;
%
        case 'Tolerance and Correction Plane'
disp('-------------------------------------------------------------------')
disp(' Tolerance and Correction Plane ')
disp('-------------------------------------------------------------------')
answer3=questdlg('Please Select Method','Selection','in-between','outside','in-between');
switch answer3
    case 'in-between'
disp('===================================================================')
disp(' in-between tolerance ')
disp('===================================================================')
    % in-between tolerance
       UperI=UperA;  
       UperII=UperB;    
    case 'outside'
disp('===================================================================')
disp(' outside tolerance plane ')
disp('===================================================================')
    % outside tolerance plane
    b=input('plz enter[b(m)]  ');
    UperI=UperA*L/b;  
    UperII=UperB;  
end
end
end
%% check
MaxUper=0.7*Uper;
MinUper=0.3*Uper;
%
MaxBearing=max(UperA,UperB); 
MinBearing=max(UperA,UperB); 
%
if MaxBearing<MaxUper && MinBearing>=MinUper
    disp(' ')
    disp('Successful')
else
    disp(' ')
    disp('Failed')
end












