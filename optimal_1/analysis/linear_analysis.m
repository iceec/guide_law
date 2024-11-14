function dyita =  linear_analysis(v,M,N,yita,yimo_0)

dyita = -(N-1)/(1-v) * yita - M * (N-1)*yimo_0*(1-v)^(M-1);

end