	subroutine source
      	use mod_param
      	implicit none

      	integer::i

!	call deriv(r,d1r)
!	ku=ku0*dexp(alpha*d1r)
! 	------use of flag to change the value of alpha and sr-------------

     	ku=ku0*dexp(alpha*s)	

	
	sr = - ku*r + kb*(1.d0-c*s)
	!sr = flag*sr

      	end subroutine source
