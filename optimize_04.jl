using JuMP, HiGHS
model = Model(HiGHS.Optimizer);
@variable(model, x1 >= 0);
@variable(model, x2 >= 0);
@objective(model, Min, 50x1 + 80x2);
@constraint(model, c1, 3x1 >= 6);
@constraint(model, c2, 2x1 + 4x2 >= 10);
@constraint(model, c3, 2x1 + 5x2 >= 8);
print(model);
optimize!(model);
@show termination_status(model);
@show objective_value(model);
@show value(x1), value(x2);