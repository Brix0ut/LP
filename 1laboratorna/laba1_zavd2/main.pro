implement main
    open core, console

class predicates
    d : (integer [out]) nondeterm.
    solve : () nondeterm.

clauses
    d(0).
    d(1).
    d(2).
    d(3).
    d(4).
    d(5).
    d(6).
    d(7).
    d(8).
    d(9).

    solve() :-
        d(M),
        M > 0,
        d(A),
        A > 0,
        A <> M,
        d(I),
        I <> M,
        I <> A,
        d(R),
        R > 0,
        R <> M,
        R <> A,
        R <> I,
        MA = M * 10 + A,
        MIR = M * 100 + I * 10 + R,
        MA * MA = MIR,
        AM = A * 10 + M,
        RIM = R * 100 + I * 10 + M,
        AM * AM = RIM,
        write("Знайдено цифри: M=", M, ", A=", A, ", I=", I, ", R=", R),
        nl,
        write("Перевірка 1: ", MA, " * ", MA, " = ", MIR),
        nl,
        write("Перевірка 2: ", AM, " * ", AM, " = ", RIM),
        nl.

    run() :-
        nl,
        write("--- Розв'язок числового ребуса ---"),
        nl,
        solve(),
        fail
        or
        _ = readChar().

end implement main

goal
    console::runUtf8(main::run).
