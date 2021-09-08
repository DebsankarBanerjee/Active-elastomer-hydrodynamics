	subroutine file_write(j)
	use mod_param	
	implicit none
	integer :: i,j


!	call correlation(r,cor_r)
!	call correlation(s,cor_s)

	tvu = 0.d0
	tvr = 0.d0
	do i=0,n-1
	tvu = tvu + abs(u(i+1)-u(i))
	tvr = tvr + abs(r(i+1)-r(i))
	enddo

      	write(200,*)j*dt, u(n)-u(0), sum(r)/(n+1), sum(du)/(n+1)
	write(400,*)j*dt, (maxval(du)*dt)/dx, tvr,tvu, minval(De), 2.d0*maxval(De)*dt/(dx*dx)
	
!	write(500,*) j*dt, -dx, jc(-1)

	do i=0,n
	write(100,*) j*dt, i*dx, u(i)
	write(101,*) j*dt, i*dx, r(i) 
	write(102,*) j*dt, i*dx, s(i)
	write(103,*) j*dt, i*dx, sigma(i),act(i)
	write(104,*) j*dt, i*dx, v(i),dsig(i),dact(i)
	write(105,*) j*dt, i*dx, kb*(1.d0-c*s(i))				!- ku(i)*r(i), kb*(1.d0-c*s(i))

!	write(500,*) j*dt, i*dx, jc(i)
	

	enddo
	
	write(500,*) j*dt, r(n/2)

	do i=0,n/2
	write(106,*) j*dt, i*dx, cor_r(i), cor_s(i)
	enddo

	write(100,*) ""
	write(101,*) ""
	write(102,*) ""
	write(103,*) ""
	write(104,*) ""
	write(105,*) ""
	write(106,*) ""

	


	end subroutine file_write




!	*************************************************************************
!	*************************************************************************


	subroutine file_write_movie(j)
	use mod_param	
	implicit none
	integer :: i,j
	!real*8 :: Fe(0:n)
	

	do i=0,n
	
	

	write(101,*) j*dt, i*dx, r(i)
	write(102,*) j*dt, i*dx, s(i)
	!write(103,*) j*dt, i*dx, sigma(i),act(i)
	write(104,*) j*dt, i*dx, v(i),dsig(i),dact(i)
	write(105,*) j*dt, i*dx, sr(i)
	enddo

	do i=0,n/2
	write(106,*) j*dt, i*dx, cor_r(i), cor_s(i)
	enddo

	write(100,*) ""
	write(101,*) ""
	write(102,*) ""
	write(103,*) ""
	write(104,*) ""
	write(105,*) ""
	write(106,*) ""


	end subroutine file_write_movie


