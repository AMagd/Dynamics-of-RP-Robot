% Author ~ Ahmed Magd Aly
% Innopolis University

function O = FK(phi, s_length, enable_plot, enable_proj)
% Forward Kinematics Function:

l = 0.2;

as = l/4; % axes scaler

% phi = deg2rad(phi);

%% Origin Frame
O0 = eye(4);
O1 = Rz(phi);
O2 = O1*Tx(s_length+2*l);

O = round([O0, O1, O2],10);

% NUMBER OF POINTS %
nPts = size(O,2)/4;

global axes_plot links_plot joints_plot end_effector_plot plane_plot

if enable_plot
    % figure('units','normalized','outerposition',[0 0 1 1])
    
    color = ['r','g','b']; % axes color
    
    index = 0;
    for i = 1:4:length(O)
        index = index + 1;
        points_x(index) = O(1,i+3);
        points_y(index) = O(2,i+3);
        points_z(index) = O(3,i+3);
        
        for axes = 0:2
            axes_plot = [axes_plot plot3([O(1,i+3) as*O(1,i+axes)+O(1,i+3)], [O(2,i+3) as*O(2,i+axes)+O(2,i+3)], [O(3,i+3) as*O(3,i+axes)+O(3,i+3)],'Color',color(axes+1))];
            hold on
        end
    end
    joints_x = points_x;
    joints_y = points_y;
    joints_z = points_z;
    
    
    
    links_plot = [links_plot plot3(points_x, points_y, points_z,'Color', "0 0 0",'linewidth',2)];
    hold on
    joints_plot = [joints_plot plot3(joints_x(1:nPts-1), joints_y(1:nPts-1), joints_z(1:nPts-1),'.','Color','0.992 0.788 0.04 1','MarkerSize',20)];
    hold on
    end_effector_plot = [end_effector_plot plot3(joints_x(nPts), joints_y(nPts), joints_z(nPts),'.','Color','0.8 0 0 1','MarkerSize',20)];
    path_plot = plot3(joints_x(nPts), joints_y(nPts), joints_z(nPts),'.','Color','0.8 0 0 1','MarkerSize',7.5);
    
%     if s_length == 0
%         xlim([-2*l 2*l])
%         ylim([-2*l 2*l])
%         zlim([-2*l 2*l])
%     else
%         xlim([-abs(s_length) abs(s_length)])
%         ylim([-abs(s_length) abs(s_length)])
%         zlim([-abs(s_length) abs(s_length)])
%     end
    view(0,90)
    grid on
    xlabel("x-axis")
    ylabel("y-axis")
    zlabel("z-axis")
    
    [x_plane, y_plane] = meshgrid( [0, O(1,size(O,2))], [0, O(2,size(O,2))]);
    z_plane = x_plane*0;
    if enable_proj, plane_plot = surf(x_plane, y_plane, z_plane,'FaceAlpha', .3); end
    colormap([0.1 0.1 0.1])
end
 O = O';

