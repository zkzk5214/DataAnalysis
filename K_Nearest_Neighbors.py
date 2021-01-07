import numpy as np
import matplotlib.pyplot as plt

rand = np.random.RandomState(42)
X = rand.rand(10, 2)
# plt.scatter(X[:, 0], X[:, 1], s=100)

# for each pair of points, compute differences in their coordinates(broadcasting rules)
dist_sq = np.sum((X[:, np.newaxis, :] - X[np.newaxis, :, :]) ** 2, axis=-1)
# (10, 10)
dist_sq.diagonal()
# array([ 0., 0., 0., 0., 0., 0., 0., 0., 0., 0.])

nearest = np.argsort(dist_sq, axis=1)
# [[0 3 9 7 1 4 2 5 6 8]
# [1 4 7 9 3 6 8 5 0 2]
# [2 1 4 6 3 0 8 9 7 5]
# [3 9 7 0 1 4 5 8 6 2]
# [4 1 8 5 6 7 9 3 0 2]
# [5 8 6 4 1 7 9 3 2 0]
# [6 8 5 4 1 7 9 3 2 0]
# [7 9 3 1 4 0 5 8 6 2]
# [8 5 6 4 1 7 9 3 2 0]
# [9 7 3 0 1 4 5 8 6 2]]

# partition each row so that the smallest k + 1 squared distances come first,
# with larger distances filling the remaining positions of the array
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
