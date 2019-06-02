program main
    use, intrinsic :: iso_c_binding
    implicit none
    include "fftw3.f03"
    
    integer, parameter :: n = 1024
    real(kind = 16), parameter :: pi = 4 * atan(1.0_16)
    integer :: i

    real(c_double), allocatable :: input(:)
    complex(c_double_complex), allocatable :: output(:)

    type(c_ptr) :: plan_f
    
    real(kind = 16) :: t = 0.0
    real(kind = 16) :: dt = 1 / real(n - 1)
    real(kind = 16) :: v

    open(unit = 1, file = '../res/signals_time')
    open(unit = 2, file = '../res/signals_freq')

    allocate(input(n))
    allocate(output((n / 2) + 1))

    do i= 1, n
        t = t + dt
        input(i) = sin(2 * pi * t * 200) + 2 * sin(2 * pi * t * 400)
        write(1,*) t, " ", input(i)
    end do
    close(1)

    plan_f = fftw_plan_dft_r2c_1d(size(input), input, output, FFTW_ESTIMATE + FFTW_UNALIGNED)

    call fftw_execute_dft_r2c(plan_f, input, output)

    do i = 1, size(output)
        v = abs(output(i))
        write(2, *) i, v
    end do
    close(2)

    call fftw_destroy_plan(plan_f)

    deallocate(input)
    deallocate(output)
end program main