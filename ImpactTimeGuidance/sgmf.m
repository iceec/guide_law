function y = sgmf(S)

global seta;

if(abs(S) <= seta)
    y = S/seta;
else
    y = sign(S);
end

end