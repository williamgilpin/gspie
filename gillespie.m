function [T_fin, M_fin, P_fin] = gillespie(a_m, a_p, t_m, t_p, m_0, p_0, t_max)

% Simulates a stochastic differential equation using the Gillespie
% algorithm, using the given input parameters for the simulation.
%
% Sample Input and Output:
%
%
% [t, m, p] = gillespie(3, 5, 3, 30, 0, 0, 10000);
% mean M
%     9.5481
% 
% var M
%     9.2174
% 
% mean P
%    1.3606e+03
% 
% var P
%    1.9604e+04
%
% written by William Gilpin 2012



t = 0;
% start clock at zero
t_increment = 1;
% hard to predict how fast the simulation will reach the loop termination
% condition, so overestimate this parameter for now.

m = m_0;
p = p_0;
% initialize total number of reagents m and p


i=1;
% index for vectors
T(1,t_max/t_increment+1)=0;
T(1,i)=t;
% time index makes sure that our plots have correct spacing.
M(1,t_max/t_increment+1)=0;
M(1,i)=m;
P(1,t_max/t_increment+1)=0;
P(1,i)=p;


while t < t_max
    
    
    a1 = a_m;
    a2 = a_p*m;
    a3 = (m/(t_m));
    a4 = (p/(t_p));
    a0 = a1 + a2 + a3 + a4;
    
    r1 = rand;
    r2 = rand;
    
    tau = (1/a0)*log(1/r1);
    
    s1 = a1/a0;
    s2 = (a1+a2)/a0;
    s3 = (a1+a2+a3)/a0;
    s4 = a0;
    j = find([s1 s2 s3 s4]>r2,1);
    
    switch j
        case 1
            m = m + 1;
        case 2
            p = p + 1;
        case 3
            m = m - 1;
        case 4
            p = p - 1;
    end
    
    
    t = t + tau;
    i = i + 1;
    
    T(1,i) = t;
    M(1,i) = m;
    P(1,i) = p;
    
    
end



T_fin = T;
M_fin = M;
P_fin = P;

disp('mean M');
disp(mean(M));
disp('var M');
disp(std(M)^2);
disp('mean P');
disp(mean(P));
disp('var P');
disp(std(P)^2);



