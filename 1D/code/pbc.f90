!	******************************************************
!	periodic boundary condition routines for various 
!	variables
!	******************************************************




!	******************************************************
	subroutine strain_PBC
	use mod_param	
	implicit none
	integer :: i,j
	
	s(0)=(u(1)-u(n))/(2.d0*dx)
	s(n)=(u(0)-u(n-1))/(2.d0*dx)	

	s_int(0) = 0.5d0*(s(1)+s(0))
	s_int(n) = 0.5d0*(s(0)+s(n))
	
	end subroutine strain_PBC


!	******************************************************
	subroutine velocity_PBC
	use mod_param	
	implicit none
	integer :: i,j
	
	v_int(0) = 0.5d0*(v(1)+v(0))
	v_int(n) = 0.5d0*(v(0)+v(n))

	end subroutine velocity_PBC

!	******************************************************
	subroutine deriv_PBC(z,dz0,dzn)
	use mod_param	
	implicit none
	real*8 :: z(0:n),dz0,dzn
	integer :: i,j
	
	dz0=(z(1)-z(n))/(2.d0*dx)
	dzn=(z(0)-z(n-1))/(2.d0*dx)

	end subroutine deriv_PBC




!	*******************************************************

	subroutine flux_pbc
	use mod_param	
	implicit none
	integer :: i,j
	real*8 :: theta,g,j1,j2,pp


!	----------------------------------------------i=0
	if(v_int(0).ge.0.d0) then
!	------------------------------------------------------
	theta = 1.d0
	g = (r(0)-r(n)+e)/(r(1)-r(0)+e)

	else

	theta = -1.d0
	g = (r(2)-r(1)+e)/(r(1)-r(0)+e)	
	endif
!	------------------------------------------------------
	call limiter_vanLeer(g,limiter)	
	j1 = 0.5d0*v_int(0)*((1+theta)*r(0)+(1-theta)*r(1))
	j2 = 0.5d0*abs(v_int(0))*(1-abs(v_int(0)*dt/dx))*limiter*(r(1)-r(0))
	j_plus = j1 + j2
!	------------------------------------------------------




	if(v_int(n).ge.0.d0) then
!	------------------------------------------------------
	theta = 1.d0
	g = (r(n)-r(n-1)+e)/(r(0)-r(n)+e)

	else

	theta = -1.d0
	g = (r(1)-r(0)+e)/(r(0)-r(n)+e)	
	endif
!	------------------------------------------------------
	call limiter_vanLeer(g,limiter)	
	j1 = 0.5d0*v_int(n)*((1+theta)*r(n)+(1-theta)*r(0))
	j2 = 0.5d0*abs(v_int(n))*(1-abs(v_int(n)*dt/dx))*limiter*(r(0)-r(n))
	j_mins = j1 + j2

	djc(0) = (j_plus - j_mins)/dx - D*(r(1)-2.d0*r(0)+r(n))/(dx*dx)

	pp=j_mins

	aflux(0) = j_plus - j_mins
	dflux(0) = -D*(r(1)-r(n))/dx

!	----------------------------------------------i=1
	j_mins = j_plus
	if(v_int(1).ge.0.d0) then
!	------------------------------------------------------
	theta = 1.d0
	g = (r(1)-r(0)+e)/(r(2)-r(1)+e)

	else

	theta = -1.d0
	g = (r(3)-r(2)+e)/(r(2)-r(1)+e)	
	endif
!	------------------------------------------------------
	call limiter_vanLeer(g,limiter)	
	j1 = 0.5d0*v_int(1)*((1+theta)*r(1)+(1-theta)*r(2))
	j2 = 0.5d0*abs(v_int(1))*(1-abs(v_int(1)*dt/dx))*limiter*(r(2)-r(1))
	j_plus = j1 + j2
!	------------------------------------------------------

	djc(1) = (j_plus - j_mins)/dx - D*(r(2)-2.d0*r(1)+r(0))/(dx*dx)

	aflux(1) = j_plus - j_mins
	dflux(1) = -D*(r(2)-r(0))/dx

!	-----------------------------------------------i=n
	j_plus = pp
	if(v_int(n-1).ge.0.d0) then
!	------------------------------------------------------
	theta = 1.d0
	g = (r(n-1)-r(n-2)+e)/(r(n)-r(n-1)+e)

	else

	theta = -1.d0
	g = (r(0)-r(n)+e)/(r(n)-r(n-1)+e)	
	endif
!	------------------------------------------------------
	call limiter_vanLeer(g,limiter)	
	j1 = 0.5d0*v_int(n-1)*((1+theta)*r(n-1)+(1-theta)*r(n))
	j2 = 0.5d0*abs(v_int(n-1))*(1-abs(v_int(n-1)*dt/dx))*limiter*(r(n)-r(n-1))
	j_mins = j1 + j2

	djc(n) = (j_plus - j_mins)/dx - D*(r(0)-2.d0*r(n)+r(n-1))/(dx*dx)

	aflux(n) = j_plus - j_mins
	dflux(n) = -D*(r(0)-r(n-1))/dx

	!-----------------------------------------i=n-1
	j_plus = j_mins

	if(v_int(n-2).ge.0.d0) then
!	------------------------------------------------------
	theta = 1.d0
	g = (r(n-2)-r(n-3)+e)/(r(n-1)-r(n-2)+e)

	else

	theta = -1.d0
	g = (r(n)-r(n-1)+e)/(r(n-1)-r(n-2)+e)	
	endif
!	------------------------------------------------------
	call limiter_vanLeer(g,limiter)	
	j1 = 0.5d0*v_int(n-2)*((1+theta)*r(n-2)+(1-theta)*r(n-1))
	j2 = 0.5d0*abs(v_int(n-2))*(1-abs(v_int(n-2)*dt/dx))*limiter*(r(n-1)-r(n-2))
	j_mins = j1 + j2

	djc(n-1) = (j_plus - j_mins)/dx - D*(r(n)-2.d0*r(n-1)+r(n-2))/(dx*dx)

	aflux(n-1) = j_plus - j_mins
	dflux(n-1) = -D*(r(n)-r(n-2))/dx

	end subroutine flux_pbc









