a = 2;
t = 4;
g_val=9/1024;
format long
[b,ex] = float2bin(g_val,t);
distance_right_neighbor = a^(ex-t)
distance_left_neighbor = a^(ex - t)
right_neighbor = g_val + distance_right_neighbor
left_neighbor = g_val - distance_left_neighbor
