clc
clear all

birthdate = 20000725   % Write the birth date on format yyyymmdd for oldest member
format compact
[lambda1,lambda2,mu1,mu2,V1,V2,V] = getFerrydata(birthdate);  % Do not clear or redefine these variables.

%lambda1 = 13;
%lambda2 = 12;
%mu1 = 14;
%mu2 = 19;
%V1 = 10;
%V2 = 14;
%V = 21;
h=0.001; % Discretization step

%% ANALYTIC SOLUTION
% Question 1 should be answered in the report

% Question 2 should be answered in the report, and submitted below

Qi = [-lambda1-lambda2 lambda1 lambda2 0
      3*mu1 -lambda2-3*mu1 0 lambda2
      3*mu2 0 -lambda1-3*mu2 lambda1
      0 0*mu2 3*mu1 -3*mu1-0*mu2]; 
Qieig=sort(eig(Qi)); % We compare the eigenvalues
% To make sure that the order of your states will not change the result

Qii = [-lambda1-lambda2 lambda1 lambda2 0
      3*mu1 -lambda2-3*mu1 0 lambda2
      3*mu2 0 -lambda1-3*mu2 lambda1
      0 1*mu2 2*mu1 -2*mu1-1*mu2];
Qiieig=sort(eig(Qii));

Qiii = [-lambda1-lambda2 lambda1 lambda2 0
      3*mu1 -lambda2-3*mu1 0 lambda2
      3*mu2 0 -lambda1-3*mu2 lambda1
      0 2*mu2 1*mu1 -1*mu1-2*mu2];
Qiiieig=sort(eig(Qiii));

Qiv = [-lambda1-lambda2 lambda1 lambda2 0
      3*mu1 -lambda2-3*mu1 0 lambda2
      3*mu2 0 -lambda1-3*mu2 lambda1
      0 3*mu2 0*mu1 -0*mu1-3*mu2];
Qiveig=sort(eig(Qiv));

% Question 3 should be answered in the report

% Question 4 should be answered in the report, describe how you do it, and  

PIi  = null(Qi') / sum(null(Qi'));
PIisort=sort(PIi); % We compare the sorted vectors
PIii = null(Qii') / sum(null(Qii'));
PIiisort=sort(PIii);
PIiii = null(Qiii') / sum(null(Qiii'));
PIiiisort=sort(PIiii);
PIiv = null(Qiv') / sum(null(Qiv'));
PIivsort=sort(PIiv);

% Question 5 should be answered in the report, describe how you do it, and  

speedVector = [V V2 V1 0]

AVi = PIi'*speedVector' 
AVii = PIii'*speedVector' 
AViii = PIiii'*speedVector' 
AViv =PIiv'*speedVector'  

AV= [AVi AVii AViii AViv];

%% CONTINUOUS TIME SIMULATION
% Question 6a should be answered in the report

% Question 7a should be answered in the report, describe how you do it, and check that the result agrees with the analytic result

% Question 8a should be answered in the report, describe how you do it, do the calculations and enter results below


%% Simulate continuous-time process for Strategy 1 
i=1;
nextCase = 1;
timeIn1 = 0;
timeIn2 = 0;
timeIn3 = 0;
timeIn4 = 0;

while i<100000
    switch nextCase

        case 1
        goTo2 = exprnd(1/Qi(1, 2));
        goTo3 = exprnd(1/Qi(1, 3));
        if goTo2<goTo3
            nextCase = 2;
            timeIn1 = timeIn1 + goTo2;
        else
            nextCase = 3;
            timeIn1 = timeIn1 + goTo3;
        end

        case 2
        goTo1 = exprnd(1/Qi(2, 1));
        goTo4 = exprnd(1/Qi(2, 4));
        if goTo1<goTo4
            nextCase = 1;
            timeIn2 = timeIn2 + goTo1;
        else
            nextCase = 4;
            timeIn2 = timeIn2 + goTo4;
        end
    
        case 3
        goTo1 = exprnd(1/Qi(3, 1));
        goTo4 = exprnd(1/Qi(3, 4));
        if goTo1<goTo4
            nextCase = 1;
            timeIn3 = timeIn3 + goTo1;
        else
            nextCase = 4;
            timeIn3 = timeIn3 + goTo4;
        end

        case 4
        goTo2 = exprnd(1/Qi(4, 2));
        goTo3 = exprnd(1/Qi(4, 3));
        if goTo2<goTo3
            nextCase = 2;
            timeIn4 = timeIn4 + goTo2;
        else
            nextCase = 3;
            timeIn4 = timeIn4 + goTo3;
        end

        otherwise
    end
     i = i+1;
end

timeIn = [timeIn1 timeIn2 timeIn3 timeIn4];
avgVelocityContinuousStrategy1 = timeIn*speedVector' / sum(timeIn)

