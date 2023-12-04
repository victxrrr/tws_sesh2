program Main

implicit none

integer i
integer, parameter :: k32 = selected_int_kind(32)

do i = -2,49
    print *, double_factorial(i)
enddo

contains

recursive function double_factorial(n) result(doublefact)

    integer, intent(in) :: n
    integer(kind=k32) :: doublefact
    ! other solution : real but precision loss + error propagation !!!

select case (n)
case (1 :)
    doublefact = n*double_factorial(n-2)
case (-1, 0)
    doublefact = 1
case default
    doublefact = 0
end select

end function double_factorial


end program