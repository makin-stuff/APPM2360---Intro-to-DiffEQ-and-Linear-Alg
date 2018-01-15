%dirfield_test.m
% APPM 2360, Fall 2016
%
% This script gives an example of how to use dirfield.m

close all
clear all

% Suppose we want to create a directional field for the differential 
% equation
%
%   y'(t) = ty
%
% Let's figure out how to make this using the function dirfield.m

% First, we must use an anonymous function to define our problem:
odefun = @(t,y) t*y;

% Note that if our differential equation was autonomous (i.e. no t 
% dependence), then we could just define our function as 
%
% odefun = @(t,y) y^2
%
% It's important that we always write @(t,y) even if it's only a function 
% of y.

% Next, we need a vector of t values. Let's use a step of h = .1, so
t_vec = 0:0.1:1;

% We also need a list of y values. Let's use
y_vec = 0:0.5:5;

% Now we can call dirfield
dirfield(odefun,t_vec,y_vec,'Directional Field for dy/dt = ty')

% On the resulting plot, we can "Save As" to get an image we can use in 
% the report.