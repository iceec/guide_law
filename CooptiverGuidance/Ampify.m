function y=Ampify(a)


a_max = 200;

y = a;

if abs(a) > a_max
    y = a_max *sign(a);
end

end