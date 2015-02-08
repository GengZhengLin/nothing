global_variables;
[X,Y]=ode23('diff_equation',[0,10],[0.6 0.1 0.1 0.1 0.05 0.05 0 0]);
draw_result(X,Y);