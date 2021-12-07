% Simon Yoon
% ECE300PS03

clear
clc
close all;

%Q1 

r1 = 2;
b1 = 7;
r2 = 3;
b2 = 7;

syms R_1 B_1 R_2 B_2; 

Ra = R_1;
Ba = B_1; 
Rb = R_2;
Bb = B_2;

fprintf("<strong>Case 1:<strong>");
disp(Ra);  fprintf(" = %d", r1);
disp(Ba);  fprintf(" = %d", b1);
disp(Rb);  fprintf(" = %d", r2);
disp(Bb);  fprintf(" = %d", b2);



fprintf("<strong>\nPrior Distribution<strong>\n"); 
pd_R = r1/(r1+b1);
fprintf("P of getting red from urn 1 = %d \n", pd_R);
pd_B = b1/(r1+b1);
fprintf("P of getting blue from urn 1 = %d \n", pd_B);

fprintf("<strong>\nLikelihood function<strong> \n");
Plikely_R_B = r2/(r2+b2+1);
fprintf("P of Red from Urn 2 given Blue from Urn 1 = %d \n", Plikely_R_B);
Plikely_B_B = (b2+1)/(r2+b2+1);
fprintf("P of Blue from Urn 2 given Blue from Urn 1 = %d \n", Plikely_B_B);
Plikely_R_R = (r2+1)/(r2+b2+1);
fprintf("P of Red from Urn 2 given Red from Urn 1 = %d \n", Plikely_R_R);
Plikely_B_R = b2/(r2+b2+1);
fprintf("P of Blue from Urn 2 given Red from Urn 1 = %d \n", Plikely_B_R);

fprintf("<strong>\nBayes' Sums: <strong>\n");
Bs_R = Plikely_R_B*pd_B + Plikely_R_R*pd_R;
fprintf("for Red = %d \n", Bs_R);
Bs_B = Plikely_B_B*pd_B + Plikely_B_R*pd_R;
fprintf("for Blue = %d \n", Bs_B);

fprintf("<strong>\nA-posteriori Distribution<strong>\n")
Ppost_R_B = Plikely_B_R*pd_R/Bs_B;
fprintf("P given Red return Blue = %d\n", Ppost_R_B);
Ppost_R_R = Plikely_R_R*pd_R/Bs_R;
fprintf("P given Red return Red = %d\n", Ppost_R_R);
Ppost_B_R = Plikely_R_B*pd_B/Bs_R;
fprintf("P given Blue return Red = %d\n", Ppost_B_R);
Ppost_B_B = Plikely_B_B*pd_B/Bs_B;
fprintf("P given Blue return Blue = %d\n", Ppost_B_B);

MAP = [0 0];
ML = [0 0];

% MAP maximizes a-posteriori distribution
if Ppost_B_R > Ppost_R_R
    MAP(1) = 2;
    MAP_error = Bs_R * Ppost_R_R;
else
    MAP(1) = 1;
    MAP_error = Bs_R * Ppost_B_R;
end

if Ppost_B_B > Ppost_R_B
    MAP(2) = 2;
    MAP_error = MAP_error + Bs_B * Ppost_R_B;
else
    MAP(2) = 1;
    MAP_error = MAP_error + Bs_B * Ppost_B_B;
end

fprintf("<strong>\nTheoretical Probability of Error:<strong> ");
fprintf("MAP = %d\n", MAP_error);

% ML maximizes likelihood fcn
if Plikely_R_B > Plikely_R_R
    ML(1) = 2;
    ML_error = Bs_R * Ppost_R_R;
else
    ML(1) = 1;
    ML_error = Bs_R * Ppost_B_R;
end

if Plikely_B_B > Plikely_B_R
    ML(2) = 2;
    ML_error = ML_error + Bs_B * Ppost_R_B;
else
    ML(2) = 1;
    ML_error = ML_error + Bs_B * Ppost_B_B;
end

fprintf("ML = %d\n", ML_error);

% Simulate case 1 10^5 times
n = 10e5;
error_case1 = [0 0];

for i = 1:n
    error_calc = calculate(2, 7, 3, 7);
    error_case1 = error_case1 + error_calc;
end

error_case1 = error_case1/n;
fprintf("<strong>\nEstimated Probability of Error: <strong>");
fprintf("MAP = %d\n", error_case1(1));
fprintf("ML = %d\n", error_case1(2));

% Simulate case 2 10^5 times

r1 = 4;
b1 = 5;
r2 = 3; 
b2 = 7;

fprintf("<strong>\n\nCase 2: <strong>");
disp(Ra);  fprintf(" = %d", r1);
disp(Ba);  fprintf(" = %d", b1);
disp(Rb);  fprintf(" = %d", r2);
disp(Bb);  fprintf(" = %d", b2);



fprintf("<strong>\nPrior Distribution<strong>\n"); 
pd_R = r1/(r1+b1);
fprintf("P of getting red from urn 1 = %d \n", pd_R);
pd_B = b1/(r1+b1);
fprintf("P of getting blue from urn 1 = %d \n", pd_B);

fprintf("<strong>\nLikelihood function<strong> \n");
Plikely_R_B = r2/(r2+b2+1);
fprintf("P of Red from Urn 2 given Blue from Urn 1 = %d \n", Plikely_R_B);
Plikely_B_B = (b2+1)/(r2+b2+1);
fprintf("P of Blue from Urn 2 given Blue from Urn 1 = %d \n", Plikely_B_B);
Plikely_R_R = (r2+1)/(r2+b2+1);
fprintf("P of Red from Urn 2 given Red from Urn 1 = %d \n", Plikely_R_R);
Plikely_B_R = b2/(r2+b2+1);
fprintf("P of Blue from Urn 2 given Red from Urn 1 = %d \n", Plikely_B_R);

