program advection
    implicit none
   !宣言
   integer , parameter :: nx=100 ! grid 
   real*8 , parameter :: L=3.d0 ! length 
   real*8 , parameter :: dt=0.001d0 ! time step 
   real*8 , parameter :: dx=L/real(nx-1) !notch 
   real*8 , parameter :: v=1.d0 ! advection velocity
   real*8 ,parameter :: d=0.01d0 !diffusion coefficient 
   character(len=5) :: ch5
 !変数
  real*8 ,dimension(nx):: u,u_new 
  integer :: i,t
  real*8 ::x

 !初期設定
 do i=1,nx
   x=real(i-1)*dx
  u(i)=exp(-((x-L/2)**2)/(2*0.1**2))
  end do

 !time step
 do t=1,1000
  !移流項
  do i=2,nx-1
  u_new(i)=u(i)-v*(dt/dx)*(u(i)-u(i-1))
  end do
  u(i)=u_new(i)

 !拡散項
 do i=2,nx-1
 u_new(i)=u_new(i)+d*dt*((u(i+1)-2*u(i)+u(i-1))/dx**2)
 end do

u_new(1)=u_new(nx)

u=u_new

  if(mod(t,5) == 0) then
      write(ch5, '(i5.5)') t
      open(5, file="output"//ch5//".txt", status="replace")
      do i = 0, nx
         write(5,*) i*dx, u(i)
      end do
  end if
  end do
  end program advection
