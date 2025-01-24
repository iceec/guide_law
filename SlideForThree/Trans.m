function [theta_t,yita_t] =Trans(theta_1,yita_1,theta_2,yita_2)

% eg theta_1 yita_1 表示 向量在坐标系1的坐标
% theta_2 yita_2为坐标系2和坐标系1的旋转角 滚转和偏航
% theta_t 和 yita_t 表示向量在坐标系2的角度

vector_in_1 = [cos(theta_1)*cos(yita_1) ; cos(theta_1)*sin(yita_1) ; sin(theta_1)];

vector_in_2 = RoateY(theta_2)*RoateZ(yita_2)*vector_in_1;

% vector_in_2 也 = [cos(theta_t)*cos(yita_t) ; cos(theta_t)*sin(yita_t) ; sin(theta_t)]

theta_t = asin(vector_in_2(3));

yita_t = atan2(vector_in_2(2),vector_in_2(1));


end