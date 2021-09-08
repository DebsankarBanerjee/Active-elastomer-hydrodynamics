!	the main code that calculates increment in u and r
!	at every time step.
!	du = forces from the elastic and active stresses.
!	dr = change in density due to advection and binding
!	     and unbinding.
!	
!	--------------------------------------------------- 

      	subroutine  rhs
      	use mod_param
      	implicit none

!	------------------------------------------
!	displacement field equation              \
!	------------------------------------------
      	call deriv7p(u,s)

      	call sigma_elastic 

      	call sigma_active

      	call deriv7p(sigma,dsig)

      	call deriv7p(act,dact)

      	du = dsig + dact
	v = du

!	------------------------------------------
!	bound myosin density equation		  \
!	------------------------------------------
	call flux
	call source
      	dr = -djc + sr
      
      	end subroutine rhs

