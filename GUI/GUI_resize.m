function GUI_resize( varargin )
%%  GUI_RESIZE Called upon resizing the GUI
%   This function resizes the motor indicators to make sure that the
%   resizing process maintains the GUI's aspect.
    
    actxHandle = getappdata(gcf, 'actxHnd');
    motorLabel = getappdata(gcf, 'motorLabel');
    % The labels scale with the panel, so use them as reference. 
    % Initially labels are [(90*i)-70 MaxWindowY-30 80 15],
    % Controls are [(90*i)-70 MaxWindowY-80 80 40]
    for i = 1: numel(actxHandle)
         set(motorLabel(i), 'Units', 'Pixels');
         labelPos = get(motorLabel(i), 'Position');
         
         ratio= labelPos(4)/15;
         
         controlPos(1)= labelPos(1);
         controlPos(2)= labelPos(2)-50*ratio;
         controlPos(3)= labelPos(3);
         controlPos(4)= 40*ratio;
         
         move(actxHandle(i), controlPos);
         set(motorLabel(i), 'Units', 'Normalized');
     end
end

