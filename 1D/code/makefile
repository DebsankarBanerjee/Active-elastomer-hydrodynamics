compile = gfortran
#
obj_main=code.o rhs.o deriv.o strain.o \
sigma_active.o sigma_elastic.o source.o \
initial.o pbc.o info.o free_energy.o \
flux.o limiter.o correlation.o fw.o rk.o

obj_parameter=mod_param.o
#
result.exe:$(obj_main) $(obj_parameter)
	$(compile) -O3 $(obj_main) $(obj_parameter) -o result.exe -lm
####
code.o:code.f90 $(obj_parameter)
	$(compile) -c -O3 code.f90 $(obj_parameter)
rhs.o:rhs.f90 $(obj_parameter)
	$(compile) -c -O3 rhs.f90 $(obj_parameter)
deriv.o:deriv.f90 $(obj_parameter)
	$(compile) -c -O3 deriv.f90 $(obj_parameter)
pbc.o:pbc.f90 $(obj_parameter)
	$(compile) -c -O3 pbc.f90 $(obj_parameter)
strain.o:strain.f90 $(obj_parameter)
	$(compile) -c -O3 strain.f90 $(obj_parameter)
sigma_active.o:sigma_active.f90 $(obj_parameter)
	$(compile) -c -O3 sigma_active.f90 $(obj_parameter)
sigma_elastic.o:sigma_elastic.f90 $(obj_parameter)
	$(compile) -c -O3 sigma_elastic.f90 $(obj_parameter)
source.o:source.f90 $(obj_parameter)
	$(compile) -c -O3 source.f90 $(obj_parameter)
flux.o:flux.f90 $(obj_parameter)
	$(compile) -c -O3 flux.f90 $(obj_parameter)
limiter.o:limiter.f90 $(obj_parameter)
	$(compile) -c -O3 limiter.f90 $(obj_parameter)
#
initial.o:initial.f90 $(obj_parameter)
	$(compile) -c -O3 initial.f90 $(obj_parameter)
#
info.o:info.f90 $(obj_parameter)
	$(compile) -c -O3 info.f90 $(obj_parameter)

correlation.o:correlation.f90 $(obj_parameter)
	$(compile) -c -O3 correlation.f90 $(obj_parameter)

free_energy.o:free_energy.f90 $(obj_parameter)
	$(compile) -c -O3 free_energy.f90 $(obj_parameter)
fw.o:fw.f90 $(obj_parameter)
	$(compile) -c -O3 fw.f90 $(obj_parameter)
rk.o:rk.f90 $(obj_parameter)
	$(compile) -c -O3 rk.f90 $(obj_parameter)
#
mod_param.o:mod_param.f90
	$(compile) -c -O3 mod_param.f90
#
clean:
	rm -f *.o *.mod *.MOD
