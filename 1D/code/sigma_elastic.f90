	subroutine sigma_elastic
	use mod_param
	implicit none

	integer::i

	Ba=B-(xi1*mu)
	B1a=B1+(xi3*mu)
	B2a=B2+(xi6*mu)

	sigma=Ba*s+B1a*s*s+B2a*s*s*s

	!De = Ba + 2.d0*B1a*s + 3.d0*B2a*s*s
	

	end subroutine sigma_elastic

