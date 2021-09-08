	subroutine info
	use mod_param
	implicit none

!	------------------------------------------------------------
!		Information about the code			   |
!	------------------------------------------------------------
	write(300,*) '----information about the problem being solved----'
	write(300,*) '--------------------------------------------------'
	write(300,*) 'Initial condition for density: one blob in the system'
	write(300,*) 'Initial condition for displacement field: one blob in the system'
	write(300,*) 'Boundary condition for density: PBC'
	write(300,*) 'Boundary condition for displacement: PBC'


	write(300,*) '----information about the parameters and methods used----'
	write(300,*) '---------------------------------------------------------'
	write(300,*) 'time integration : Runge Kutta (TVD scheme)'
	write(300,*) 'finite volume discretisation with flux limiting'
	write(300,*) 'displacement field eq: with nonlinear form of elastic and '
	write(300,*) 'active stress'
	write(300,*) 'myosin minifilament density eq: with full advection and '
	write(300,*) 'strain dependent binding and unbinding '
	write(300,*) '-------------------------------------------------'
	write(300,*) '-------------------------------------------------'
	write(300,*)'system size   >>',n
	write(300,*)'Total time    >>',time
	write(300,*)'dx            >>',dx  
	write(300,*)'dt            >>',dt
	write(300,*)'nt            >>',nt
	write(300,*)'m             >>',m

	write(300,*) '-------------------------------------------------'
	write(300,*) '-------------------------------------------------'

	write(300,*)'Bulk Modulus  >>',B
	write(300,*)'B1            >>',B1
	write(300,*)'B2            >>',B2

	write(300,*) '-------------------------------------------------'
	write(300,*) '-------------------------------------------------'

	write(300,*)'Activity      >>',mu

	write(300,*) '-------------------------------------------------'
	write(300,*) '-------------------------------------------------'

	write(300,*)'alpha         >>',alpha
	write(300,*) '-------------------------------------------------'
	write(300,*) '-------------------------------------------------'

	write(300,*)'Binding rate      >>',kb
	write(300,*)'Bare unbinding rate      >>',ku0
	write(300,*)'kb*(1-c*s), c value >>',c

	write(300,*) '-------------------------------------------------'
	write(300,*) '-------------------------------------------------'

	write(300,*)'diffusion co-efficient,D         >>',D

	write(300,*) '-------------------------------------------------'
	write(300,*) '-------------------------------------------------'

	write(300,*)'bulk modulus renormalized Ba,B1a,B2a      >>',Ba,B1a,B2a

	write(300,*) '-------------------------------------------------'
	write(300,*) '-------------------------------------------------'

	write(300,*)'xi values xi1,xi3,xi6      >>',xi1,xi3,xi6
	!write(300,*)'xi values xi2,xi4,xi5      >>',xi2,xi4,xi5
	write(300,*)'zeta1, zeta2, zeta3        >>',zeta1, zeta2, zeta3

	write(300,*) '-------------------------------------------------'
	write(300,*) '-------------------------------------------------'

	write(300,*)'skewness value            >>', skewness

	write(300,*) '-------------------------------------------------'
	write(300,*) '-------------------------------------------------'


	write(301,*)n,dx,m,dt
	write(302,*)mu, B, ku0, kb, alpha, c, D, xi1, xi3, xi6, zeta1, zeta2, zeta3

	end subroutine info
