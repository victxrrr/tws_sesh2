program euler
    use iso_fortran_env, only: real64
    implicit none
    ! error = approx error + rounding error
    ! approx error (math) decreases with n
    ! rounding error increases with n (lack of precision)
    ! if n = 2**k, no rounding error until the precision machine is reached
    ! explained by the mantisse representation of the number or something like that
    integer n
    integer k
    real(real64) e

    do k = 1,20
        n = 2**k
        e = (1.0 + 1.0/n)**n
        print '(f18.15, 2x, f18.15)', e, abs(exp(1.0) - e) 
    enddo

end program
