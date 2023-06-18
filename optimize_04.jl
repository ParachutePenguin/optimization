using JuMP, HiGHS
function pgm_4_1()
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
end

function pgm_4_2()
    mv_model = Model(HiGHS.Optimizer)
    A = [
        -3  0
        -2 -4
        -2 -5
    ];
    b = [-6;-10;-8];
    c = [50;80];
    @variable(mv_model, x[1:2] >= 0);
    @constraint(mv_model, A*x .<= b);
    @objective(mv_model, Min, c'*x);
    optimize!(mv_model);
    @show termination_status(mv_model);
    @show value(x[1]), value(x[2]);
end

function main()
    pgm_4_2()
end

main()