import numpy as np
import matplotlib.pyplot as plt

np.random.seed(42)
x = np.random.randn(100)

# compute a histogram by hand
bins = np.linspace(-5, 5, 20)
counts = np.zeros_like(bins)

# find the appropriate bin for each x
i = np.searchsorted(bins, x)

# add 1 to each of these bins
np.add.at(counts, i, 1)

# plot the results
plt.plot(bins, counts)
# create a nearly identical plot to the one seen here.
plt.hist(x, bins, histtype='step')
plt.show()
