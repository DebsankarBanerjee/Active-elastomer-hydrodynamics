!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!      
!!                                                                   !!
!!                   PROGRAM PULSATION AND FLOW                      !!
!!                    THE MAXIMAL MODEL                              !!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! This code call for the calculation of the RHS of the displacement(u) and density(r)
! by calling 'rhs.f90' then time integrate the variables using tvd_rk3 method with 
! time step dt. This code does all the file writings inside the loop and the final 
! profiles at the end of the time-loop.

      	program code
      	use mod_param
     	implicit none

      	integer::i,j

!	-------------------------------------------------------------
!	reading parameter for code				    |
!	-------------------------------------------------------------
	read(*,*)B,mu
	write(*,*) B,mu



!	--------------------------------------------------------------
!		opening	files 					     |
!	--------------------------------------------------------------

	!open(100,file='../data/displacement.txt')
	open(101,file='../data/density.txt')
	open(102,file='../data/strain.txt')
	!open(103,file='../data/stress.txt')
	!open(104,file='../data/velocity.txt')
	!open(105,file='../data/source.txt')
	!open(106,file='../data/correlation.txt')

	open(200,file='../data/time_evolution.txt')
	open(201,file='../data/data_u.txt')
	open(202,file='../data/data_r.txt')
	open(203,file='../data/data_s.txt')
	open(204,file='../data/corr_r_s.txt')
	open(205,file='../data/data_stress.txt')
	open(206,file='../data/data_force.txt')

	open(300,file='../data/info.txt')
	open(301,file='../data/mat_param.txt')
	open(302,file='../data/mat_param2.txt')

	open(400,file='../data/cfl.txt')
	open(401,file='../data/width.txt')
	!open(402,file='../data/peclet.txt')



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!                                                                   !!
!!                         INITIALISATION                            !!
!!                                                                   !!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

      	call initial_rand			!initial_square
	flag = 1
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

      	do j=0,nt	!------------------------------time loop starts

      	call tvd_rk3

!	----------------------------------------------------------------
!	writing data in m time intervals to see time evolution of various 
!	quantity.
!	----------------------------------------------------------------
      	if(mod(j,m).eq.0.and.j*dt.ge.tmin) then
	
	!call correlation(r,cor_r)
	!call correlation(s,cor_s)


!	tvu = 0.d0
!	tvr = 0.d0
!	do i=0,n-1
!	tvu = tvu + abs(u(i+1)-u(i))
!	tvr = tvr + abs(r(i+1)-r(i))
!	enddo

!	call pulse_width
	call kinetic_energy

      	write(200,*)j*dt, sum(r)/(n+1), sum(u)/(n+1), r(n/2), u(n/2)
	write(400,*)j*dt, (maxval(du)*dt)/dx, Ke				!, tvr, tvu, minval(De), 2.d0*maxval(De)*dt/(dx*dx)
!	write(401,*)j*dt, s(n/2), s(n/4)
!	write(402,*)j*dt, (n*dx*maxval(v))/D
	
!	call free_energy


	do i=0,n
!	write(100,*) j*dt, i*dx, u(i)
	write(101,*) j*dt, i*dx, r(i), u(i)	!,-aflux(i),-dflux(i)		!,-dx*djc(i)	!, De(i)		
	write(102,*) j*dt, i*dx, s(i)		!, Fe(i)
!	write(103,*) j*dt, i*dx, sigma(i),act(i), sigma(i)+act(i)
!	write(104,*) j*dt, i*dx, v(i),dsig(i),dact(i)
!	write(105,*) j*dt, i*dx, kb*(1.d0-c*s(i)),ku(i)*r(i)
	enddo

!	do i=0,n/2
!	write(106,*) j*dt, i*dx, cor_r(i), cor_s(i)
!	enddo

!	write(100,*) ""
	write(101,*) ""
	write(102,*) ""
!	write(103,*) ""
!	write(104,*) ""
!	write(105,*) ""
!	write(106,*) ""

      	endif      
!	-----------------------------------------------------------------

!	call switch(j,101.d0)		! to change parameter in a running code
					! the changes will be made in the stress
					! or source file.
!	write(401,*) j*dt,flag

      	enddo		!--------------------------------- time loop ends

	
!	-----------------------------------------------------------------
!	writing final spatial profiles of variables
!	-----------------------------------------------------------------
	do i=0,n
	write(201,*) i*dx,u0(i),u(i)
	write(202,*) i*dx,r0(i),r(i)
	write(203,*) i*dx,s0(i),s(i)
	write(205,*) i*dx,sigma(i),act(i)
	write(206,*) i*dx,dsig(i),dact(i)
!	write(401,*) r(i), kb*(1.d0-c*s(i)), ku(i)*r(i), djc(i)
	enddo

	do i=0,n/2
	write(204,*) i*dx,cor_r(i),cor_s(i)
	enddo

	write(*,*) 'dx/dt =', dx/dt

	call info

      	end program 
