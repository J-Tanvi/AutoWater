% Name: Tanvi Jain
% Student #: 220287975
% Date: 3/12/24
% Course: EECS 1011

% The purpose of this function is to collect data from the sensor and
% determine how much water is required to be pumped to the plant. 

% Calibration data: 
% Not immersed in water:    2.9814 v
% Immersed in dry soil:     2.9763 v
% Immersed in water-saturated soil:    2.8983 v
% Immersed in water:    2.6149 v

function state = howMuchWater(a)
    % write your code here!
    clf
    a = arduino("COM6", "Nano3");
    graph = line(nan, nan, 'color', 'blue');
    title("Moisture Levels in the Soil as Time Passes");
    xlabel("Time (s)");
    ylabel("Moisture Levels (V)");

    for i = 0:30
        voltage = readVoltage(a, 'A0'); %recieve a voltage from the sensor
    
        disp(voltage);
        %return the state of the soil based on the value from the sensor
        if voltage > 3.08 %above 3.08
            state = 'This air is of the dry variety...No watering needed.';
            %do not pump since this means the sensor isn't connected to the
            %plant/in the soil
        elseif voltage < 3.08 && voltage > 2.9 %between 3.08 and 2.9
            state = 'Soil needs moisture! Must add H2O!!';
            pumpWater(a, 0.05); %if the soil is dry, add ~100ml of water
        elseif voltage < 2.9 && voltage > 2.7 %between 2.7 and 2.9
            state = 'Slighty moist, needs more to be optimal...dispensing...';
            pumpWater(a, 0.01); %if the soil is damp, add ~50ml of water
        elseif voltage < 2.7 %under 2.7
            state = 'Hydration is good! It is too much for the soil, doing nothing.';
            %do not pump since this means the sensor isn't connected to the
            %plant/in the soil and instead in water
        end
        disp(state);
        pause(0.5);
        x = get(graph, 'xData');
        y = get(graph, 'yData');

        x = [x i];
        y = [y voltage];
        set(graph, 'xData', x, 'yData', y);
        pause(1);
    end
end