%% Simulate continuous-time process for Strategy 2 
i=1;
nextCase = 1;
timeIn1 = 0;
timeIn2 = 0;
timeIn3 = 0;
timeIn4 = 0;

while i<100000
    switch nextCase

        case 1
        goTo2 = exprnd(1/Qii(1, 2));
        goTo3 = exprnd(1/Qii(1, 3));
        if goTo2<goTo3
            nextCase = 2;
            timeIn1 = timeIn1 + goTo2;
        else
            nextCase = 3;
            timeIn1 = timeIn1 + goTo3;
        end

        case 2
        goTo1 = exprnd(1/Qii(2, 1));
        goTo4 = exprnd(1/Qii(2, 4));
        if goTo1<goTo4
            nextCase = 1;
            timeIn2 = timeIn2 + goTo1;
        else
            nextCase = 4;
            timeIn2 = timeIn2 + goTo4;
        end
    
        case 3
        goTo1 = exprnd(1/Qii(3, 1));
        goTo4 = exprnd(1/Qii(3, 4));
        if goTo1<goTo4
            nextCase = 1;
            timeIn3 = timeIn3 + goTo1;
        else
            nextCase = 4;
            timeIn3 = timeIn3 + goTo4;
        end

        case 4
        goTo2 = exprnd(1/Qii(4, 2));
        goTo3 = exprnd(1/Qii(4, 3));
        if goTo2<goTo3
            nextCase = 2;
            timeIn4 = timeIn4 + goTo2;
        else
            nextCase = 3;
            timeIn4 = timeIn4 + goTo3;
        end

        otherwise
    end
     i = i+1;
end

timeIn = [timeIn1 timeIn2 timeIn3 timeIn4];
avgVelocityContinuousStrategy2 = timeIn*speedVector' / sum(timeIn)

%% Simulate continuous-time process for Strategy 3 
i=1;
nextCase = 1;
timeIn1 = 0;
timeIn2 = 0;
timeIn3 = 0;
timeIn4 = 0;

while i<100000
    switch nextCase

        case 1
        goTo2 = exprnd(1/Qiii(1, 2));
        goTo3 = exprnd(1/Qiii(1, 3));
        if goTo2<goTo3
            nextCase = 2;
            timeIn1 = timeIn1 + goTo2;
        else
            nextCase = 3;
            timeIn1 = timeIn1 + goTo3;
        end

        case 2
        goTo1 = exprnd(1/Qiii(2, 1));
        goTo4 = exprnd(1/Qiii(2, 4));
        if goTo1<goTo4
            nextCase = 1;
            timeIn2 = timeIn2 + goTo1;
        else
            nextCase = 4;
            timeIn2 = timeIn2 + goTo4;
        end
    
        case 3
        goTo1 = exprnd(1/Qiii(3, 1));
        goTo4 = exprnd(1/Qiii(3, 4));
        if goTo1<goTo4
            nextCase = 1;
            timeIn3 = timeIn3 + goTo1;
        else
            nextCase = 4;
            timeIn3 = timeIn3 + goTo4;
        end

        case 4
        goTo2 = exprnd(1/Qiii(4, 2));
        goTo3 = exprnd(1/Qiii(4, 3));
        if goTo2<goTo3
            nextCase = 2;
            timeIn4 = timeIn4 + goTo2;
        else
            nextCase = 3;
            timeIn4 = timeIn4 + goTo3;
        end

        otherwise
    end
     i = i+1;
end

timeIn = [timeIn1 timeIn2 timeIn3 timeIn4];
avgVelocityContinuousStrategy3 = timeIn*speedVector' / sum(timeIn)

%% Simulate continuous-time process for Strategy 4 
i=1;
nextCase = 1;
timeIn1 = 0;
timeIn2 = 0;
timeIn3 = 0;
timeIn4 = 0;

while i<100000
    switch nextCase

        case 1
        goTo2 = exprnd(1/Qiv(1, 2));
        goTo3 = exprnd(1/Qiv(1, 3));
        if goTo2<goTo3
            nextCase = 2;
            timeIn1 = timeIn1 + goTo2;
        else
            nextCase = 3;
            timeIn1 = timeIn1 + goTo3;
        end

        case 2
        goTo1 = exprnd(1/Qiv(2, 1));
        goTo4 = exprnd(1/Qiv(2, 4));
        if goTo1<goTo4
            nextCase = 1;
            timeIn2 = timeIn2 + goTo1;
        else
            nextCase = 4;
            timeIn2 = timeIn2 + goTo4;
        end
    
        case 3
        goTo1 = exprnd(1/Qiv(3, 1));
        goTo4 = exprnd(1/Qiv(3, 4));
        if goTo1<goTo4
            nextCase = 1;
            timeIn3 = timeIn3 + goTo1;
        else
            nextCase = 4;
            timeIn3 = timeIn3 + goTo4;
        end

        case 4
        goTo2 = exprnd(1/Qiv(4, 2));
        goTo3 = exprnd(1/Qiv(4, 3));
        if goTo2<goTo3
            nextCase = 2;
            timeIn4 = timeIn4 + goTo2;
        else
            nextCase = 3;
            timeIn4 = timeIn4 + goTo3;
        end

        otherwise
    end
     i = i+1;
