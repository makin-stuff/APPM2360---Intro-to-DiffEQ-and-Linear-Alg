%Priyanka Makin, 09/25/2016, APPM2360 - DiffEQ
%A simple script describing the position of an astronaut floating through
%space using direction fields and Euler approximations with different
%initial positions and step sizes.
%--------------------------------------------------------------------------

%dirfield_test
f = @(t,x) ((1/x)-1)*x^(-1/2);
%dirfield(f, 0:.2:5, 1:.2:2, 'Direction Field for the Astronaut') %This calls the given dirfield file

%euler_test
x0 = 2;
tspan = [0,9];
h1 = 3;
h2 = 1;
h3 = 0.1;
h4 = 0.01;
[t_soln,x_soln] = euler(f,tspan,x0,h1);
[t_soln_2,x_soln_2] = euler(f,tspan,x0,h2);
[t_soln_3,x_soln_3] = euler(f,tspan,x0,h3);
[t_soln_4,x_soln_4] = euler(f,tspan,x0,h4);
%x_actual = exp(t_soln.^2 / 2);
plot(t_soln,x_soln,t_soln_2,x_soln_2,t_soln_3,x_soln_3,t_soln_4,x_soln_4)
%plot(t_soln_2,x_soln_2)
xlabel('t (s)','FontSize',16)
ylabel('position (Shwarzschild Radii)','FontSize',16)
title('Euler Solutions','FontSize',22)
legend('Step Size = 3','Step Size = 1', 'Step Size = 0.1', 'Step Size = 0.01')

tspan = [0, 20];
x0_1 = 3;
x0_2 = 2;
x0_3 = 1.5;
x0_4 = 1;
[t_soln,x_soln] = euler(f,tspan,x0_1,h4);
[t_soln_2,x_soln_2] = euler(f,tspan,x0_2,h4);
[t_soln_3,x_soln_3] = euler(f,tspan,x0_3,h4);
[t_soln_4,x_soln_4] = euler(f,tspan,x0_4,h4);
plot(t_soln,x_soln,t_soln_2,x_soln_2,t_soln_3,x_soln_3,t_soln_4,x_soln_4)
xlabel('t (s)','FontSize',16)
ylabel('position (Shwarzschild Radii)','FontSize',16)
title('Euler Solutions','FontSize',22)
legend('Initial Condition = 3','Initial Condition = 2', 'Initial Condition = 1.5', 'Initial Condition = 1')

