function TickLogLocator(axh,spacing)
% This function formats a log scale axis
% It regenerates the major ticks according to the selected spacing
% Parameters
% ----------
% axh : obj
%   A handle to the axis object
% spacing : int
%   The number of decades between ticks

    % Enforce that he spacing is positive
    spacing     = abs(spacing);
    % Get the limits of the axis
    axlim       = axh.Limits;
    % Split the limits in to min and max
    axmin       = axlim(1);
    axmax       = axlim(2);
    % Split the each limit ac
    axmin_sci   = str2double(split(sprintf('%.0e',axmin),'e'));
    axmax_sci   = str2double(split(sprintf('%.0e',axmax),'e'));
    % Get the prefactor and exponent for the minimum value
    axmin_p     = axmin_sci(1);
    axmin_e     = axmin_sci(2);
    % Get the prefactor and exponent for the maximum value
    axmax_e     = axmax_sci(2);
    
    % If the lower limit is not an exact power of 10, then round the first
    % tick to the next power of 10
    if axmin_p > 1.0
        min_tick = axmin_e + 1;
    else
        min_tick = axmin_e;
    end
    
    max_tick    = axmax_e;
    
    % Generate the axis ticks
    log_ticks = min_tick:spacing:max_tick;
    new_ticks = 10.^(log_ticks);
    
    % Set the ticks
    axh.TickValues = new_ticks;
end