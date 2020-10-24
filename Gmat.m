function G = Gmat(P, q)

for i = 1:length(q)
    G(i) = diff(P,q(i));
end
G = G';