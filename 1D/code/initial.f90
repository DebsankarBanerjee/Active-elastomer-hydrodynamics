!	---------------------------------------------------------------
!	Codes to generate initial profiles of u and r
!	---------------------------------------------------------------
!	***************************************************************
!	*************GAUSSIAN PULSE****************

	subroutine initial_gauss
	use mod_param
	implicit none

	integer::i,num
	real*8 :: twopi
	twopi = 2.d0*acos(-1.d0)

	num = 1
	call gauss(num,u)
	u=0.d0


	num = 1
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


!	***************************************************************
!	*************RANDOM PROFILE (UNIFORM DIST.)****************

	subroutine initial_rand
	use mod_param
	implicit none

	integer::i,seed
	real*8::mn,a1,a2
	seed = 861156
	mn = 2.d0*acos(-1.d0)/n

	call srand(seed)
	a1=rand()
	a2=rand()

	do i=0,n
      	u(i)= 0.d0*(a1*dsin(mn*i)+a2*dsin(2.d0*mn*i))

      	r(i) = 0.02d0*rand() + 0.1d0
     	enddo

!	---------------- bleach
!	do i=60,120
!	r(i)=0.d0
!	enddo

!	----------------------------initial profiles stored
	r0 = r
	do i=0,n
	u0(i) = u(i)
	enddo
	call deriv_fd(u,s)
	s0 = s

	end subroutine initial_rand


!	***************************************************************
!	*************PROFILE READ FROM A FILE****************

	subroutine initial_read
	use mod_param
	implicit none

	integer::i
	real*8:: blah,dum(0:n)

!	------------------------ TO USE THIS RENAME 'data_u' and 'data_r'
!	-------------------------FROM THERE IT WILL READ u0 and r0
	!open(901,file='../data/data_ui.txt')
	open(902,file='../data/data_ri.txt')


	do i=0,n
      	!read(901,*)blah,u(i)			!blah,blah,u(i)
	read(902,*)blah,r(i)			!blah,blah,r(i)
	u(i) = 0.d0
	!write(*,*) r(i)      	
	enddo

!	----------------------------inverse of the profile
	!call array_inv(r,dum)
	!r=dum
	!call array_inv(u,dum)
	!u=dum

!	----------------------------initial profiles stored 
	r0 = r
	u0 = u
	call strain2
	s0 = s

	do i=0,n
	write(*,*) r(i), u(i), s(i)
	enddo

	end subroutine initial_read

!	***************************************************************
!	*************SQUARE PULSE****************

	subroutine initial_square
	use mod_param
	implicit none

	integer::i
	real*8:: center,width,slope,p1,p2,amp
	center = n*dx/2.d0
	width = 20*dx
	slope = 1.d-1
	amp = 10.d0

	p1= center - (width/2.d0)
	p2= center + (width/2.d0)

	do i=0,n
      	r(i)= amp*(dtanh((i*dx-p1)/slope) + dtanh((-i*dx+p2)/slope))
	u(i)= 0.d0*amp*(dtanh(i*dx-p1) + dtanh(-i*dx+p2))
      	enddo

!	----------------------------initial profiles stored
	r0 = r
	u0 = u
	call strain2
	s0 = s

	end subroutine initial_square



!	***************************************************************
!	*************NEW PULSE****************

	subroutine initial_tri
	use mod_param
	implicit none

	integer::i,center,m1,m2
	real*8:: width,slope,p1,p2,amp,base
	slope = 1.d-1

	center = n/2
	m1=n/2-4
	m2=(center-m1)			!*2
	amp = 10.d0
	base = 0.1d0

	
!	No strain in initial system
	do i=0,n
	u(i)= 0.d0			
      	enddo

	r = base
	
	do i=m1,center
	r(i)= ((amp-base)/(center-m1))*(i-m1) + base			
      	enddo	
	do i=center+1,center+m2
	r(i)= amp - ((amp-base)/(m2))*(i-center) + base			
      	enddo	
	

!	----------------------------initial profiles stored
	r0 = r
	u0 = u
	call strain
	s0 = s

	end subroutine initial_tri



!	***************************************************************
!	*************NEW PULSE****************

	subroutine initial_interface
	use mod_param
	implicit none

	integer::i,l,x1,x2
	real*8:: base1,base2

	l = 10
	x1 = n/2-(l/2)
	x2 = n/2+(l/2)
	base1 = 0.8d0
	base2 = 0.1d0

	
