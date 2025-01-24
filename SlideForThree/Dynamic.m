function dif = Dynamic(r,theta,yita,theta_m,yita_m,theta_t,yita_t)
    global vt; global vm; global theta_d; global yita_d; global Lamda; global Seta;

    
    v= vt/vm;
    g= 9.81;
    Amax = 10 * g;

    %系数
    k1 = 0.75;
    k2 = 0.75;
    p1 = 17;
    p2 = 15;
    alpf = p1/p2;
    M1 = 0.1;
    M2 = 0.1;
    % seta = t1/t2
    t1 = 1;
    t2 = 2;

    % 目标加速度
    Aty = 0;
    Atz = 0;

    %先求theta_tf 和 yita_tf  
    theta_tf = atan(sin(theta_d)/(v - cos(yita_d)*cos(theta_d)));
    part1 = sin(theta_d)^2 + (v - cos(yita_d)*cos(theta_d))^2;
    yita_tf = atan(cos(theta_d)*sin(yita_d)/sqrt(part1));


    % 撞击角度的定义 导弹的速度向量在目标的坐标系中的夹角和theta_d和yita_d一样
    [impact_theta,impact_yita] = Trans(theta_m,yita_m,theta_t,yita_t);

    disp(impact_theta * 180/ pi);
    disp(impact_yita * 180 / pi);

   


    %求theta_f和yita_f 需要lamda 和 seta 
    % 先求得vt在惯性坐标系下得坐标 vt -> LOS -> 惯性 
    %vt_ground = TransToGround(vt,theta,yita,theta_t,yita_t);
    %求得碰撞时刻在惯性坐标系得

    theta_f = -atan(tan(theta_tf)/cos(yita_tf));
    x0 = cos(theta_tf)*sin(yita_tf)/(cos(theta_f)*cos(theta_tf)*cos(yita_tf) - sin(theta_tf)*sin(theta_f));
    x1 = atan(x0);
    yita_f = Seta - x1;

   

    %求得dtheta_f dyita_f的
    dtheta_f = 0; dyita_f = 0;
    ddtheta_f = 0; ddyita_f = 0;

    %模型
    dr = vt*cos(theta_t)*cos(yita_t) - vm*cos(theta_m)*cos(yita_m);
    dtheta = (vt*sin(theta_t) - vm*sin(theta_m))/r;
    dyita = (vt*cos(theta_t)*sin(yita_t) - vm*cos(theta_m)*sin(yita_m))/(r*cos(theta));



    %求e
    etheta = theta - theta_f;
    detheta = dtheta - dtheta_f;
    eyita  = yita - yita_f;
    deyita = dyita - dyita_f;
    % 求滑模面
    s1 = etheta + k1 * Root(detheta,p1,p2);
    s2 = eyita + k2 * Root(deyita,p1,p2);

     %求Amzeq
    Amzeq = r*Root(detheta,2*p2-p1,p2) / (alpf * k1 * cos(theta_m))- r/cos(theta_m)* ...
          (2*dr*dtheta/r + dyita^2*sin(theta)*cos(theta) - cos(theta_t)/r *Atz + ddtheta_f);

    Amz = Amzeq + (r/cos(theta_m))*M1 * Root(abs(s1),t1,t2) *sign(s1);

   

    Amy = r*cos(theta)*Root(deyita,2*p2-p1,p2) / (alpf * k2* cos(yita_m) ) + r*cos(theta)/cos(yita_m) *...
        (-2 * dr * dyita/r + 2 * dyita * dtheta *tan(theta) + sin(theta_m) * sin(yita_m) / (r * cos(theta)) *Amzeq - ddyita_f) + ...
        r*cos(theta)/cos(yita_m)*(-sin(theta_t)*sin(yita_t)/(r*cos(theta)) *Atz + cos(yita_t)/(r*cos(theta))*Aty) + ...
        (r*cos(theta)/cos(yita_m))*M2 *Root(abs(s2),t1,t2)*sign(s2) + r*M1*tan(theta_m)*tan(yita_m)*Root(abs(s1),t1,t2)*sign(s1);

    % Amz Atz Amy Aty

    %求Am
    if(abs(Amz) > Amax)
        Amz = Amax * sign(Amz);
    end

    if(abs(Amy) > 10 *g)
        Amy = Amax * sign(Amy);
    end


    dtheta_m = Amz/vm - dyita*sin(theta)*sin(yita_m) - dtheta*cos(yita_m);
    dtheta_t = Atz/vt -dyita*sin(theta)*sin(yita_t) - dtheta*cos(yita_t); %  

    dyita_m = Amy/(vm*cos(theta_m)) + dyita*tan(theta_m)*cos(yita_m)*sin(theta) - dyita*cos(theta) - dtheta*tan(theta_m)*sin(yita_m);
    dyita_t = Aty/(vt*cos(theta_t)) + dyita*tan(theta_t)*cos(yita_t)*sin(theta) - dyita*cos(theta) - dtheta*tan(theta_t)*sin(yita_t); 

    dif = [dr,dtheta,dyita,dtheta_m,dyita_m,dtheta_t,dyita_t,Amz,Amy];

end
