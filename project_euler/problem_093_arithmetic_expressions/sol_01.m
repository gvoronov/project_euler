function [a t]=sol_01
tic;
addpath('../function_library/');
permutations=cell(1,24);
operations=cell(1,64);
for i=1:24  %loop over possible perumtations of {a b c d}
    permutations{i}=get_permutation(i,{1 2 3 4});
end
for i=1:64 %loop over different operation assignments
    operations{i}=get_operations(i);
end
max_consec=0;
for i=1:210, %loop over different choices of 4 digits 
    choice=get_choice(i,{0 1 2 3 4 5 6 7 8 9},4);
    consec=longest_consecutive(choice,permutations,operations);
    if consec>max_consec
        atmp=choice;
        max_consec=consec;
    end
end;
a=1000*atmp{1}+100*atmp{2}+10*atmp{3}+atmp{4};
t=toc;
end

function n=longest_consecutive(digits,permutations,operations)
targets_hit=zeros(1,prod(cell2mat(digits)));
for i=1:24  %loop over possible perumtations of {a b c d}
    for j=1:64 %loop over different operation assignments
        ps=digits(cell2mat(permutations{i}));
        os=operations{j};
        targets_hit=target(binary_op(binary_op(ps{1},ps{2},os(1)),binary_op(ps{3},ps{4},os(2)),os(3)),targets_hit);
        targets_hit=target(binary_op(ps{1},binary_op(ps{2},binary_op(ps{3},ps{4},os(1)),os(2)),os(3)),targets_hit);
        if os(3)>2
            targets_hit=target(binary_op(binary_op(ps{3},ps{4},os(1)),binary_op(ps{1},ps{2},os(2)),os(3)),targets_hit);
            targets_hit=target(binary_op(binary_op(ps{2},binary_op(ps{3},ps{4},os(1)),os(2)),ps{1},os(3)),targets_hit);
        end
        if os(2)>2
            targets_hit=target(binary_op(ps{1},binary_op(binary_op(ps{3},ps{4},os(1)),ps{2},os(2)),os(3)),targets_hit);
        end
        if os(2)>2 && os(3)>2
            targets_hit=target(binary_op(binary_op(binary_op(ps{3},ps{4},os(1)),ps{2},os(2)),ps{1},os(3)),targets_hit);
        end
    end
end
n=find(~targets_hit,1)-1;
if isempty(n)
    n=0;
end
end

function choices=get_choice(n,objects,M)
N=length(objects)-1;
choices={};
for i=M-1:-1:1
    ndigs=[0 nchoosek(N,i)];
    for j=N-1:-1:i
        ndigs=[ndigs ndigs(end)+nchoosek(j,i)];
    end
    choice=find(n<=ndigs,1)-1;
    choices{length(choices)+1}=objects{choice};
    objects=objects(choice+1:end);
    n=n-ndigs(choice);
    N=N-1-choice+1;
end
choices{length(choices)+1}=objects{n};
end

function c=binary_op(a,b,op)
switch op
    case 1
        c=a+b;
    case 2
        c=a*b;
    case 3
        c=a-b;
    case 4
        c=a/b;
end
end

function operations=get_operations(n)
operations=ones(1,3);
for i=1:3
    operations(i)=ceil(n/power(4,3-i));
    n=mod(n-1,power(4,3-i))+1;
end
end

function targets_hit=target(hit,targets_hit)
if hit>=1 && floor(hit)==ceil(hit) && hit<inf
    targets_hit(hit)=1;
end
end