!	No strain in initial system
	do i=0,n
	u(i)= 0.d0			
      	enddo

	r = base2
	
	do i=x1,x2
	r(i)= ((base1-base2)/(x2-x1))*(i-x1+1) + base2			
      	enddo

	r(x2+1) = (base1+base2)/2.d0
	

!	----------------------------initial profiles stored
	r0 = r
	u0 = u
	call strain
	s0 = s

	end subroutine initial_interface



!	***************************************************************
!	*************NEW PULSE****************

	subroutine initial_interface_2
	use mod_param
	implicit none

	integer::i,center1,center2
	real*8:: base1,base2

	center1 = n/4
	center2 = 3*n/4
	base1 = 0.8d0
	base2 = 0.1d0

	
!	No strain in initial system
	do i=0,n
	u(i)= 0.d0			
      	enddo

	r = 0.d0
	
	do i=0,center1-1
	r(i)= ((base1-base2)/(center1-1))*i + base2			
      	enddo

	r(center1) = (base1+base2)/2.d0

	do i=center1+1,center2-1
	r(i)= base2
	enddo

	r(center2) = (base1+base2)/2.d0
	
	do i=center2+1,n
	r(i)= base1 - ((base1-base2)/(n-center2))*(i-center2)			
      	enddo	
	

!	----------------------------initial profiles stored
	r0 = r
	u0 = u
	call strain
	s0 = s

	end subroutine initial_interface_2








!	***************************************************************
!	*************array inverse****************

	subroutine array_inv(z,zi)
	use mod_param
	implicit none

	integer::i
	real*8 :: z(0:n),zi(0:n)

	do i=0,n

	zi(n-i) = z(i)

	enddo

	end subroutine array_inv


!	***************************************************************
!	*************SQUARE PULSE****************

	subroutine initial_square_with_BG
	use mod_param
	implicit none

	integer::i
	real*8:: center,width,slope,p1,p2,amp
	center = n*dx/2.d0
	width = 20*dx
	slope = 1.d-1
	amp = 10.d0

	p1= center - (width/2.d0)
	p2= center + (width/2.d0)
!	--------------------------- the symmetric pulse
	do i=0,n
      	r(i)= amp*(dtanh((i*dx-p1)/slope) + dtanh((-i*dx+p2)/slope))
	u(i)= 0.d0*amp*(dtanh(i*dx-p1) + dtanh(-i*dx+p2))
      	enddo
!	----------------------------the back ground
	do i=0,(n/10)	
	r(i)= r(i)+(amp/10.2)*dtanh((-i*dx+p2)/slope)	!------BG on the right
      	enddo

	do i=n-(n/10),n
      	r(i)= r(i)+(amp/10.1)*dtanh((i*dx-p1)/slope)		!------BG on the left
      	enddo


!	----------------------------initial profiles stored
	r0 = r
	u0 = u
	call strain2
	s0 = s

	end subroutine initial_square_with_BG



!	***************************************************************

	subroutine initial_skew
	use mod_param
	implicit none

	integer:: i
	real*8 :: x(0:n),f1(0:n),f2(0:n)
	real*8:: blah, center, pi, sig, beta, amp, del

	center = (n/2.d0)*dx
	pi = acos(-1.d0)
	sig = 0.2d0
	beta = skewn/(sig*sqrt(2.0));
	amp = 10.d0
	
	
	do i=0,n
      	x(i) = i*dx
	f1(i) = 0.5*( 1.0 + erf(beta*(x(i)-center)) )
	f2(i) = amp*(1/sqrt(pi*2.0*sig*sig))*exp(-(x(i)-center)*(x(i)-center)/(2.0*sig*sig))

	r(i) = f1(i)*f2(i)
	u(i) = 0.d0
     	enddo


!	----------------------------initial profiles stored
	r0 = r
	u0 = u
	call deriv_fd(u,s)
	s0 = s

!	---------------------------- write skewness value

	del = skewn/sqrt(1.d0+skewn*skewn)
	skewness = 0.5d0*(4-pi)*(sqrt(2/pi)*del)**3.0/((1.d0-(2.d0*del*del/pi))*sqrt(1.d0-(2.d0*del*del/pi)))


	end subroutine initial_skew














