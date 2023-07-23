function I = compound_rules_plot(f,a,b,m,type)
    figure
    fplot(f,[a,b])
    hold on
    %Split the [a, b] interval to m subintervals:
    x_points = linspace(a,b,m+1) % m subintervals require m+1 points!
    h = (b-a)/m; % length of subintervals
    
    
    
    % apply the chosen simple rule for every subinteval
    I = 0; % initialization
    switch type
        case 'midpoint' % 1 basepoint between a and b 
            % I = (b-a)*f((a+b)/2)
            for x0 = x_points(1:end-1) 
                baspoint_1 = x0 + h/2; 
                I =  I + f(baspoint_1);
                plot(baspoint_1,f(baspoint_1),'*')
            end
            I = h*I;
 
        case 'trapesoidal' % 2 basepoints: a and b
            %I = (b-a)*(f(a)-f(b))/2
            for x0 = x_points(1:end-1) 
                baspoint_1 = x0;
                basepoint_2 = x0+h;
                I =  I + (f(baspoint_1)-f(basepoint_2))/2;
                plot([baspoint_1,basepoint_2],[f(baspoint_1),f(basepoint_2)],'*')
            end
            I = h*I;
        case 'simpson' % 3 basepoints: a, b, and the midpoint
            %I = (b-a)/6*(f(a)+4*f((a+b)/2)+f(b));
            for x0 = x_points(1:end-1) 
                baspoint_1 = x0;
                basepoint_2 = x0 + h/2;
                basepoint_3 = x0+h;
                I =  I + (f(baspoint_1)+4*f(basepoint_2)/2+f(basepoint_3));
                plot([baspoint_1,basepoint_2,basepoint_3],[f(baspoint_1),f(basepoint_2),f(basepoint_3)],'*')
            end
            I = h/6*I;
    end

end