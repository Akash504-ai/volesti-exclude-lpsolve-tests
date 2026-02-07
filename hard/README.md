# Hard Test — Maximum Inscribed Ball using nloptr

This test implements the computation of the maximum inscribed ball of a convex polytope using the CRAN package nloptr.

The polytope is given in H-representation (Ax <= b). The optimization variables are the center of the ball and its radius. The objective is to maximize the radius while ensuring the ball remains inside all constraints.

The implementation uses nonlinear inequality constraints and solves theproblem using nloptr on a simple example polytope.
