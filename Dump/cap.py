import numpy as np
import matplotlib.pyplot as plt

C = 1e-6
R = 100


dt = 1e-6

#times = np.linspace(0,6*R*C,int((6*R*C)/dt))
times = np.linspace(0,10,10000)
Vp = 12
V = Vp*np.sin(times)


v = [0]
i = [Vp/R]

for t in range(times.shape[0]):
    v.append((i[-1]*dt)/C+v[-1])
    i.append((V[t]-v[-1])/R)

#plt.plot(times,v[:-1])
plt.plot(times[1:],i[1:-1],times[1:],np.sin(times[:-1]))
plt.grid()
plt.show()
