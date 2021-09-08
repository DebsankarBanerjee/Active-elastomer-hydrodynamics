      	subroutine strain
      	use mod_param
      	implicit none

      	integer::i

      	do i=1,n-1

      	s(i)=(u(i+1)-u(i-1))/(2.d0*dx)

      	enddo

	call strain_PBC

      	end subroutine strain







	subroutine strain2
      	use mod_param
      	implicit none

      	integer::i

      	do i=2,n-2

      	s(i)=(-u(i+2)+8.d0*u(i+1)-8.d0*u(i-1)+u(i-2))/(12.d0*dx)

      	enddo

	s(0)=(-u(2)+8.d0*u(1)-8.d0*u(n)+u(n-1))/(12.d0*dx)
	s(1)=(-u(3)+8.d0*u(2)-8.d0*u(0)+u(n))/(12.d0*dx)

	s(n-1)=(-u(0)+8.d0*u(n)-8.d0*u(n-2)+u(n-3))/(12.d0*dx)
	s(n)=(-u(1)+8.d0*u(0)-8.d0*u(n-1)+u(n-2))/(12.d0*dx)

      	end subroutine strain2




	subroutine strainFD
      	use mod_param
      	implicit none

      	integer::i

      	do i=0,n-1

      	s(i)=(u(i+1)-u(i))/dx

      	enddo

	s(n)=(u(0)-u(n))/dx

      	end subroutine strainFD
