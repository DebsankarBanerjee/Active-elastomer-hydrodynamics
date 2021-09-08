	module mod_param
      	implicit none
      	save

	integer,parameter :: n=60

	real*8,parameter :: time = 50.d0, tmin = 40.d0	
      	real*8,parameter :: dx=0.05d0 ,dt=1.d-4/4
      	real*8,parameter :: B1=0.1d0, B2=0.1d0	
      	real*8,parameter :: alpha=3.d0	
!	---------------------------------------------------
      	real*8,parameter :: xi1=1.d0			
      	real*8,parameter :: xi3=0.1d0			
      	real*8,parameter :: xi6=0.01d0			

	real*8,parameter :: zeta1=0.5d0	,zeta2=0.1d0
      	real*8,parameter :: zeta3=0.1d0
!	---------------------------------------------------
	real*8,parameter :: kb= 1.d0, ku0=0.2d0	 		
	real*8,parameter :: e=1.d-6
	real*8,parameter :: c=1.d-1
	real*8,parameter :: D=0.1d0			
	real*8,parameter :: skewn = 0.5d0
	real*8,parameter :: code_eps = 1.d-5

	real*8 :: mu, B
	
        integer,parameter :: nt= int(time/dt)
	integer*8,parameter :: m=500
     
      	real*8::u(0:n),du(0:n),v(0:n)
      	real*8::r(0:n),dr(0:n),d1r(0:n)
      	real*8::s(0:n),sigma(0:n),Fe(0:n)
	real*8::u0(0:n),r0(0:n),s0(0:n)
      	real*8::act(0:n),ku(0:n)
      	real*8::dsig(0:n),dact(0:n)
      	real*8::jc(0:n),djc(0:n)
	real*8:: v_int(0:n), s_int(0:n)
	real*8:: De(0:n),sr(0:n)

	real*8 :: skewness
	real*8 :: Ke
	real*8::tvu,tvr
	real*8 :: limiter,r_plus,r_mins
	real*8 :: j_plus,j_mins,aflux(0:n),dflux(0:n)

	real*8::cor_r(0:n/2),cor_s(0:n/2)

      	real*8::Ba,B1a,B2a

	integer :: imax, flag

      	end module mod_param
