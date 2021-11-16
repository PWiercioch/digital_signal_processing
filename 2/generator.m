classdef generator < handle
    
    properties (Access = public)
        t
        y
        f1
        f2
        A
        B
    end
    
    methods
        function obj = generator(t, f1, f2, A, B)
            obj.t = t
            obj.y = zeros(length(obj.t), 1)
            
            obj.f1 = f1
            obj.f2 = f2
            
            obj.A = A
            obj.B = B
        end
        
        function square_impulse(obj, t) 
            for n = 1:1:length(t)
               if abs(t(n)) == 0.5
                   obj.y(n) = 0.5
               elseif abs(t(n)) < 0.5
                   obj.y(n) = 1
               else abs(t(n)) > 0.5
                   obj.y(n) = 0
               end
            end
        end
        
        function triangle_impulse(obj)
           for n = 1:1:length(obj.t)
              if abs(obj.t(n)) <= 1
                  obj.y(n) = 1-abs(obj.t(n))
              else
                  obj.y(n) = 0
              end
           end
        end
        
        function cosinusoidal_impulse(obj, sq)
           for n = 1:1:length(obj.t)
               obj.y(n) = obj.A * cos(2*pi*obj.f1*obj.t(n)) * sq(n)
           end
        end
        
        function show_plot(obj, tytul)
            figure()
            plot(obj.t, obj.y)
            grid on
            title(tytul)
            xlabel("Czas [s]")
            ylabel("Amplituda")
            
        end
        
    end
end