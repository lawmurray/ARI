file = 'data/input.nc';

f = 10;
dP = 100*ones(100,1);
V_bar = 100;
times = [0:99]';

nccreate(file, 'f');
nccreate(file, 'dP', 'Dimensions', {'nr', length(dP) });
nccreate(file, 'time', 'Dimensions', {'nr', length(times) });
nccreate(file, 'V_bar');

ncwrite(file, 'f', f);
ncwrite(file, 'dP', dP);
ncwrite(file, 'time', times);
ncwrite(file, 'V_bar', V_bar);
