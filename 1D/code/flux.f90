
!	---------------------------------------------------------------------------------
!	---------------------------------------------------------------------------------
!	NEW CODE
!	_________________________________________________________________________________


!	calculate flux and its derivative using advanced
!	flux limiter method with a freedom of choice of 
!	user defined limiter function, like limiter_name(r,lmtr)
!	we calculate flux at the interface (i+ 1/2) and (i- 1/2)
!	for that we use velocity value calculated at the interface
!	-----------------------------------------------------------
	subroutine flux	
	use mod_param	
	implicit none
	integer :: i,j
	real*8 :: theta,g,j1,j2


	do i=1,n-1
	v_int(i) = 0.5d0*(v(i+1)+v(i))
	enddo
	call velocity_PBC

!	---------------------------------------------------------
!	FLUX CALCULATION
!	---------------------------------------------------------
	call flux_pbc

	do i=2,n-2

	if(v_int(i).ge.0.d0) then
!	------------------------------------------------------
	theta = 1.d0
	g = (r(i)-r(i-1)+e)/(r(i+1)-r(i)+e)

	else

	theta = -1.d0
	g = (r(i+2)-r(i+1)+e)/(r(i+1)-r(i)+e)	
	endif
!	------------------------------------------------------
	call limiter_vanLeer(g,limiter)	
	j1 = 0.5d0*v_int(i)*((1+theta)*r(i)+(1-theta)*r(i+1))
	j2 = 0.5d0*abs(v_int(i))*(1-abs(v_int(i)*dt/dx))*limiter*(r(i+1)-r(i))
	j_plus = j1 + j2
!	------------------------------------------------------




	if(v_int(i-1).ge.0.d0) then
!	------------------------------------------------------
	theta = 1.d0
	g = (r(i-1)-r(i-2)+e)/(r(i)-r(i-1)+e)

	else

	theta = -1.d0
	g = (r(i+1)-r(i)+e)/(r(i)-r(i-1)+e)	
	endif
!	------------------------------------------------------
	call limiter_vanLeer(g,limiter)	
	j1 = 0.5d0*v_int(i-1)*((1+theta)*r(i-1)+(1-theta)*r(i))
	j2 = 0.5d0*abs(v_int(i-1))*(1-abs(v_int(i-1)*dt/dx))*limiter*(r(i)-r(i-1))
	j_mins = j1 + j2

	djc(i) = (j_plus - j_mins)/dx - D*(r(i+1)-2.d0*r(i)+r(i-1))/(dx*dx)

	aflux(i) = j_plus - j_mins
	dflux(i) = -D*(r(i+1)-r(i-1))/dx
	enddo

	
	end subroutine flux

!	**************************************************************************






