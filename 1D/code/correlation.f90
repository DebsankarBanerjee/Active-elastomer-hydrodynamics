!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!     Program to claculate the correlation of a data series

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!     x=variable whose correlation is being calculated
!     m=range of the correlation
!     correlation=corretion function

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	subroutine correlation(x,corr) 
	use mod_param
	implicit none

      	real*8::x(0:n),corr(0:n/2)
      	integer::i,j,p
      	real*8::avx
	avx = 0.d0	
	corr = 0.d0
      	
      	p=n/2
      	avx = sum(x)/(n+1)
	
      	do i=0,p
      	do j=0,n-i
      	corr(i)=corr(i)+ ((x(j)*x(j+i))/float(n-i+1))
      	enddo
      	corr(i)=corr(i)-(avx*avx)
      	enddo

	corr = corr / corr(0)
	
      	end subroutine correlation 
