---
sidebar_position: 1
---

# Commuting Zones Overview

---

Our commuting zones are rebuilt every three months using aggregated estimates of home and work locations. Only users who opt-in to sharing their location data with Facebook are included. For each continent, we build a graph that connects population centers within the continent and cluster these locations.

**[Facebook Location Services](https://www.facebook.com/help/278928889350358)**

![World Map](/img/cz_methodology_1.png)

In these graphs, population centers represent the nodes. The edges (connections) between these nodes have a weight. We construct this weight using weekday home and work locations over the previous few weeks using the following formula:

![Formula](/img/cz_methodology_2.png)

![Transit](/img/cz_methodology_3.png)

With this formula, the weights that connect nodes always range from 0 to 1. When we construct this graph, there can be connections between very distant places on opposite ends of a continent. Since our current algorithm does not formally take distance into account, including very distant locations adds noise to our graph. To mitigate this noise, we remove connections that are in the 95th percentile or above in the distribution of distances.

To build commuting zones:

1. We extract community structure from the graphs constructed above using the Louvain algorithm.
2. We impose a hierarchical structure by taking the resulting clusters and partitioning them once more with the Louvain algorithm. For each location, we build Voronoi shapes around their centroids.
3. We then create overall shapes on a map by merging all spatial areas associated with the same commuting zone.

This is an active area of research and we are still developing and improving on our methodology to generate these zones.

**[Louvain Algorithm](https://iopscience.iop.org/article/10.1088/1742-5468/2008/10/P10008?fbclid=IwAR0IdjoRwAwGBFFgfwl8lVUAPyafgrBfF95-zS0i2myuBHmOospCYepFKLA)**

**[Voronoi Shapes](https://en.wikipedia.org/wiki/Voronoi_diagram?fbclid=IwAR2cH2nC5zM0na7VcpXIUpZnykI8KLLLY2O19IdVaVIQdeqe5JT9F-Okcds)**

![Commuting Zones in North America](/img/cz_methodology_4.png)

This map illustrates commuting zones for the United States.
