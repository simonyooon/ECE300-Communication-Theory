% Simon Yoon
% ECE300PS05 Q4 

clc
clear
close all;

s = [1, 0.8, 0.1, 0.01];

lambda1 = 0.01;     % initial values determined through random manual plugging prior
lambda2 = .25;      % "

for i = 1:15
    midpt = (lambda1 + lambda2) / 2;
    
    d1 = dVal(lambda1);
    d2 = dVal(lambda2);
    dM = dVal(midpt);
    
    r1 = 0;
    r2 = 0;
    rM = 0;
   
    for j = 1:4
        r1 = r1+.5*log(s(1, j)/d1(1, j));
        r2 = r2+.5*log(s(1, j)/d2(1, j));
        rM = rM+.5*log(s(1, j)/dM(1, j));
    end
    
    if rM < 3
        lambda2 = midpt;
    else    
        lambda1 = midpt;
    end
  
end
fprintf('Straddled to \x03bb%c:',8322)
fprintf('\x03bb%c = %d', 8322, lambda2);
fprintf('R for \x03bb%c = %d', 8322, r2);

%%
function D = dVal(lambda)
    D = zeros([1, 4]);
    sigma = [1, .8, .1, .01];
    for k = 1:4
        if sigma(1,k) > lambda
            D(1,k) = lambda;
        else
            D(1,k) = sigma(1,k);
        end
    end
end