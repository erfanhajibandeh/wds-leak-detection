%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     Multi-Objective Genetic Algorithm       %
%          Leakage Detection Model            %
%        Developed by Erfan Hajibandeh        %
%               November 2016                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   For more details on the algorithm and its implementation, refer to the
%   corresponding research paper by Erfan Hajibandeh (February 2018).
%
%   https://link.springer.com/article/10.1007/s11269-018-1929-1#:~:text=In%20this%20method%2C%20the%20WDS,leakage%20values%20in%20MOACO%20algorithm.
%
%   Contact: erfanhajibandeh@gmail.com
%
%   This code implements a multi-objective genetic algorithm for leakage detection in water distribution systems. It aims to optimize the location and magnitude of leaks in the network.
%   The algorithm uses a non-dominated sorting approach to maintain a set of Pareto-optimal solutions that represent the trade-off between multiple objectives.
%   The fitness function evaluates the fitness of each solution based on the leakage detection performance and other criteria.
%   The algorithm performs crossover and mutation operations to generate new solutions, and the Pareto dominance and crowding distance are used for selection and sorting.
%   The code visualizes the Pareto front and displays the number of solutions in each Pareto front for each iteration.
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