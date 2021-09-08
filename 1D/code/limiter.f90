!	------------------------------------------------------------
!	----- MINMOD LIMITER----------------------------------------
	subroutine limiter_minmod(rx,lmtr)
	use mod_param	
	implicit none
	real*8 :: rx,lmtr
	integer :: i,j

		
	lmtr = max(0.d0,min(rx,1.d0))
	

	end subroutine limiter_minmod

!	------------------------------------------------------------
!	----- SUPERBEE LIMITER--------------------------------------
	subroutine limiter_superbee(rx,lmtr)
	use mod_param	
	implicit none
	real*8 :: rx,lmtr
	integer :: i,j

		
	lmtr = max(0.d0,min(2.d0*rx,1.d0),min(rx,2.d0))
	

	end subroutine limiter_superbee

!	------------------------------------------------------------
!	----- vanLeer LIMITER----------------------------------------
	subroutine limiter_vanLeer(rx,lmtr)
	use mod_param	
	implicit none
	real*8 :: rx,lmtr
	integer :: i,j

		
	lmtr = (abs(rx)+rx)/(1.d0+abs(rx))
	

	end subroutine limiter_vanLeer

