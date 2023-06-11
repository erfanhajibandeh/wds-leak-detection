# Multi-Objective Optimization using Genetic Algorithm and Ant Colony Models

## Summary and Publication

- [Pressure Zoning Approach for Leak Detection in Water Distribution Systems Based on a Multi Objective Ant Colony Optimization](https://link.springer.com/article/10.1007/s11269-018-1929-1) - Hajibandeh et al., Journal of Water Resources Management, 2018

This repository contains an implementation of a Multi-Objective Optimization algorithm using a combination of Genetic Algorithm (GA) and Ant Colony Optimization (ACO). The algorithm aims to find the optimal solutions to a multi-objective problem by efficiently exploring the solution space and identifying a set of non-dominated solutions, known as the Pareto front.The leakage detection model presented in this study was developed using MATLAB.

Leakages in water pipe networks result in significant water loss, making their detection a crucial issue. Detecting the amount of leakage and its approximate location is important for efficient maintenance and conservation of water resources. In this study, we propose a new model for leakage amount and location detection and apply it to two benchmark water distribution networks. Our approach involves dividing the water distribution networks into three pressure zones, considering the variations in leakage patterns at different operating pressures. To calibrate the model, we utilize a novel multi-objective ant colony-based optimization algorithm that adjusts the nodal pressures and demands. Leaks are simulated as additional nodal demands in the optimization process.To identify the nodes where leakage occurs, we employ a probability-based scheme that takes into account the pressure zone of each node. The probability of leakage occurrence varies depending on the specific pressure zone. The results demonstrate the effectiveness of our proposed model in detecting leakages in water distribution systems. By accurately identifying the leakage amount and approximate location, this model can contribute to more efficient maintenance and management of water networks.

Please note that this model should be used as a tool for guidance and decision-making, and the actual implementation and interpretation of the results are the responsibility of the user.

## Features

- **GA**: The Genetic Algorithm component employs evolutionary operators like crossover and mutation to evolve a population of candidate solutions.
- **ACO**: The Ant Colony Optimization component utilizes the pheromone-based communication of artificial ants to guide the search towards promising regions of the solution space.
- **Multi-Objective Optimization**: The algorithm is designed to handle problems with multiple conflicting objectives, allowing for the identification of a set of Pareto-optimal solutions.
- **Fitness Evaluation**: The fitness function evaluates the quality of a candidate solution based on the specified objectives and constraints.
- **Crowding Distance**: The crowding distance is used to maintain diversity within the Pareto front by measuring the density of solutions.
- **Non-Dominated Sorting**: Non-dominated sorting is applied to assign ranks to the individuals based on their dominance relationships.
- **Visualization**: The algorithm provides visualizations of the Pareto front to aid in understanding the trade-offs between different objectives.

## Usage

1. Install the necessary dependencies and libraries.
2. Set up the problem-specific parameters, such as the number of objectives, population size, and iteration limits.
3. Define the fitness function and other problem-specific functions.
4. Run the algorithm to obtain the Pareto front and the corresponding solutions.

Feel free to explore and modify the provided implementation to suit your specific problem requirements.

## Requirements

- MATLAB with the Optimization Toolbox (for GA and fitness evaluations)
- MATLAB with the Statistics and Machine Learning Toolbox (for ACO)
- Epanet Toolkit (for hydraulic simulations)

## MATLAB Toolkit License

The EPANET-Matlab Toolkit is an interface between Matlab and EPANET/EPANET-MSX, providing functionality for modeling water distribution piping systems. EPANET is software developed by the US EPA under a public domain license, while EPANET-MSX is licensed under GNU LGPL.

EPANET and EPANET-MSX were developed by the Water Supply and Water Resources Division of the U.S. Environmental Protection Agency's National Risk Management Research Laboratory.

The EPANET-Matlab Toolkit utilizes the unofficial channel hosted on GitHub, which provides the most updated libepanet files of the software. You can access the repository at [https://github.com/OpenWaterAnalytics/epanet](https://github.com/OpenWaterAnalytics/epanet).

Some parts of the EPANET-Matlab Toolkit are based on the epanet-matlab wrappers prepared by Jim Uber, available at [https://github.com/OpenWaterAnalytics/epanet-matlab](https://github.com/OpenWaterAnalytics/epanet-matlab).

The EPANET-Matlab Toolkit is licensed under the EUPL, libepanet 1.1 or subsequent libepanets of the EUPL. You may not use this work except in compliance with the License.

To view the complete license, please visit the following link: [EUPL License](http://ec.europa.eu/idabc/eupl)

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

## Disclaimer

The EPANET-Matlab Toolkit is provided "AS IS" without any warranty. Use it at your own risk. The developers and contributors of this toolkit are not responsible for any damages or liabilities arising from the use of this software.

This code is provided as-is without any warranty. The authors and contributors of this code are not responsible for any damages or liabilities that may arise from using this code. Use it at your own risk.


