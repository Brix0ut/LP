implement main
    open core, console

class predicates
    calc_f1 : (real X, integer K, real Term, real Sum, real Result [out]) determ.
    f1 : (real X, real Result [out]) determ.
    calc_f2 : (integer N, integer K, real Fact, real Sum, real Result [out]) determ.
    f2 : (integer N, real Result [out]) determ.

clauses
    calc_f1(_, _, Term, Sum, Sum) :-
        Term < 0.000001,
        Term > -0.000001,
        !.

    calc_f1(X, K, Term, Sum, Result) :-
        K1 = K + 1,
        Term1 = Term * X / K1,
        Sum1 = Sum + Term1,
        calc_f1(X, K1, Term1, Sum1, Result).

    f1(X, Result) :-
        calc_f1(X, 0, 1.0, 1.0, Result).

    calc_f2(N, K, _, Sum, Sum) :-
        K >= N,
        !.

    calc_f2(N, K, Fact, Sum, Result) :-
        K < N,
        K1 = K + 1,
        Fact1 = Fact * K1,
        Sum1 = Sum + Fact1,
        calc_f2(N, K1, Fact1, Sum1, Result).

    f2(N, Result) :-
        calc_f2(N, 0, 1.0, 1.0, Result).

    run() :-
        nl,
        write("--- Лабораторна робота 2, Завдання 10 ---"),
        nl,
        write("Введіть значення X (для першої функції): "),
        X = read(),
        write("Введіть значення N (для другої функції): "),
        N = read(),
        f1(X, Res1),
        f2(N, Res2),
        FinalResult = Res1 * Res2,
        nl,
        writef("Результат F1 (сума x^n/n! до нескінченності) = %\n", Res1),
        writef("Результат F2 (сума k! від 0 до n) = %\n", Res2),
        writef("Добуток двох функцій (F1 * F2) = %\n", FinalResult),
        write("\nНатисніть Enter для виходу..."),
        _ = readLine(),
        _ = readLine(),
        !.

    run() :-
        nl,
        write("Сталася помилка обчислень або введено некоректні дані!"),
        nl,
        write("Натисніть Enter для виходу..."),
        _ = readLine(),
        _ = readLine().

end implement main

goal
    console::runUtf8(main::run).
