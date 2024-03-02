function y = ObjFunc(X,PlotMode)

y = exp(X(1)) + exp(X(2)) + 2*X(1)^2 + 2 * X(1) * X(2) + X(2)^2;

if(PlotMode==1)
plot(X(1),X(2),'ro')
end

