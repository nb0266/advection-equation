program exact_solusion 
    implicit none
  integer, parameter :: nx = 100 ! 空間の分割数
!  integer, parameter :: nt = 200 ! 時間ステップ数
  real*8, parameter :: dx = 0.01d0
  real*8, parameter :: dt = 0.005d0
  real*8, parameter :: alpha = 0.001d0
  real*8, dimension(0:nx) :: u ! 解の配列
  !real*8, dimension(0:nx) :: u_new ! 解の配列
  integer :: i ! インデックス用変数
  real*8 :: k,x,t
  real*8, parameter ::pi=3.14159265358979323846
  character(len=5) ::ch5

  k=alpha
!t=100ステップ
  t=100*dt
  write(*,*) "k,t=",k,t,(1.d0/(2.d0*sqrt(pi*k*t))),(4.d0*k*t)
  do i=0,nx 
  x=i*dx
  !u(i)=(1.d0/(2.d0*(pi*k*t)**1.d0/2.d0))*2.71828182846**(-i**2/(4*k*t))
  u(i)=(1.d0/(2.d0*sqrt(pi*k*t)))*exp(-(x-0.5d0)**2/(4.d0*k*t))
  end do
  
  write(ch5, '(i5.5)') 100
  open(5,file="./exact_"//ch5//".txt", status="replace")
  do i=0,nx
  write(5,*) i*dx, u(i)
  end do

end program exact_solusion
