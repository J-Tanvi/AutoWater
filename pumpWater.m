% Name: Tanvi Jain
% Student #: 220287975
% Date: 3/12/24
% Course: EECS 1011

% The purpose of this function is to turn on and off the function given the
% amount of water needed to be pumped. 
% This amount is given in a number of litres which is converted to seconds
% based on how long it takes for one litre of water to be pumped. 

% Calibration data: 
% Time to for water to begin flowing:    1 sec
% Time to empty 1 litre of water:     35.1 sec

function pumpWater(a, litres)
    % write your code here!
    %turn on the pump
    writeDigitalPin(a, "D2", 1);
    pause(1); %wait for it to turn on
    pause(litres * 35.1); %pump water
    writeDigitalPin(a, "D2", 0); %turn of the pump 
end