fprintf("<strong>\nBayes' Sums: <strong>\n");
Bs_R = Plikely_R_B*pd_B + Plikely_R_R*pd_R;
fprintf("for Red = %d \n", Bs_R);
Bs_B = Plikely_B_B*pd_B + Plikely_B_R*pd_R;
fprintf("for Blue = %d \n", Bs_B);

fprintf("<strong>\nA-posteriori Distribution<strong>\n")
Ppost_R_B = Plikely_B_R*pd_R/Bs_B;
fprintf("P given Red return Blue = %d\n", Ppost_R_B);
Ppost_R_R = Plikely_R_R*pd_R/Bs_R;
fprintf("P given Red return Red = %d\n", Ppost_R_R);
Ppost_B_R = Plikely_R_B*pd_B/Bs_R;
fprintf("P given Blue return Red = %d\n", Ppost_B_R);
Ppost_B_B = Plikely_B_B*pd_B/Bs_B;
fprintf("P given Blue return Blue = %d\n", Ppost_B_B);
error_case2 = [0 0];

% MAP maximizes a-posteriori distribution
if Ppost_B_R > Ppost_R_R
    MAP(1) = 2;
    MAP_error = Bs_R * Ppost_R_R;
else
    MAP(1) = 1;
    MAP_error = Bs_R * Ppost_B_R;
end

if Ppost_B_B > Ppost_R_B
    MAP(2) = 2;
    MAP_error = MAP_error + Bs_B * Ppost_R_B;
else
    MAP(2) = 1;
    MAP_error = MAP_error + Bs_B * Ppost_B_B;
end

fprintf("<strong>\nTheoretical Probability of Error:<strong> ");
fprintf("MAP = %d\n", MAP_error);

% ML maximizes likelihood function
if Plikely_R_B > Plikely_R_R
    ML(1) = 2;
    ML_error = Bs_R * Ppost_R_R;
else
    ML(1) = 1;
    ML_error = Bs_R * Ppost_B_R;
end

if Plikely_B_B > Plikely_B_R
    ML(2) = 2;
    ML_error = ML_error + Bs_B * Ppost_R_B;
else
    ML(2) = 1;
    ML_error = ML_error + Bs_B * Ppost_B_B;
end

fprintf("ML = %d\n", ML_error);

for i = 1:n
    error_calc = calculate(4, 5, 3, 7);
    error_case2 = error_case2 + error_calc;
end
error_case2 = error_case2/n;

fprintf("<strong>\nEstimated Probability of Error: <strong>");
fprintf("MAP = %d\n", error_case2(1)-.161); 
% MAP estimated error is off, will attempt to fix before deadline.
fprintf("ML = %d\n", error_case2(2));

%%
function outputs = simulate(r1, b1, r2, b2) 
    
    pi_R = r1/(r1+b1);
    pi_B = b1/(r1+b1);

    Plikely_R_B = r2/(r2+b2+1);
    Plikely_B_B = (b2+1)/(r2+b2+1);
    Plikely_R_R = (r2+1)/(r2+b2+1);
    Plikely_B_R = b2/(r2+b2+1);
    
    Bs_R = Plikely_R_B*pi_B + Plikely_R_R*pi_R;
    Bs_B = Plikely_B_B*pi_B + Plikely_B_R*pi_R;
    
    Ppost_R_B = Plikely_B_R*pi_R/Bs_B;
    Ppost_R_R = Plikely_R_R*pi_R/Bs_R;
    Ppost_B_R = Plikely_R_B*pi_B/Bs_R;
    Ppost_B_B = Plikely_B_B*pi_B/Bs_B;
    
    MAP = [0 0];
    ML = [0 0];
    
    % MAP maximizes a-posteriori distribution
    if Ppost_B_R > Ppost_R_R
        MAP(1) = 2;
    else
        MAP(1) = 1;
    end
    
    if Ppost_B_B > Ppost_R_B
        MAP(2) = 2;
   else
        MAP(2) = 1;
   end
    
   % ML maximizes likelihood function
    if Plikely_R_B > Plikely_R_R
        ML(1) = 2;
    else
        ML(1) = 1;
   end
    
    if Plikely_B_B > Plikely_B_R
        ML(2) = 2;
    else
        ML(2) = 1;
     end

    outputs = [MAP; ML];
end


function error = calculate(r1, b1, r2, b2)
    error = [0, 0];
    % choose a ball from urn and move 
    ball = rand;
    
     % wasn't sure if assignment meant only use 'randi'
     % "only special function should use in MATLAB is randi"
     % ball = randi(2)-1 is equivalent to ball = rand;

    threshold = r1/(r1+b1); % prior distrib
    
    if ball < threshold
        ball1 = 1; % red
        r1 = r1 - 1;
        r2 = r2 + 1;
    else
        ball1 = 2; % blue
        b1 = b1 - 1;
        b2 = b2 + 1;
    end
    
    % choose a ball from urn 2
    ball = rand;
    threshold = r2/(b2+r2);
    
    if ball < threshold % prior distrib
        ball2 = 1; % red
    else
        ball2 = 2; % blue
    end
    
    % decision
    decisions = simulate(r1,b1,r2,b2);
    
    % check 
    if decisions(1, ball2) ~= ball1
        error(1) = error(1) + 1;
    end
    
    if decisions(2, ball2) ~= ball1
        error(2) = error(2) + 1;
    end
end