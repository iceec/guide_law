function InitZInfo(r,dr,dq_theta,dq_yita,q_theta,i)
global zr_info;
global ztheta_info;
global zyita_info;

zr_info(i,1) = dr;

ztheta_info(i,1) = r * dq_theta;

zyita_info(i,1) = -r*cos(q_theta) *dq_yita;

end