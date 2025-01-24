function tgo=esttgo(dr)

global r; global vm;
if(dr<0)
    tgo = -r/dr;
else
    tgo = 2*r/vm;
end
end