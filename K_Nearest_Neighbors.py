import numpy as np
import matplotlib.pyplot as plt

rand = np.random.RandomState(42)
X = rand.rand(10, 2)
# plt.scatter(X[:, 0], X[:, 1], s=100)

# for each pair of points, compute differences in their coordinates
dist_sq = np.sum((X[:, np.newaxis, :] - X[np.newaxis, :, :]) ** 2, axis=-1)
# print(dist_sq.shape)
dist_sq.diagonal()
nearest = np.argsort(dist_sq, axis=1)
K = 2
nearest_partition = np.argpartition(dist_sq, K + 1, axis=1)
plt.scatter(X[:, 0], X[:, 1], s=100)

# draw lines from each point to its two nearest neighbors
for i in range(X.shape[0]):
    for j in nearest_partition[i, :K + 1]:
        # plot a line from X[i] to X[j]
        # use some zip magic to make it happen:
        plt.plot(*zip(X[j], X[i]), color='black')
plt.show()
