program main
    use, intrinsic :: iso_c_binding
    implicit none
    include "fftw3.f03"
  
    integer, parameter :: n = 1024
    real(kind = 16), parameter :: pi = 4 * atan(1.0_16)
  
    real(c_double), allocatable :: input(:)
    complex(c_double_complex), allocatable :: output(:)
  
    type(c_ptr) :: plan_1, plan_2
  
    real(kind = 16) :: t = 0.0
    real(kind = 16) :: dt = 1 / real(n - 1)
    real(kind = 16) :: random
    integer :: i

    open(unit = 1, file = '../res/cosinus')                 ! czysty cosinus
    open(unit = 2, file = '../res/cosinus_noise')           ! cosinus z szumami
    open(unit = 3, file = '../res/cosinus_fft')             ! cosinus fft z szumami
    open(unit = 4, file = '../res/cosinus_fft_fixed')       ! cosinus fft oczyszczony
    open(unit = 5, file = '../res/cosinus_reduced_noise')   ! odwrotna transformata

    allocate(input(n))
    allocate(output((n/2) + 1))
  
    do i = 1, n
        t = t + dt
        write(1, *) t, " ", cos(2 * pi * t * 4)
        call random_number(random)
        input(i) = cos(2 * pi * t * 4) + (random * 2 - 1) * 0.25
        write(2, *) t, " ", input(i)
    end do
    close(1)
    close(2)
  
    plan_1 = fftw_plan_dft_r2c_1d(size(input), input, output, FFTW_ESTIMATE + FFTW_UNALIGNED)
    plan_2 = fftw_plan_dft_c2r_1d(size(input), output, input, FFTW_ESTIMATE + FFTW_UNALIGNED)

    call fftw_execute_dft_r2c(plan_1, input, output)
  
    do i = 1, size(output)
        write(3, *) i, abs(output(i))
    end do
    close(3)
  
    do i = 1, size(output)
        if(abs(output(i)) < 50) then
            output(i) = (0.0, 0.0)
        endif
        write(4, *) i, abs(output(i))
    end do
    close(4)

    call fftw_execute_dft_c2r(plan_2, output, input)
    t = 0.0
  
    do i = 1, size(input)
        t = t + dt
        write(5, *) t, input(i) / size(input)
    end do
    close(5)

    call fftw_destroy_plan(plan_1) 
    call fftw_destroy_plan(plan_2)
  
    deallocate(input)
    deallocate(output)
end program
