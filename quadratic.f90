program quadratic

  implicit none

  integer, parameter :: sp = selected_real_kind(6)
  real(sp) b,c
  b = !TODO
  c = !TODO
  
  print *, "Algorithm 1: ", alg_1(b,c)
  print *, "Algorithm 2: ", alg_2(b,c)
contains



  
  function alg_1(b, c) result (roots)
    real(sp), intent(in) :: b, c
    real(sp), dimension(2) :: roots
    real(sp)             :: D

    D = sqrt((b/2._sp)**2 - c)
    roots= (/-b/2._sp + D, -b/2._sp -D/)
  end function alg_1
  
  function alg_2(b, c) result (roots)
    real(sp), intent(in) :: b, c
    real(sp), dimension(2) :: roots
    real(sp)             :: D, x_1

    D = sqrt((b/2._sp)**2 - c)
    x_1 = sign(abs(b/2._sp) + D, -b)
    roots = (/x_1, c/x_1/)
  end function alg_2

end program quadratic

