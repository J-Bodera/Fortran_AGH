program main
	use naivemath
	use bettermath
	use dotmath

	implicit none

	character(len = :), allocatable :: path
	path = '../res'
	print *, "kind 4"
	print *, test_kind4(path)
	print *, "kind 8"
	print *, test_kind8(path)
	print *, "kind 16"
	print *, test_kind16(path)

	! call random_seed()
	
	contains

	function test_kind4(path) result (n)
		implicit none
		character(len = :), intent(in), allocatable :: path
		real(kind = 4), allocatable, dimension(:, :) :: A, B, C
		real :: clk_start, clk_stop, native_time, better_time, dotmull_time, matmul_time
		integer :: n, i
		n = 5

		open(unit = 1, file = path // '/naive_kind4.dat')
		open(unit = 2, file = path // '/better_kind4.dat')
		open(unit = 3, file = path // '/dotmull_kind4.dat')
		open(unit = 4, file = path // '/matmull_kind4.dat')

		write (*,*) '          N', '         naive', '           better', '           dotmull' , '           matmull'
		do i = 1, 8
			n = 2 * n

			call random_seed()
			
			allocate(A(n, n))
			allocate(B(n, n))
			allocate(C(n, n))

			call random_number(A)
			call random_number(B)

			call CPU_TIME(clk_start)
			C = naive(A, B)
			call CPU_TIME(clk_stop)
			native_time = clk_stop-clk_start
			write(1,*) n, native_time

			call CPU_TIME(clk_start)
			C = better(A, B)
			call CPU_TIME(clk_stop)
			better_time = clk_stop-clk_start
			write(2,*) n, better_time

			call CPU_TIME(clk_start)
			C = dotmull(A, B)
			call CPU_TIME(clk_stop)
			dotmull_time = clk_stop-clk_start
			write(3,*) n, dotmull_time

			call CPU_TIME(clk_start)
			C = matmul(A, B)
			call CPU_TIME(clk_stop)
			matmul_time = clk_stop-clk_start
			write(4,*) n, matmul_time

			write (*,*) n, native_time, better_time, dotmull_time, matmul_time
			deallocate(A)
			deallocate(B)
			deallocate(C)
		end do

		close(1)
		close(2)
		close(3)
		close(4)

	end function test_kind4

	function test_kind8(path) result (n)
		implicit none
		character(len = :), intent(in), allocatable :: path
		real(kind = 8), allocatable, dimension(:, :) :: A, B, C
		real :: clk_start, clk_stop, native_time, better_time, dotmull_time, matmul_time
		integer :: n, i
		n = 5

		open(unit = 1, file = path // '/naive_kind8.dat')
		open(unit = 2, file = path // '/better_kind8.dat')
		open(unit = 3, file = path // '/dotmull_kind8.dat')
		open(unit = 4, file = path // '/matmull_kind8.dat')

		write (*,*) '          N', '         naive', '           better', '           dotmull' , '           matmull'
		do i = 1, 8
			n = 2 * n
			
			call random_seed()

			allocate(A(n, n))
			allocate(B(n, n))
			allocate(C(n, n))

			call random_number(A)
			call random_number(B)

			call CPU_TIME(clk_start)
			C = naive(A, B)
			call CPU_TIME(clk_stop)
			native_time = clk_stop-clk_start
			write(1,*) n, native_time

			call CPU_TIME(clk_start)
			C = better(A, B)
			call CPU_TIME(clk_stop)
			better_time = clk_stop-clk_start
			write(2,*) n, better_time

			call CPU_TIME(clk_start)
			C = dotmull(A, B)
			call CPU_TIME(clk_stop)
			dotmull_time = clk_stop-clk_start
			write(3,*) n, dotmull_time

			call CPU_TIME(clk_start)
			C = matmul(A, B)
			call CPU_TIME(clk_stop)
			matmul_time = clk_stop-clk_start
			write(4,*) n, matmul_time

			write (*,*) n, native_time, better_time, dotmull_time, matmul_time
			deallocate(A)
			deallocate(B)
			deallocate(C)
		end do
		
		close(1)
		close(2)
		close(3)
		close(4)

	end function test_kind8

	function test_kind16(path) result (n)
		implicit none
		character(len = :), intent(in), allocatable :: path
		real(kind = 16), allocatable, dimension(:, :) :: A, B, C
		real :: clk_start, clk_stop, native_time, better_time, dotmull_time, matmul_time
		integer :: n, i
		n = 5

		open(unit = 1, file = path // '/naive_kind16.dat')
		open(unit = 2, file = path // '/better_kind16.dat')
		open(unit = 3, file = path // '/dotmull_kind16.dat')
		open(unit = 4, file = path // '/matmull_kind16.dat')

		write (*,*) '          N', '         naive', '           better', '           dotmull' , '           matmull'
		do i = 1, 8
			n = 2 * n
			
			call random_seed()

			allocate(A(n, n))
			allocate(B(n, n))
			allocate(C(n, n))

			call random_number(A)
			call random_number(B)

			call CPU_TIME(clk_start)
			C = naive(A, B)
			call CPU_TIME(clk_stop)
			native_time = clk_stop-clk_start
			write(1,*) n, native_time

			call CPU_TIME(clk_start)
			C = better(A, B)
			call CPU_TIME(clk_stop)
			better_time = clk_stop-clk_start
			write(2,*) n, better_time

			call CPU_TIME(clk_start)
			C = dotmull(A, B)
			call CPU_TIME(clk_stop)
			dotmull_time = clk_stop-clk_start
			write(3,*) n, dotmull_time

			call CPU_TIME(clk_start)
			C = matmul(A, B)
			call CPU_TIME(clk_stop)
			matmul_time = clk_stop-clk_start
			write(4,*) n, matmul_time

			write (*,*) n, native_time, better_time, dotmull_time, matmul_time
			deallocate(A)
			deallocate(B)
			deallocate(C)
		end do
		
		close(1)
		close(2)
		close(3)
		close(4)

	end function test_kind16

end program main