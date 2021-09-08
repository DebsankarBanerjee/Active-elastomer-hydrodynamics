	subroutine free_energy
	use mod_param	
	implicit none
!	calculate the free energy value for a particular strain
!	value. determine where every part of the system is in the
!	free-energy minimum. 	
	
	

	Fe = (Ba/2.0)*s*s+(B1a/3.0)*s*s*s+(B2a/4.0)*s*s*s*s

	

	end subroutine free_energy
        
!	------------------------------------------------------------------
!	------------------------------------------------------------------
	subroutine pulse_velo(j)
	use mod_param	
	implicit none

	integer :: i,j
	real*8 :: tt,xx

	open(1001,file='../data/pulse_velo.txt')

	do i=0,n
	if(maxval(r).eq.r(i).and.imax.ne.i) then
	tt = j*dt
	xx = i*dx
	imax = i
	write(1001,*) tt,xx
	endif
	enddo

	end subroutine pulse_velo


!	------------------------------------------------------------------
!	------------------------------------------------------------------
	subroutine switch(j,stoptime)
	use mod_param	
	implicit none

	integer :: j
	real*8 :: stoptime

	if(j*dt.gt.stoptime) then
	flag=0
	endif

	write(401,*) j*dt,flag, stoptime


	end subroutine switch


	

!	------------------------------------------------------------------
!	------------------------------------------------------------------
	subroutine pulse_width
	use mod_param	
	implicit none

	integer :: j, pcount, jl, jr
	real*8 :: value, width, slope, lcor,rcor, del_y

	value = 5.d0
	pcount = 0

	do j = 0,n
	if (r(j).ge.value) then
	pcount = pcount + 1
	endif
	enddo


	do j=0,n-1
	if (r(j).le.value.and.r(j+1).ge.value)then
	jl = j
	endif
	enddo

	do j=1,n
	if (r(j).le.value.and.r(j-1).ge.value)then
	jr = j
	endif
	enddo
!	Boundary terms
	if (r(n).le.value.and.r(0).ge.value)then
	jl = n
	endif
	if (r(0).le.value.and.r(n).ge.value)then
	jr = 0
	endif

	!write(401,*) jl,jr

	if(jl.eq.n) then
	slope = (r(0)-r(jl))/dx
	del_y = r(0) - value
	lcor = del_y / slope
	else
	slope = (r(jl+1)-r(jl))/dx
	del_y = r(jl+1) - value
	lcor = del_y / slope
	endif

	if(jr.eq.0)then
	slope = (r(n)-r(jr))/dx
	del_y = r(n) - value
	rcor = del_y / slope
	else
	slope = (r(jr-1)-r(jr))/dx
	del_y = r(jr-1) - value
	rcor = del_y / slope
	endif


	
	width = (pcount-1)*dx + lcor + rcor

	write(401,*) width


	end subroutine pulse_width


	

!-------------------------------------------------------------------
!		kinetic energy 		
!-------------------------------------------------------------------

	subroutine kinetic_energy
	use mod_param	
	implicit none
!	calculate the free energy value for a particular strain
!	value. determine where every part of the system is in the
!	free-energy minimum. 	

	integer :: kk
	real*8 :: ke_sum

	ke_sum = 0.d0
	
	do kk=0,n
	ke_sum = ke_sum + v(kk)*v(kk)
	enddo

	Ke = ke_sum
	

	end subroutine kinetic_energy

























