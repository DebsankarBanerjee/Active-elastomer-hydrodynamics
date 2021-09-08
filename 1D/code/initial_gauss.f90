	subroutine initial_gauss
	use mod_param
	implicit none

	integer::i,num
	real*8 :: twopi
	twopi = 2.d0*acos(-1.d0)

	num = 1
	call gauss(num,u)


	num = 3
      	call gauss(num,r)

!	----------------------------initial profiles stored
	r0 = r
	u0 = u
	
	call strain2
	s0 = s

	end subroutine initial_gauss


	subroutine gauss(num,profile)
	use mod_param
	implicit none

	integer :: i,j,num
	real*8 :: mean_g(1:num),sigma_g(1:num)
	real*8 :: profile(0:n)

	profile = 0.d0


	do j=1,num
	mean_g(j) = (n*dx)*(0.25d0 + 0.5d0*(float(j)/num))
	enddo
	sigma_g = ((n*dx)/2.d0)/(num*4.d0)
	
	do j=1,num

	do i = 0,n
	profile(i) = profile(i) + dexp(-((i*dx-mean_g(j))**2.0) / (sigma_g(j)*sigma_g(j)) )
	enddo

	enddo

	end subroutine gauss
