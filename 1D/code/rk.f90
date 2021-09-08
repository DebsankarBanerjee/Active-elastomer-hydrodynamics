!	Simple Euler integration scheme	
	subroutine euler
      	use mod_param
      	implicit none

	integer :: i

	call rhs	

	do i=0,n
      	u(i)=u(i)+du(i)*dt
      	enddo
	do i=0,n
      	r(i)=r(i)+dr(i)*dt
      	enddo

	end subroutine euler

!	*****************************************************
!	*****************************************************


!	TVD rk2 time-stepping
!	test	
	subroutine tvd_rk2
      	use mod_param
      	implicit none

	real*8 :: u_n(0:n), r_n(0:n)
	integer :: i
      

	u_n = u
	r_n = r

	call rhs
     
      	do i=0,n
      	u(i)=u(i)+du(i)*dt
      	enddo
	do i=0,n
      	r(i)=r(i)+dr(i)*dt
      	enddo

	call rhs

	do i=0,n
      	u(i)=0.5d0*(u_n(i)+u(i)+du(i)*dt)
      	enddo
	do i=0,n
      	r(i)=0.5d0*(r_n(i)+r(i)+dr(i)*dt)
      	enddo

	end subroutine tvd_rk2
	

!	*****************************************************
!	*****************************************************

!	TVD rk3 time-stepping
!	test	
	subroutine tvd_rk3
      	use mod_param
      	implicit none

	real*8 :: u_n(0:n), r_n(0:n)
	integer :: i

	u_n = u
	r_n = r

	call rhs	!---------------------------------1
     
      	do i=0,n
      	u(i)=u(i)+du(i)*dt
      	enddo
	do i=0,n
      	r(i)=r(i)+dr(i)*dt
      	enddo

	call rhs	!---------------------------------2

	do i=0,n
      	u(i)=0.75d0*u_n(i)+0.25d0*(u(i)+du(i)*dt)
      	enddo
	do i=0,n
      	r(i)=0.75d0*r_n(i)+0.25d0*(r(i)+dr(i)*dt)
      	enddo

	call rhs	!---------------------------------3

	do i=0,n
      	u(i)=(1.d0/3.d0)*u_n(i)+(2.d0/3.d0)*(u(i)+du(i)*dt)
      	enddo
	do i=0,n
      	r(i)=(1.d0/3.d0)*r_n(i)+(2.d0/3.d0)*(r(i)+dr(i)*dt)
      	enddo

	end subroutine tvd_rk3


!	*****************************************************
!	*****************************************************

!	Adam-Bashforth 2nd order time-stepping
!	test	
	subroutine adam2
      	use mod_param
      	implicit none

	real*8 :: u_n(0:n), r_n(0:n), fu_n(0:n), fr_n(0:n)
	integer :: i
      

	

	call rhs	!---------------------------------euler step
	fu_n = du
	fr_n = dr

	call euler
     
      	
	call rhs	!---------------------------------calculation of f_n+1

	do i=0,n
	u(i) = u(i) + ((3.d0/2.d0)*du(i) - (1.d0/2.d0)*fu_n(i))
	r(i) = r(i) + ((3.d0/2.d0)*dr(i) - (1.d0/2.d0)*fr_n(i))
	enddo


	end subroutine adam2
