function D = Dmat(m, Jv, Jw, R, I)
D = m*Jv'*Jv + Jw'*R*I*R'*Jw;