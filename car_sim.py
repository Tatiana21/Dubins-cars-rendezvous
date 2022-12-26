import matplotlib.pyplot as plt
import matplotlib.animation as animation
import time
import math
import numpy as np

fig = plt.figure()
ax1 = fig.add_subplot(1,1,1)
pi = 3.1415
um = 0.2
delta_t = 0.01
def calc_u(theta_t, x_t, y_t, delta_t, um):
	if abs(abs(theta_t - math.atan(y_t/x_t)) - pi)< um*delta_t: # think of third and fourth quadrant
		u_t = 0
	else:
		if theta_t - math.atan(y_t/x_t)< 0:
			u_t = -1*um
		else:
			u_t = um
	return u_t

if __name__ == '__main__':
	x_t = 10
	y_t = 10
	theta_t = 30*pi/180
	t = 0
	v = 1
	u_t = 0

	x_log = np.array([])
	y_log = np.array([])
	
	while math.sqrt(x_t*x_t + y_t*y_t)> v*delta_t:
		u_t = calc_u(theta_t, x_t, y_t, delta_t, um)
		
		theta_t = u_t*delta_t + theta_t
		
		x_t_plus_delta_t = x_t + v*math.cos(theta_t)*delta_t
		y_t_plus_delta_t = y_t + v*math.sin(theta_t)*delta_t
		
		t = t + delta_t
		#plot(x_t,y_t,'.');hold on
		x_t = x_t_plus_delta_t
		y_t = y_t_plus_delta_t
		
		x_log = np.append(x_log, [x_t])
		y_log = np.append(y_log, [y_t])
		
		
		if t>40:
			break
	plt.scatter(x_log, y_log)
	plt.show()