! FIND_REAL_KINDS
! 
!   Program to list the kind parameter of all available reals.
! 
! HISTORY
! 
!   20100305 KP - Initial version
!   20110308 KP - Added output
!   20191008 PA - Modified for exercise sessions 2019
!   20210617 PA - Added documentation for students
! 
! AUTHORS:
! 
!   Koen Poppe and Pieter Appeltans
!   Department of Computer Science,
!   Katholieke Universiteit Leuven, Celestijnenlaan 200A,
!   B-3001 Heverlee, Belgium

program find_real_kinds
    implicit none ! IMPORTANT: Variables should be declared explicitly

    integer, parameter :: max_nb_kinds = 6 ! Overestimate for the number of available real kinds
    integer, dimension(max_nb_kinds) :: kinds_found ! Create array to store the available real kinds
    integer :: test_kind, nb_kinds_found
    integer :: p,r, pmax,rmax
    logical :: added 

    nb_kinds_found = 0 ! Store the number of kinds already found

    pmax = ceiling(240*log10(2.0))    ! Largest precision parameter
    rmax = ceiling(2**25*log10(2.0)) ! Largest range parameter 
    ! We expect no kinds with precision larger than 10**73 (240 bits for mantisa) and 
    ! numbers larger than 2.**(2**25) (would require 26 bits for the exponent)
  
    print *, "Found real kinds: "
    do r = 1, rmax
        do p = 1, pmax
            test_kind = selected_real_kind( p,r ) ! See documentation Fortran 2003 - 13.7.106
            ! For the documentation of PRECISION see Section 13.7.90
            ! and for RANGE see Section 13.7.96
            if( test_kind >= 0 ) then ! Found real kind that has desired precision and range
                call try_adding_to_set( kinds_found, nb_kinds_found, test_kind, added )
                if( added ) then ! If the kind parameter was not encountered before then print it
                    print '("KIND - p - r: ",I3," - ", I3," - ", I3)', test_kind,p,r
                end if
            end if
        end do
    end do
    

contains
    ! Subroutine that adds element to set if no such element exists in the set
    subroutine try_adding_to_set( set, set_size, element, added )
        integer, dimension(:), intent( inout ) :: set
        integer,               intent( inout ) :: set_size
        integer,               intent( in    ) :: element
        logical,               intent(   out ) :: added 

        ! Only add if no such element exists in the set
        added = .false.
        if( all( set(1:set_size) /= element ) ) then

            if( set_size+1 > size(set) ) then
                print *," *** ERROR: could not add element to the given	set: the set is full."
                return
            end if
            set_size = set_size + 1
            set(set_size) = element
            added = .true.
        end if

    end subroutine
end program find_real_kinds
