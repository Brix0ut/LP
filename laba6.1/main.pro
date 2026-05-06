implement main
    open core, string, console

domains
    tree =
        tr(string, tree, tree);
        empty.

class predicates
    creating : (tree) -> tree multi.
    insert : (string, tree) -> tree multi.
    deleteSubtree : (tree, string) -> tree determ.

clauses
    creating(T) = creating(Tnew) :-
        X = readLine(),
        X <> "",
        !,
        Tnew = insert(X, T).

    creating(T) = T.

    insert(X, empty) = tr(X, empty, empty).

    insert(X, tr(K, Lt, Rt)) = tr(K, Ltnew, Rt) :-
        length(X) > 4,
        !,
        Ltnew = insert(X, Lt).

    insert(X, tr(K, Lt, Rt)) = tr(K, Lt, Rtnew) :-
        Rtnew = insert(X, Rt).

    deleteSubtree(empty, _) = empty.

    deleteSubtree(tr(Key, Left, Right), TargetValue) = Result :-
        if Key = TargetValue then
            Result = empty
        else
            NewLeft = deleteSubtree(Left, TargetValue),
            NewRight = deleteSubtree(Right, TargetValue),
            Result = tr(Key, NewLeft, NewRight)
        end if.

    run() :-
        T = creating(empty),
        write("Original tree: "),
        write(T),
        nl,
        % Видалення піддерева (наприклад, для значення "table")
        NewTree = deleteSubtree(T, "table"),
        write("Modified tree: "),
        write(NewTree),
        nl,
        fail
        or
        _ = readLine().

end implement main

goal
    console::runUtf8(main::run).
