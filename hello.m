% Concatenates two strings and prints "Hello world!"
% hello.m
% Written by Kaysen Pajarillo [10/23/2023]
%
%------------------------------------

% Store the string 'Hello ' in a variable called str1
str1 = 'Hello ';
% Store the string 'world! ' in a variable called str2
str2 = 'world! ';

% Concatenate str1 and str2 into a new variable called phrase
phrase = [str1 str2];

% Use "fprintf" to print phrase to the MATLAB command window
fprintf('%s\n', phrase);