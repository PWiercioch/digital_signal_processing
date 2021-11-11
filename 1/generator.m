classdef generator < handle
    
    properties (Access = private)
        start_t
        stop_t
        total_t
        value
        x
        y
        steps
    end
    
    methods
        function obj = generator(start_t, stop_t, total_t, steps)
            obj.start_t = start_t;
            obj.stop_t = stop_t;
            obj.total_t = total_t;
            obj.value = 1;
            
            obj.steps = steps - 2
            obj.x = 0:obj.total_t/obj.steps:obj.total_t
            obj.y = zeros(obj.steps+1,1)'
        end
        
        function square(obj)
            n=1;
            while n < length(obj.x)
                if (obj.x(n) >= obj.start_t && obj.y(n-1) == 0 && obj.x(n) < obj.stop_t)
                    obj.x(n) = obj.start_t;
                    obj.y(n) = 0;
                    obj.x = [obj.x(1:n), obj.start_t, obj.x(n+1:end)];
                    obj.y = [obj.y(1:n), obj.value, obj.y(n+1:end)];
                    n = n+1;
                elseif (obj.x(n) >= obj.stop_t && obj.y(n-1) == 1)
                    obj.x(n) = obj.stop_t;
                    obj.y(n) = obj.value;
                    obj.x = [obj.x(1:n), obj.stop_t, obj.x(n+1:end)];
                    obj.y = [obj.y(1:n), 0, obj.y(n+1:end)];
                    n = n+1;
                elseif obj.x(n) > obj.start_t && obj.x(n) < obj.stop_t
                    obj.y(n) = obj.value;
                end
                obj.x
                obj.y
                n = n+1;
            end
        end
        
        function show_plot(obj)
            figure()
            plot(obj.x, obj.y)
        end
        
    end
end