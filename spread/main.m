global_variables;
[T,Y]=ode23('diff_equation',[0,10],[s i1 i2 r 0]);
draw_result(T,Y);