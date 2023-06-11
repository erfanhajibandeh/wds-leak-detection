%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Multi-Objective Ant Colony Optimization   %
%          Leakage Detection Model            %
%        Developed by Erfan Hajibandeh        %
%               November 2016                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   For more details on the algorithm and its implementation, refer to the
%   corresponding research paper by Erfan Hajibandeh (February 2018).
%
%   https://link.springer.com/article/10.1007/s11269-018-1929-1#:~:text=In%20this%20method%2C%20the%20WDS,leakage%20values%20in%20MOACO%20algorithm.
%
%   Contact: erfanhajibandeh@gmail.com
%
%   This code implements a Multi-Objective Ant Colony Optimization (ACO)
%   model for leakage detection in water distribution systems. It utilizes
%   the EPANET software, which models water distribution piping systems,
%   developed by the US EPA and provided under a public domain license.
%   The ACO algorithm aims to optimize the pressure fitness and demand
%   fitness of the system, considering leakage detection as a multi-objective problem.
%
%   The code utilizes the EPANET-Matlab Class, an interface between Matlab and
%   EPANET/EPANET-MSX, developed by the KIOS Research Center for Intelligent Systems and
%   Networks, University of Cyprus. It provides researchers and industry professionals
%   with tools to solve problems related to water distribution systems.
%
%   EPANET-Matlab Class License:
%
%   Copyright 2013 KIOS Research Center for Intelligent Systems and
%   Networks, University of Cyprus (www.kios.org.cy)
%
%   Licensed under the EUPL, libepanet 1.1 or - as soon they will be
%   approved by the European Commission - subsequent libepanets of the
%   EUPL (the "License"); You may not use this work except in
%   compliance with the License. You may obtain a copy of the License
%   at:
%
%   http://ec.europa.eu/idabc/eupl
%
%   Unless required by applicable law or agreed to in writing, software
%   distributed under the License is distributed on an "AS IS" basis,
%   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
%   implied. See the License for the specific language governing
%   permissions and limitations under the License.
%
%   Note: Please ensure you have the EPANET software and the EPANET-Matlab Class
%   properly installed and configured before running this code.
%
%   The code reads input data from Excel files and performs the multi-objective
%   optimization using the ACO algorithm. The fitness values and results are
%   plotted for analysis and evaluation.
%
%
%   Acknowledgments:
%   - EPANET software: US EPA
%   - EPANET-Matlab Class: KIOS Research Center for Intelligent Systems and Networks, University of Cyprus
%   - Optimization Code: Erfan Hajibandeh
%
%   Disclaimer: This code is provided as-is and without any warranty.
%   Use it at your own risk.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Start of the code
% Clear the command window, workspace, and close all figures
clc
clear all
close all
format long

%% parameters
ncount=8;                   % Number of nodes
n_ant=40;                   % Number of ants
maxiter=1000;               % Maximum number of iterations
tau=ones(8,ncount);         % Pheromone matrix
ethap=xlsread('ethap.xlsx',1);  % Read ethap values from an Excel file
ethad=xlsread('ethad.xlsx',1);  % Read ethad values from an Excel file
etha=(ethap+(0.25*ethad))/2;    % Calculate etha values
alpha=1;                    % Alpha parameter
beta=1;                     % Beta parameter
roh=0.99;                   % Rho parameter
d=epanet('Net1_Rossman2000.inp');   % Load network data from the specified input file

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Preparation
tic;

% Read demand data from an Excel file
allD=xlsread('source.xlsx',1);

% Initialize structures and variables
emp.nodeD=[];
emp.fit=[];
emp.call=[];
demand_1=[];
ant=repmat(emp,n_ant,1);
gant.nodeD=[];
gant.fitp=inf;

% Initialize the best array
best=zeros(maxiter,1);

% Main Loop
for iter=1:maxiter
    % Generate solutions for each ant
    for k=1:n_ant
        demand_1=zeros(1,8);
        % Assign demands to each node
        for y=1:8
            % Calculate selection probability
            P=(tau(:,y).^alpha).*(etha(:,y).^beta);
            % Select a demand value based on the roulette wheel selection
            j=RouletteWheel(P);
            demand_1(y)=allD(j,y);
        end
        % Update ants demand and fitness values
        ant(k).nodeD=demand_1;
        ant(k).fitp=fitnessp(demand_1,d);
        ant(k).fitd=(sum(demand_1)-2.4)/2.4;
    end
    
    % Update the best solution and fitness
    [value,index]=min([ant.fitp]);
    L(iter)=ant(index).fitp;
    [~,andis]=min([ant.fitd]);
    LL(iter)=ant(andis).fitd;
    
    if value<=gant.fitp
        gant=ant(index);
    end
    
    best(iter)=gant.fitp;
    [total,meghdar]=sort([ant.fitp]);
    
    % Update pheromone levels based on the best solutions
    for t=1:1
        w=meghdar(t);
        demand_1=ant(w).nodeD;
        for c=1:8
            for q=1:8
                if demand_1(c)==allD(q,c)
                    tau(q,c)=tau(q,c)+0.001;
                end
            end
        end
    end
    
    % Update pheromone levels using rho
    tau=tau*roh;
    
    % Check termination condition
    if gant.nodeD==[0.3 0.4 0.3 0.3 0.6 0.3 0.3 0.9]
        break;
    end
    
     % Plot the fitness values
    figure(2)
    plot(L(1:iter))
    xlabel('Iteration')
    ylabel('Pressure Fitness')
    title('MOACO')
    
    figure(3)
    plot(LL(1:iter),'r')
    xlabel('Iteration')
    ylabel('Demand Fitness')
    title('MOACO')
    
    % Display iteration and best fitness
    disp(['iter = ' num2str(iter) ' BEST = ' num2str(best(iter))])
end

% Results algorithm
disp('======================================================')
disp(['best solution = ' num2str(gant.nodeD)])
disp(['best fitness = ' num2str(gant.fitp)])
disp(['Time = ' num2str(toc)])

% Plot the best fitness
figure(1)
plot(best(1:iter),'r','LineWidth',2)
xlabel('Iteration')
ylabel('Fitness')
legend('BEST')
title('ACO for Leak Detection')

