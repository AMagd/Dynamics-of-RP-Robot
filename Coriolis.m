function C = Coriolis(D,q,dq)
sym C;
n = length(q);
for k = 1:n

    for j =1:n

        C(k,j) = sym(0);

        for i=1:n
            c_ijk = (1/2)*(diff(D(k,j),q(i)) + diff(D(k,i),q(j))-diff(D(i,j),q(k)));
            C(k,j) = C(k,j) + c_ijk*dq(i);

        end

    end
end
end
