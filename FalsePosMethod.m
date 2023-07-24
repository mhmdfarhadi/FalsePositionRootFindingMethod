function [y , ite, acc, matout] = FalsePosMethod (x1 , x2, tol, maxite,custom_function, var)
%{
tol is for tolerance
maxite is for maximum iterations
custum_function is for input function with only one variable 
var is for variable used in input function
outputs:
y is for final answer
ite is for how many iterations it took until it reached tolerance
acc if for accuracy
%}

syms  x 
x = var;
f(x) = custom_function;
x(1) = x1;
x(2) = x2;

for i = (3:1:maxite)
    x(i) = x(i-1) - ( f(x(i-1))*( x(i-1)-x(i-2) )/( f(x(i-1))-f(x(i-2)) ));
        matout(i,:)=[double(x(i-2)),double(x(i-1)),double(f(x(i-2))),double(f(x(i-1)))];
    if ( abs(f(x(i-1))) <=  double(tol) )
        break;
    end
    if f(x(i))*f(x(i-2)) < 0
        x(i) = x(i-1);
    end

end

ite=i-2;
y = double(x(i));
acc= double(abs(x(i)-x(i-1)));
end



