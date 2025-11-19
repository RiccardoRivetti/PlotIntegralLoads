function out = appendAverage(C,alpha)

nAlpha = length(alpha);

out = [C,zeros(nAlpha,1)];

for i = 1:nAlpha
    out(i,end) = mean(C(i,:));
end

end