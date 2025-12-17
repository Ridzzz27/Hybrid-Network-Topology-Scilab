
clear;
clc;

// NETWORK DETAILS
NameOfNetwork = "Hybrid Topology";
NumberOfNodes = 25;

// BUS TOPOLOGY (Nodes 1–10)
StartBus = [1 2 3 4 5 6 7 8 9];
EndBus   = [2 3 4 5 6 7 8 9 10];


// STAR TOPOLOGY (Nodes 11–18, center = 11)
StartStar = [11 11 11 11 11 11 11];
EndStar   = [12 13 14 15 16 17 18];


// RING TOPOLOGY (Nodes 19–25)
StartRing = [19 20 21 22 23 24 25];
EndRing   = [20 21 22 23 24 25 19];


// INTERCONNECTIONS (MAKE IT HYBRID)
StartConnect = [10 15];
EndConnect   = [11 19];


// COMBINE ALL CONNECTIONS
StartingNodesOfConnection = [StartBus StartStar StartRing StartConnect];
EndingNodesOfConnection   = [EndBus   EndStar   EndRing   EndConnect];


// NODE COORDINATES
XCoordinatesOfNodes = [
    100 160 220 280 340 400 460 520 580 640 ...
    350 300 350 400 450 400 350 300 ...
    700 760 800 760 700 660 660
];

YCoordinatesOfNodes = [
    300 300 300 300 300 300 300 300 300 300 ...
    520 580 620 580 520 460 460 520 ...
    400 450 500 550 550 500 450
];

// CREATE HYBRID GRAPH
// ==================================================
HybridGraph = NL_G_MakeGraph( ...
    NameOfNetwork, ...
    NumberOfNodes, ...
    StartingNodesOfConnection, ...
    EndingNodesOfConnection, ...
    XCoordinatesOfNodes, ...
    YCoordinatesOfNodes ...
);



// (1) Display Hybrid Topology
NL_G_ShowGraph(HybridGraph, 1);
xtitle("Hybrid Topology");

// (2) Show Node and Edge Numbers
NL_G_ShowGraphNE(HybridGraph, 2);
xtitle("Node and Edge Numbers");

// (3) Highlight Nodes (CORRECT SYNTAX)
[HybridGraph, f] = NL_G_HighlightNodes(HybridGraph, [1 5 10 11 15 19], 30, 8, 20, 3);
xtitle("Highlighted Nodes");

// (4) Highlight Edges (CORRECT SYNTAX)
[HybridGraph, e] = NL_G_HighlightEdges(HybridGraph, [1 4 7 10 13], 5, 4, 4);
xtitle("Highlighted Edges");

// (5) Display Total Nodes and Edges
[nodes, edges] = NL_G_GraphSize(HybridGraph);
disp("Total number of nodes:");
disp(nodes);
disp("Total number of edges:");
disp(edges);
