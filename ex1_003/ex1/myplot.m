function[] = myplot(v)
index = zeros(length(v), 1);
for i = 1: length(v),
    index(i) = i;
end;
figure;
plot(index, v);
pause;
end;

