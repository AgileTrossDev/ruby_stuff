Graphing Alogirthm experiments in Ruby.   


Background
Graph is a group of nodes with edges, or objects and how they are connected.  Sometimes these connections can be directional.  Typical problem is to identify if Nodes on the grap and connected and if so, how? Essentiall the path between two nodes.  Many variables fall into this decision process. Beyond directional limitations of each edge, we may want to find the shortest path or we may need a solution in the quickest method possible.  Added limitations include the cost to take a path or we may be limited in the amount of nodes we can traverse to arrive at the ending node (terminal).


Graph Represenation

Adjacency Matrix -  A matrix representing if a connection exist betwen nodes.   If N nodes exists in a Graph, then the matrix would be NxN. A positive value in a cell of the Matrix represents the existence of an edge connecting Nodes specificed by the X,Y cell location.

Adjacent Lists -  Each node has lists of edges.


NOTE: Trade off for the representations.  Matrx requires always representing the entire dataset, even if there are no edges.  However, Lists require Log(n)/Linear time to traverse each Node list.  This problematic when to large datasets with lots of Datasets.


Traversing Graphs

Depth First Search - Take first path seen, until destination has been found or a dead-end was encountered and then back-up a level and search next available path.  Stacks are used to track the depth because of their "Last-In--First-Out" (LIFO) nature.

Bredth First Search -

