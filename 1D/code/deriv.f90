	subroutine deriv(z,dz)
      	use mod_param
	implicit none

	real*8::z(0:n),dz(0:n)
	integer::i

      	do i=1,n-1
	dz(i)=(z(i+1)-z(i-1))/(2.d0*dx)
	enddo
	
	call deriv_PBC(z,dz(0),dz(n))

!   	dz(0)=(-z(2)+4.d0*z(1)-3.d0*z(0))/(2.d0*dx)
!     	dz(n)=(z(n-2)-4.d0*z(n-1)+3.d0*z(n))/(2.d0*dx)    

	end subroutine deriv




	subroutine deriv_fd(z,dz)
      	use mod_param
	implicit none

	real*8::z(0:n),dz(0:n)
	integer::i

      	do i=0,n-2
	dz(i)=(-3.d0*z(i)+4.d0*z(i+1)-z(i+2))/(2.d0*dx)
	enddo
	

   	dz(n-1)=(-3.d0*z(n-1)+4.d0*z(n)-z(0))/(2.d0*dx)
     	dz(n)=(-3.d0*z(n)+4.d0*z(0)-z(1))/(2.d0*dx)

	end subroutine deriv_fd


	subroutine deriv5p(z,dz)
      	use mod_param
      	implicit none

      	real*8::z(0:n),dz(0:n)
	integer::i


      	do i=2,n-2

      	dz(i)=(-z(i+2)+8.d0*z(i+1)-8.d0*z(i-1)+z(i-2))/(12.d0*dx)

      	enddo

	dz(0)=(-z(2)+8.d0*z(1)-8.d0*z(n)+z(n-1))/(12.d0*dx)
	dz(1)=(-z(3)+8.d0*z(2)-8.d0*z(0)+z(n))/(12.d0*dx)

	dz(n-1)=(-z(0)+8.d0*z(n)-8.d0*z(n-2)+z(n-3))/(12.d0*dx)
	dz(n)=(-z(1)+8.d0*z(0)-8.d0*z(n-1)+z(n-2))/(12.d0*dx)

      	end subroutine deriv5p


	
	subroutine deriv7p(z,dz)
      	use mod_param
      	implicit none

      	real*8::z(0:n),dz(0:n)
	integer::i


      	do i=3,n-3

      	dz(i)=(z(i+3)-9.d0*z(i+2)+45.d0*z(i+1)-45.d0*z(i-1)+9.d0*z(i-2)-z(i-3))/(60.d0*dx)

      	enddo

	dz(0)=(z(3)-9.d0*z(2)+45.d0*z(1)-45.d0*z(n)+9.d0*z(n-1)-z(n-2))/(60.d0*dx)
	dz(1)=(z(4)-9.d0*z(3)+45.d0*z(2)-45.d0*z(0)+9.d0*z(n)-z(n-1))/(60.d0*dx)
	dz(2)=(z(5)-9.d0*z(4)+45.d0*z(3)-45.d0*z(1)+9.d0*z(0)-z(n))/(60.d0*dx)

	dz(n-2)=(z(0)-9.d0*z(n)+45.d0*z(n-1)-45.d0*z(n-3)+9.d0*z(n-4)-z(n-5))/(60.d0*dx)
	dz(n-1)=(z(1)-9.d0*z(0)+45.d0*z(n)-45.d0*z(n-2)+9.d0*z(n-3)-z(n-4))/(60.d0*dx)
	dz(n)=(z(2)-9.d0*z(1)+45.d0*z(0)-45.d0*z(n-1)+9.d0*z(n-2)-z(n-3))/(60.d0*dx)

      	end subroutine deriv7p







