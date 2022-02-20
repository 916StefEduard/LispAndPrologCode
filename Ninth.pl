%computes all the sublists of a given list
%subs(L-initial list,R-result lists)
%mathematical model = { [], if n = 0
%                     { l1 U subs(l2..ln) n>0
%                     { subs(l2l3..ln)
%flow model(i,o)

subs([],[]).
subs([H|T],R):-
    subs(T,R).
subs([H|T],[H|R]):-
     subs(T,R).

%inserts an element at all positions
%insert(E-element to be inserted,L -initial list,R-result list)
%mathmodel insert(e,l1l2..ln,r)
%               = { l1 U l1l2...ln
%                 { e U l1l2..ln
%flow model (i,i,o)

insert(E,L,[E|L]).
insert(E,[H|T],[H|R]):-
    insert(E,T,R).


%finds all permutations of a given list
%perm(E-initial list,P-permutations)
%math model
%perm(l1l2..ln,P) = { (l2..ln,b1b2..bn) U l1 U l2l3..ln
%                   { (l2..ln,b1b2..bn) U e U l1l2...ln
%flow model(i,o)

perm([],[]).
perm([H|T],P):-
    perm(T,R),
    insert(H,R,P).


%this function will compute the length of a list
%llength(L-current list,R-result length)
%math model
%llength(l2..ln,L) = { (l2...ln,L+1),if length(list)!=0
%                    { [],  if length(list)=0
%flow model(i,o)

llength([],0).
llength([_|T],L):-
    llength(T,N),
    L is N+1.

%this function will check is a list has a length over 1
%checklist(L-current list)
%mathmodel
%check list = { true, if L>1
%             { false if L<=1
%flow model(i,o)

checklist([]).
checklist(R):-
    llength(R,L),
    L>1.


%checks if a list is in ascending order
%asc(L-inital list)
%mathmodel asc(l1l2....ln)
%               { (l2,l3..ln), if l1<=l2
%             = { true, if  list is ascending
%               { false, if l1>l2.
%flow model(i,i)

asc([_]).
asc([H1,H2|T]):-
    H1=<H2,
    asc([H2|T]).

%onesol(L-initial list,SP-result list)
%flow model(i,i)

onesol(L,SP):-
    subs(L,SS),
    perm(SS,SP),
    checklist(SP),
    asc(SP).


allsol(L,R):-
    findall(X,onesol(L,X),R).


