# Aircraft-Landing-Gear-Simulation-and-Control
Final Project for the course in Vehicle Systems Dynamics A.Y. 2020/2021.

## Project Description
The focus of this work is the development of a Multi-degree of freedom model for simulation and
control of the landing performances of an airplane. From dynamic considerations, the landing
gear performance has two areas of interest: the behaviour during touchdown impact, and the response to excitation induced by track roughness during taxi, take-off and landing runs. The high
level of transients induced during touchdown have to be controlled smoothly in order to achieve
the steady state in a reasonable amount of time.
A 4-dof model is derived considering the dynamics of the wheels of the airplane and the landing
gears. The latter is then augmented with three additional degrees of freedom in order to consider
also the horizontal coordinate and the wheels angular velocity. Analyses with and without the
runway profile are carried out to study the effects of the input signals on the derived model.
The controlled variable are the elevators, the flaps and the active suspension of the front landing gear, and due to the high nonlinearity of the system, in place of using a linear controller derived from the linearized system, the Variational Feedback Controller is implemented on the latter.
Moreover, the two additional inputs are relative to the brakes of the rear and the front wheels

## Documentation
A detailed report of the project <br/>
The presentation we gave

## Resources used
[Simulink](https://www.mathworks.com/products/simulink.html)

## Authors
A. Mauro <br/>
E. Nicotra <br/>
M. Azeez