end

timeIn = [timeIn1 timeIn2 timeIn3 timeIn4];
avgVelocityContinuousStrategy4 = timeIn*speedVector' / sum(timeIn)

%% Simulate continuous-time process for finding average failure time 

for i = 1:10000

nextCase = 1;
timeIn1 = 0;
timeIn2 = 0;
timeIn3 = 0;
timeIn4 = 0;

while nextCase ~= 4
    switch nextCase

        case 1
        goTo2 = exprnd(1/Qi(1, 2));
        goTo3 = exprnd(1/Qi(1, 3));
        if goTo2<goTo3
            nextCase = 2;
            timeIn1 = timeIn1 + goTo2;
        else
            nextCase = 3;
            timeIn1 = timeIn1 + goTo3;
        end

        case 2
        goTo1 = exprnd(1/Qi(2, 1));
        goTo4 = exprnd(1/Qi(2, 4));
        if goTo1<goTo4
            nextCase = 1;
            timeIn2 = timeIn2 + goTo1;
        else
            nextCase = 4;
            timeIn2 = timeIn2 + goTo4;
        end
    
        case 3
        goTo1 = exprnd(1/Qi(3, 1));
        goTo4 = exprnd(1/Qi(3, 4));
        if goTo1<goTo4
            nextCase = 1;
            timeIn3 = timeIn3 + goTo1;
        else
            nextCase = 4;
            timeIn3 = timeIn3 + goTo4;
        end

        case 4
        goTo2 = exprnd(1/Qi(4, 2));
        goTo3 = exprnd(1/Qi(4, 3));
        if goTo2<goTo3
            nextCase = 2;
            timeIn4 = timeIn4 + goTo2;
        else
            nextCase = 3;
            timeIn4 = timeIn4 + goTo3;
        end

        otherwise
    end
end

timeIn = [timeIn1 timeIn2 timeIn3];
timeTillFailure(i, :) = sum(timeIn);

end



AVtTF = mean(timeTillFailure)   % This will be the answer to the new question, I will describe it in the pdf.
% Describe in the report how you do this. 

%% DISCRETE TIME SIMULATION
% Question 6b should be answered in the report, describe how you determine the transition matrix and enter below

% P = [1-(lambda1+lambda2) lambda1 lambda2 0
%      3*mu1 1-(lambda2+3*mu1) 0 lambda2
%      3*mu2 0 1-(lambda1+3*mu2) lambda1
%      0 0 3*mu1 1-(3*mu1)];

h = 0.0001;
P = expm (h*Qi);

% Question 7b should be answered in the report, describe how you do it, and check that the result agrees with the analytic result

%% Simulate discrete-time process for Strategy 1 
i=1;
nextCase = 1;
timeIn1 = 0;
timeIn2 = 0;
timeIn3 = 0;
timeIn4 = 0;

for times = 1:100
for i = 1:10000
    switch nextCase

        case 1
        goToProbability = rand;
        nextCase = find(goToProbability < cumsum (P(1, :)), 1);
        timeIn1 = timeIn1 + 1;

        case 2
        goToProbability = rand;
        nextCase = find(goToProbability < cumsum (P(2, :)), 1);
        timeIn2 = timeIn2 + 1;
    
        case 3
        goToProbability = rand;
        nextCase = find(goToProbability < cumsum (P(3, :)), 1);
        timeIn3 = timeIn3 + 1;

        case 4
        goToProbability = rand;
        nextCase = find(goToProbability < cumsum (P(4, :)), 1);
        timeIn4 = timeIn4 + 1;

        otherwise
    end
end
end

timeIn = [timeIn1 timeIn2 timeIn3 timeIn4];
avgVelocityDiscreteStrategy1 = timeIn*speedVector' / sum(timeIn)

% Question 8a should be answered in the report, describe how you do it, do the calculations and enter results below


% Question 9a should be answered in the report, describe how you do it, do the calculations and enter results below

longTimeProb = P^10;
Probfail10 = longTimeProb(1,4);

P = eye(4) + Qi*h
P = P(1:3, 1:3);
I = eye(3);
N = (I-P)^(-1);
ETtTF = sum(N(1, 1:3))


% Some of the following commands may be useful for the implementation when repeating steps over and over
% for, while, switch, break     
