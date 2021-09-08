      	subroutine sigma_active
      	use mod_param
      	implicit none

      	integer::i

!        act=mu*((xi2*r)+(xi4*s*r)-(xi5*r*r))
         act = zeta1*mu*(r/(1.d0+zeta2*r)) + mu*zeta3*s*r 
      
      	end subroutine sigma_active
