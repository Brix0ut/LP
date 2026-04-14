implement main
    open core, console

domains
    intList = integer*.

class predicates
    read_list : (intList [out]) determ.
    min_max : (intList, integer [out, out], integer [out, out]) determ.
    minimum : (integer, integer, integer [out, out]) determ.
    maximum : (integer, integer, integer [out, out]) determ.
    remove : (integer, intList, intList [out, out]) determ.
    solve : (intList) determ.

clauses
    read_list([H | T]) :-
        H = read(),
        H <> 0,
        !,
        read_list(T).
    read_list([]) :-
        _ = readLine(),
        !.

    minimum(A, B, A) :-
        A < B,
        !.
    minimum(_, B, B).

    maximum(A, B, A) :-
        A > B,
        !.
    maximum(_, B, B).

    min_max([H], H, H) :-
        !.
    min_max([H | T], Min, Max) :-
        min_max(T, Min1, Max1),
        minimum(H, Min1, Min),
        maximum(H, Max1, Max).

    remove(_, [], []) :-
        !.
    remove(X, [X | T], Res) :-
        !,
        remove(X, T, Res).
    remove(X, [H | T], [H | Res]) :-
        remove(X, T, Res).

    solve(List) :-
        nl,
        write("Початковий список: ", List),
        nl,
        min_max(List, Min1, Max1),
        write("1-й мінімум: ", Min1, ", 1-й максимум: ", Max1),
        nl,
        remove(Min1, List, L1),
        remove(Max1, L1, L2),
        write("Список після виключення: ", L2),
        nl,
        min_max(L2, Min2, Max2),
        write("2-й мінімум: ", Min2, ", 2-й максимум: ", Max2),
        nl,
        NewMin2 = Min2 + Max1,
        NewMax2 = Max2 - Min1,
        nl,
        write("Результат (2-й мінімум + 1-й максимум): ", Min2, " + ", Max1, " = ", NewMin2),
        nl,
        write("Результат (2-й максимум - 1-й мінімум): ", Max2, " - ", Min1, " = ", NewMax2),
        nl.

    run() :-
        nl,
        write("--- Лабораторна робота 3, Завдання 10 ---"),
        nl,
        write("Вводьте цілі числа по одному (введіть 0 для завершення вводу):"),
        nl,
        read_list(List),
        solve(List),
        write("\nНатисніть Enter для виходу..."),
        _ = readLine(),
        !.

    run() :-
        nl,
        write("Сталася помилка! Можливо, ви ввели замало унікальних чисел."),
        nl,
        write("Натисніть Enter для виходу..."),
        _ = readLine().

end implement main

goal
    console::runUtf8(main::run).
