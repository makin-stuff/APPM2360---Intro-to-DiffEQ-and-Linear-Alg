%6 - works now!
function [dct] = mydct(n)
    dct = zeros(n);
    for i = 1:n
        for j = 1:n
            if i == 1
                dct(i,j) = sqrt(1/n);
            else
                dct(i,j) = sqrt(2/n)*cos((pi*(2*j-1)*(i-1))/(2*n));
        end
    end
end

