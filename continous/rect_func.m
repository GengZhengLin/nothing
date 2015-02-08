function y=rect_func(t)
global delta T;
h=1/(2*delta);
x=t/T-floor(t/T);
if x < delta || x > T-delta
    y=h;
else
    y=0;
end
end