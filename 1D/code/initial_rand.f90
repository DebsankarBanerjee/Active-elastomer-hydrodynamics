	subroutine initial_rand
	use mod_param
	implicit none

	integer::i

	do i=-1,n+1
!      	call random_number(u(i))
      	u(i)= 0.01*(rand()-0.5d0)
      	enddo

      	do i=0,n
 !     	call random_number(r(i))
      	r(i) = 0.01*(rand() + 10.d0)
     	enddo

!	----------------------------initial profiles stored
	r0 = r
	do i=0,n
	u0(i) = u(i)
	enddo
	call strain
	s0 = s

	end subroutine initial_rand
