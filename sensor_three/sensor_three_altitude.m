
[x_altitude y_altitude]=meshgrid(0:step:M);
z_altitude=0.2.*sin(sqrt(x_altitude.^2+y_altitude.^2));
meshz(x_altitude,y_altitude,z_altitude)
title('meshz(x,y,z)')
axis([0 M 0 M 0 M])
