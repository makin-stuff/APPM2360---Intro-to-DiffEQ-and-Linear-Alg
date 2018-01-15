%Compress function - inputs compression value and matrix to be compressed
function [matrix] = compress(matrix, p_value)
    p = p_value;
    n = size(matrix,1);
    for i = 1:n
        for j = 1:n
            if i+j > p*2*n
                matrix(i,j) = 0;
            end
        end
    end
end

