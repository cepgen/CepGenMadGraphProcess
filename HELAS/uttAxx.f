      subroutine uttaxx(wt,wt1,gt,wt2)
c-------------------CP3  2009.10-----------------
c
c This subroutine computes an off-shell non-propagating tensor current from 
c the coupling of TTT
c
c input:
c       complex wt(18)           : input tensor                                                       t
c       complex wt1(18)         : input non-propagating tensor                          T
c       complex gt             : coupling constant         gt=-1/Lambda
c output:
c       complex wt2(18)         : non-propagating tensor current  

      implicit none
      double complex wt(18), wt1(18), gt, wt2(18)

      double complex T(6,4),T1(6,4),T2(6,4)
      double precision MT(4,4)
      integer i, j,s,d
      double complex cZero
      double precision rZero, rTwo
      parameter( rZero = 0.0d0, rTwo = 2.0d0 )
      parameter( cZero = ( 0.0d0, 0.0d0 ) )


      T(1,1) = wt(1)
      T(1,2) = wt(2)
      T(1,3) = wt(3)
      T(1,4) = wt(4)
      T(2,1) = wt(5)
      T(2,2) = wt(6)
      T(2,3) = wt(7)
      T(2,4) = wt(8)
      T(3,1) = wt(9)
      T(3,2) = wt(10)
      T(3,3) = wt(11)
      T(3,4) = wt(12)
      T(4,1) = wt(13)
      T(4,2) = wt(14)
      T(4,3) = wt(15)
      T(4,4) = wt(16)
      T(5,1) = wt(17)
      T(6,1) = wt(18)
 
      T1(1,1) = wt1(1)
      T1(1,2) = wt1(2)
      T1(1,3) = wt1(3)
      T1(1,4) = wt1(4)
      T1(2,1) = wt1(5)
      T1(2,2) = wt1(6)
      T1(2,3) = wt1(7)
      T1(2,4) = wt1(8)
      T1(3,1) = wt1(9)
      T1(3,2) = wt1(10)
      T1(3,3) = wt1(11)
      T1(3,4) = wt1(12)
      T1(4,1) = wt1(13)
      T1(4,2) = wt1(14)
      T1(4,3) = wt1(15)
      T1(4,4) = wt1(16)
      T1(5,1) = wt1(17)
      T1(6,1) = wt1(18)

      T2(5,1) = T(5,1)+T1(5,1)
      T2(6,1) = T(6,1)+T1(6,1)


      do i=1,4
         do j=1,4
            MT(i,j) = 0.0d0
         enddo 
      enddo
      MT(1,1) =  1.0d0
      MT(2,2) = -1.0d0
      MT(3,3) = -1.0d0
      MT(4,4) = -1.0d0
      
    
	
         do s=1,4
           do d=1,4
          T2(s,d)=MT(1,s)*MT(2,d)*T(1,1)*T1(1,2) - 
     -  MT(1,d)*MT(2,s)*T(1,1)*T1(1,2) + 
     -  MT(2,s)*MT(3,d)*T(1,3)*T1(1,2) - 
     -  MT(2,d)*MT(3,s)*T(1,3)*T1(1,2) + 
     -  MT(2,s)*MT(4,d)*T(1,4)*T1(1,2) - 
     -  MT(2,d)*MT(4,s)*T(1,4)*T1(1,2) - 
     -  MT(1,s)*MT(2,d)*T(2,2)*T1(1,2) + 
     -  MT(1,d)*MT(2,s)*T(2,2)*T1(1,2) - 
     -  MT(1,s)*MT(3,d)*T(2,3)*T1(1,2) + 
     -  MT(1,d)*MT(3,s)*T(2,3)*T1(1,2) - 
     -  MT(1,s)*MT(4,d)*T(2,4)*T1(1,2) + 
     -  MT(1,d)*MT(4,s)*T(2,4)*T1(1,2) + 
     -  MT(2,s)*MT(3,d)*T(3,1)*T1(1,2) - 
     -  MT(2,d)*MT(3,s)*T(3,1)*T1(1,2) - 
     -  MT(1,s)*MT(3,d)*T(3,2)*T1(1,2) + 
     -  MT(1,d)*MT(3,s)*T(3,2)*T1(1,2) + 
     -  MT(1,s)*MT(2,d)*T(3,3)*T1(1,2) - 
     -  MT(1,d)*MT(2,s)*T(3,3)*T1(1,2) + 
     -  MT(2,s)*MT(4,d)*T(4,1)*T1(1,2) - 
     -  MT(2,d)*MT(4,s)*T(4,1)*T1(1,2) - 
     -  MT(1,s)*MT(4,d)*T(4,2)*T1(1,2) + 
     -  MT(1,d)*MT(4,s)*T(4,2)*T1(1,2) + 
     -  MT(1,s)*MT(2,d)*T(4,4)*T1(1,2) - 
     -  MT(1,d)*MT(2,s)*T(4,4)*T1(1,2) + 
     -  MT(1,s)*MT(3,d)*T(1,1)*T1(1,3) - 
     -  MT(1,d)*MT(3,s)*T(1,1)*T1(1,3) - 
     -  MT(2,s)*MT(3,d)*T(1,2)*T1(1,3) + 
     -  MT(2,d)*MT(3,s)*T(1,2)*T1(1,3) + 
     -  MT(3,s)*MT(4,d)*T(1,4)*T1(1,3) - 
     -  MT(3,d)*MT(4,s)*T(1,4)*T1(1,3) - 
     -  MT(2,s)*MT(3,d)*T(2,1)*T1(1,3) + 
     -  MT(2,d)*MT(3,s)*T(2,1)*T1(1,3) + 
     -  MT(1,s)*MT(3,d)*T(2,2)*T1(1,3) - 
     -  MT(1,d)*MT(3,s)*T(2,2)*T1(1,3) - 
     -  MT(1,s)*MT(2,d)*T(2,3)*T1(1,3) + 
     -  MT(1,d)*MT(2,s)*T(2,3)*T1(1,3) - 
     -  MT(1,s)*MT(2,d)*T(3,2)*T1(1,3) + 
     -  MT(1,d)*MT(2,s)*T(3,2)*T1(1,3) - 
     -  MT(1,s)*MT(3,d)*T(3,3)*T1(1,3) + 
     -  MT(1,d)*MT(3,s)*T(3,3)*T1(1,3) - 
     -  MT(1,s)*MT(4,d)*T(3,4)*T1(1,3) + 
     -  MT(1,d)*MT(4,s)*T(3,4)*T1(1,3) + 
     -  MT(3,s)*MT(4,d)*T(4,1)*T1(1,3) - 
     -  MT(3,d)*MT(4,s)*T(4,1)*T1(1,3) - 
     -  MT(1,s)*MT(4,d)*T(4,3)*T1(1,3) + 
     -  MT(1,d)*MT(4,s)*T(4,3)*T1(1,3) + 
     -  MT(1,s)*MT(3,d)*T(4,4)*T1(1,3) - 
     -  MT(1,d)*MT(3,s)*T(4,4)*T1(1,3) + 
     -  MT(1,s)*MT(4,d)*T(1,1)*T1(1,4) - 
     -  MT(1,d)*MT(4,s)*T(1,1)*T1(1,4) - 
     -  MT(2,s)*MT(4,d)*T(1,2)*T1(1,4) + 
     -  MT(2,d)*MT(4,s)*T(1,2)*T1(1,4) - 
     -  MT(3,s)*MT(4,d)*T(1,3)*T1(1,4) + 
     -  MT(3,d)*MT(4,s)*T(1,3)*T1(1,4) - 
     -  MT(2,s)*MT(4,d)*T(2,1)*T1(1,4) + 
     -  MT(2,d)*MT(4,s)*T(2,1)*T1(1,4) + 
     -  MT(1,s)*MT(4,d)*T(2,2)*T1(1,4) - 
     -  MT(1,d)*MT(4,s)*T(2,2)*T1(1,4) - 
     -  MT(1,s)*MT(2,d)*T(2,4)*T1(1,4) + 
     -  MT(1,d)*MT(2,s)*T(2,4)*T1(1,4) - 
     -  MT(3,s)*MT(4,d)*T(3,1)*T1(1,4) + 
     -  MT(3,d)*MT(4,s)*T(3,1)*T1(1,4) + 
     -  MT(1,s)*MT(4,d)*T(3,3)*T1(1,4) - 
     -  MT(1,d)*MT(4,s)*T(3,3)*T1(1,4) - 
     -  MT(1,s)*MT(3,d)*T(3,4)*T1(1,4) + 
     -  MT(1,d)*MT(3,s)*T(3,4)*T1(1,4) - 
     -  MT(1,s)*MT(2,d)*T(4,2)*T1(1,4) + 
     -  MT(1,d)*MT(2,s)*T(4,2)*T1(1,4) - 
     -  MT(1,s)*MT(3,d)*T(4,3)*T1(1,4) + 
     -  MT(1,d)*MT(3,s)*T(4,3)*T1(1,4) - 
     -  MT(1,s)*MT(4,d)*T(4,4)*T1(1,4) + 
     -  MT(1,d)*MT(4,s)*T(4,4)*T1(1,4) - 
     -  MT(1,s)*MT(2,d)*T(1,1)*T1(2,1) + 
     -  MT(1,d)*MT(2,s)*T(1,1)*T1(2,1) - 
     -  MT(2,s)*MT(3,d)*T(1,3)*T1(2,1) + 
     -  MT(2,d)*MT(3,s)*T(1,3)*T1(2,1) - 
     -  MT(2,s)*MT(4,d)*T(1,4)*T1(2,1) + 
     -  MT(2,d)*MT(4,s)*T(1,4)*T1(2,1) + 
     -  MT(1,s)*MT(2,d)*T(2,2)*T1(2,1) - 
     -  MT(1,d)*MT(2,s)*T(2,2)*T1(2,1) + 
     -  MT(1,s)*MT(3,d)*T(2,3)*T1(2,1) - 
     -  MT(1,d)*MT(3,s)*T(2,3)*T1(2,1) + 
     -  MT(1,s)*MT(4,d)*T(2,4)*T1(2,1) - 
     -  MT(1,d)*MT(4,s)*T(2,4)*T1(2,1) - 
     -  MT(2,s)*MT(3,d)*T(3,1)*T1(2,1) + 
     -  MT(2,d)*MT(3,s)*T(3,1)*T1(2,1) + 
     -  MT(1,s)*MT(3,d)*T(3,2)*T1(2,1) - 
     -  MT(1,d)*MT(3,s)*T(3,2)*T1(2,1) - 
     -  MT(1,s)*MT(2,d)*T(3,3)*T1(2,1) + 
     -  MT(1,d)*MT(2,s)*T(3,3)*T1(2,1) - 
     -  MT(2,s)*MT(4,d)*T(4,1)*T1(2,1) + 
     -  MT(2,d)*MT(4,s)*T(4,1)*T1(2,1) + 
     -  MT(1,s)*MT(4,d)*T(4,2)*T1(2,1) - 
     -  MT(1,d)*MT(4,s)*T(4,2)*T1(2,1) - 
     -  MT(1,s)*MT(2,d)*T(4,4)*T1(2,1) + 
     -  MT(1,d)*MT(2,s)*T(4,4)*T1(2,1) + 
     -  MT(2,s)*MT(3,d)*T(1,1)*T1(2,3) - 
     -  MT(2,d)*MT(3,s)*T(1,1)*T1(2,3) - 
     -  MT(1,s)*MT(3,d)*T(1,2)*T1(2,3) + 
     -  MT(1,d)*MT(3,s)*T(1,2)*T1(2,3) + 
     -  MT(1,s)*MT(2,d)*T(1,3)*T1(2,3) - 
     -  MT(1,d)*MT(2,s)*T(1,3)*T1(2,3) - 
     -  MT(1,s)*MT(3,d)*T(2,1)*T1(2,3) + 
     -  MT(1,d)*MT(3,s)*T(2,1)*T1(2,3) + 
     -  MT(2,s)*MT(3,d)*T(2,2)*T1(2,3) - 
     -  MT(2,d)*MT(3,s)*T(2,2)*T1(2,3) - 
     -  MT(3,s)*MT(4,d)*T(2,4)*T1(2,3) + 
     -  MT(3,d)*MT(4,s)*T(2,4)*T1(2,3) + 
     -  MT(1,s)*MT(2,d)*T(3,1)*T1(2,3) - 
     -  MT(1,d)*MT(2,s)*T(3,1)*T1(2,3) + 
     -  MT(2,s)*MT(3,d)*T(3,3)*T1(2,3) - 
     -  MT(2,d)*MT(3,s)*T(3,3)*T1(2,3) + 
     -  MT(2,s)*MT(4,d)*T(3,4)*T1(2,3) - 
     -  MT(2,d)*MT(4,s)*T(3,4)*T1(2,3) - 
     -  MT(3,s)*MT(4,d)*T(4,2)*T1(2,3) + 
     -  MT(3,d)*MT(4,s)*T(4,2)*T1(2,3) + 
     -  MT(2,s)*MT(4,d)*T(4,3)*T1(2,3) - 
     -  MT(2,d)*MT(4,s)*T(4,3)*T1(2,3) - 
     -  MT(2,s)*MT(3,d)*T(4,4)*T1(2,3) + 
     -  MT(2,d)*MT(3,s)*T(4,4)*T1(2,3) + 
     -  MT(2,s)*MT(4,d)*T(1,1)*T1(2,4) - 
     -  MT(2,d)*MT(4,s)*T(1,1)*T1(2,4) - 
     -  MT(1,s)*MT(4,d)*T(1,2)*T1(2,4) + 
     -  MT(1,d)*MT(4,s)*T(1,2)*T1(2,4) + 
     -  MT(1,s)*MT(2,d)*T(1,4)*T1(2,4) - 
     -  MT(1,d)*MT(2,s)*T(1,4)*T1(2,4) - 
     -  MT(1,s)*MT(4,d)*T(2,1)*T1(2,4) + 
     -  MT(1,d)*MT(4,s)*T(2,1)*T1(2,4) + 
     -  MT(2,s)*MT(4,d)*T(2,2)*T1(2,4) - 
     -  MT(2,d)*MT(4,s)*T(2,2)*T1(2,4) + 
     -  MT(3,s)*MT(4,d)*T(2,3)*T1(2,4) - 
     -  MT(3,d)*MT(4,s)*T(2,3)*T1(2,4) + 
     -  MT(3,s)*MT(4,d)*T(3,2)*T1(2,4) - 
     -  MT(3,d)*MT(4,s)*T(3,2)*T1(2,4) - 
     -  MT(2,s)*MT(4,d)*T(3,3)*T1(2,4) + 
     -  MT(2,d)*MT(4,s)*T(3,3)*T1(2,4) + 
     -  MT(2,s)*MT(3,d)*T(3,4)*T1(2,4) - 
     -  MT(2,d)*MT(3,s)*T(3,4)*T1(2,4) + 
     -  MT(1,s)*MT(2,d)*T(4,1)*T1(2,4) - 
     -  MT(1,d)*MT(2,s)*T(4,1)*T1(2,4) + 
     -  MT(2,s)*MT(3,d)*T(4,3)*T1(2,4) - 
     -  MT(2,d)*MT(3,s)*T(4,3)*T1(2,4) + 
     -  MT(2,s)*MT(4,d)*T(4,4)*T1(2,4) - 
     -  MT(2,d)*MT(4,s)*T(4,4)*T1(2,4) - 
     -  MT(1,s)*MT(3,d)*T(1,1)*T1(3,1) + 
     -  MT(1,d)*MT(3,s)*T(1,1)*T1(3,1) + 
     -  MT(2,s)*MT(3,d)*T(1,2)*T1(3,1) - 
     -  MT(2,d)*MT(3,s)*T(1,2)*T1(3,1) - 
     -  MT(3,s)*MT(4,d)*T(1,4)*T1(3,1) + 
     -  MT(3,d)*MT(4,s)*T(1,4)*T1(3,1) + 
     -  MT(2,s)*MT(3,d)*T(2,1)*T1(3,1) - 
     -  MT(2,d)*MT(3,s)*T(2,1)*T1(3,1) - 
     -  MT(1,s)*MT(3,d)*T(2,2)*T1(3,1) + 
     -  MT(1,d)*MT(3,s)*T(2,2)*T1(3,1) + 
     -  MT(1,s)*MT(2,d)*T(2,3)*T1(3,1) - 
     -  MT(1,d)*MT(2,s)*T(2,3)*T1(3,1) + 
     -  MT(1,s)*MT(2,d)*T(3,2)*T1(3,1) - 
     -  MT(1,d)*MT(2,s)*T(3,2)*T1(3,1) + 
     -  MT(1,s)*MT(3,d)*T(3,3)*T1(3,1) - 
     -  MT(1,d)*MT(3,s)*T(3,3)*T1(3,1) + 
     -  MT(1,s)*MT(4,d)*T(3,4)*T1(3,1) - 
     -  MT(1,d)*MT(4,s)*T(3,4)*T1(3,1) - 
     -  MT(3,s)*MT(4,d)*T(4,1)*T1(3,1) + 
     -  MT(3,d)*MT(4,s)*T(4,1)*T1(3,1) + 
     -  MT(1,s)*MT(4,d)*T(4,3)*T1(3,1) - 
     -  MT(1,d)*MT(4,s)*T(4,3)*T1(3,1) - 
     -  MT(1,s)*MT(3,d)*T(4,4)*T1(3,1) + 
     -  MT(1,d)*MT(3,s)*T(4,4)*T1(3,1) - 
     -  MT(2,s)*MT(3,d)*T(1,1)*T1(3,2) + 
     -  MT(2,d)*MT(3,s)*T(1,1)*T1(3,2) + 
     -  MT(1,s)*MT(3,d)*T(1,2)*T1(3,2) - 
     -  MT(1,d)*MT(3,s)*T(1,2)*T1(3,2) - 
     -  MT(1,s)*MT(2,d)*T(1,3)*T1(3,2) + 
     -  MT(1,d)*MT(2,s)*T(1,3)*T1(3,2) + 
     -  MT(1,s)*MT(3,d)*T(2,1)*T1(3,2) - 
     -  MT(1,d)*MT(3,s)*T(2,1)*T1(3,2) - 
     -  MT(2,s)*MT(3,d)*T(2,2)*T1(3,2) + 
     -  MT(2,d)*MT(3,s)*T(2,2)*T1(3,2) + 
     -  MT(3,s)*MT(4,d)*T(2,4)*T1(3,2) - 
     -  MT(3,d)*MT(4,s)*T(2,4)*T1(3,2) - 
     -  MT(1,s)*MT(2,d)*T(3,1)*T1(3,2) + 
     -  MT(1,d)*MT(2,s)*T(3,1)*T1(3,2) - 
     -  MT(2,s)*MT(3,d)*T(3,3)*T1(3,2) + 
     -  MT(2,d)*MT(3,s)*T(3,3)*T1(3,2) - 
     -  MT(2,s)*MT(4,d)*T(3,4)*T1(3,2) + 
     -  MT(2,d)*MT(4,s)*T(3,4)*T1(3,2) + 
     -  MT(3,s)*MT(4,d)*T(4,2)*T1(3,2) - 
     -  MT(3,d)*MT(4,s)*T(4,2)*T1(3,2) - 
     -  MT(2,s)*MT(4,d)*T(4,3)*T1(3,2) + 
     -  MT(2,d)*MT(4,s)*T(4,3)*T1(3,2) + 
     -  MT(2,s)*MT(3,d)*T(4,4)*T1(3,2) - 
     -  MT(2,d)*MT(3,s)*T(4,4)*T1(3,2) + 
     -  MT(3,s)*MT(4,d)*T(1,1)*T1(3,4) - 
     -  MT(3,d)*MT(4,s)*T(1,1)*T1(3,4) - 
     -  MT(1,s)*MT(4,d)*T(1,3)*T1(3,4) + 
     -  MT(1,d)*MT(4,s)*T(1,3)*T1(3,4) + 
     -  MT(1,s)*MT(3,d)*T(1,4)*T1(3,4) - 
     -  MT(1,d)*MT(3,s)*T(1,4)*T1(3,4) - 
     -  MT(3,s)*MT(4,d)*T(2,2)*T1(3,4) + 
     -  MT(3,d)*MT(4,s)*T(2,2)*T1(3,4) + 
     -  MT(2,s)*MT(4,d)*T(2,3)*T1(3,4) - 
     -  MT(2,d)*MT(4,s)*T(2,3)*T1(3,4) - 
     -  MT(2,s)*MT(3,d)*T(2,4)*T1(3,4) + 
     -  MT(2,d)*MT(3,s)*T(2,4)*T1(3,4) - 
     -  MT(1,s)*MT(4,d)*T(3,1)*T1(3,4) + 
     -  MT(1,d)*MT(4,s)*T(3,1)*T1(3,4) + 
     -  MT(2,s)*MT(4,d)*T(3,2)*T1(3,4) - 
     -  MT(2,d)*MT(4,s)*T(3,2)*T1(3,4) + 
     -  MT(3,s)*MT(4,d)*T(3,3)*T1(3,4) - 
     -  MT(3,d)*MT(4,s)*T(3,3)*T1(3,4) + 
     -  MT(1,s)*MT(3,d)*T(4,1)*T1(3,4) - 
     -  MT(1,d)*MT(3,s)*T(4,1)*T1(3,4) - 
     -  MT(2,s)*MT(3,d)*T(4,2)*T1(3,4) + 
     -  MT(2,d)*MT(3,s)*T(4,2)*T1(3,4) + 
     -  MT(3,s)*MT(4,d)*T(4,4)*T1(3,4) - 
     -  MT(3,d)*MT(4,s)*T(4,4)*T1(3,4) - 
     -  MT(1,s)*MT(4,d)*T(1,1)*T1(4,1) + 
     -  MT(1,d)*MT(4,s)*T(1,1)*T1(4,1) + 
     -  MT(2,s)*MT(4,d)*T(1,2)*T1(4,1) - 
     -  MT(2,d)*MT(4,s)*T(1,2)*T1(4,1) + 
     -  MT(3,s)*MT(4,d)*T(1,3)*T1(4,1) - 
     -  MT(3,d)*MT(4,s)*T(1,3)*T1(4,1) + 
     -  MT(2,s)*MT(4,d)*T(2,1)*T1(4,1) - 
     -  MT(2,d)*MT(4,s)*T(2,1)*T1(4,1) - 
     -  MT(1,s)*MT(4,d)*T(2,2)*T1(4,1) + 
     -  MT(1,d)*MT(4,s)*T(2,2)*T1(4,1) + 
     -  MT(1,s)*MT(2,d)*T(2,4)*T1(4,1) - 
     -  MT(1,d)*MT(2,s)*T(2,4)*T1(4,1) + 
     -  MT(3,s)*MT(4,d)*T(3,1)*T1(4,1) - 
     -  MT(3,d)*MT(4,s)*T(3,1)*T1(4,1) - 
     -  MT(1,s)*MT(4,d)*T(3,3)*T1(4,1) + 
     -  MT(1,d)*MT(4,s)*T(3,3)*T1(4,1) + 
     -  MT(1,s)*MT(3,d)*T(3,4)*T1(4,1) - 
     -  MT(1,d)*MT(3,s)*T(3,4)*T1(4,1) + 
     -  MT(1,s)*MT(2,d)*T(4,2)*T1(4,1) - 
     -  MT(1,d)*MT(2,s)*T(4,2)*T1(4,1) + 
     -  MT(1,s)*MT(3,d)*T(4,3)*T1(4,1) - 
     -  MT(1,d)*MT(3,s)*T(4,3)*T1(4,1) + 
     -  MT(1,s)*MT(4,d)*T(4,4)*T1(4,1) - 
     -  MT(1,d)*MT(4,s)*T(4,4)*T1(4,1) - 
     -  MT(2,s)*MT(4,d)*T(1,1)*T1(4,2) + 
     -  MT(2,d)*MT(4,s)*T(1,1)*T1(4,2) + 
     -  MT(1,s)*MT(4,d)*T(1,2)*T1(4,2) - 
     -  MT(1,d)*MT(4,s)*T(1,2)*T1(4,2) - 
     -  MT(1,s)*MT(2,d)*T(1,4)*T1(4,2) + 
     -  MT(1,d)*MT(2,s)*T(1,4)*T1(4,2) + 
     -  MT(1,s)*MT(4,d)*T(2,1)*T1(4,2) - 
     -  MT(1,d)*MT(4,s)*T(2,1)*T1(4,2) - 
     -  MT(2,s)*MT(4,d)*T(2,2)*T1(4,2) + 
     -  MT(2,d)*MT(4,s)*T(2,2)*T1(4,2) - 
     -  MT(3,s)*MT(4,d)*T(2,3)*T1(4,2) + 
     -  MT(3,d)*MT(4,s)*T(2,3)*T1(4,2) - 
     -  MT(3,s)*MT(4,d)*T(3,2)*T1(4,2) + 
     -  MT(3,d)*MT(4,s)*T(3,2)*T1(4,2) + 
     -  MT(2,s)*MT(4,d)*T(3,3)*T1(4,2) - 
     -  MT(2,d)*MT(4,s)*T(3,3)*T1(4,2) - 
     -  MT(2,s)*MT(3,d)*T(3,4)*T1(4,2) + 
     -  MT(2,d)*MT(3,s)*T(3,4)*T1(4,2) - 
     -  MT(1,s)*MT(2,d)*T(4,1)*T1(4,2) + 
     -  MT(1,d)*MT(2,s)*T(4,1)*T1(4,2) - 
     -  MT(2,s)*MT(3,d)*T(4,3)*T1(4,2) + 
     -  MT(2,d)*MT(3,s)*T(4,3)*T1(4,2) - 
     -  MT(2,s)*MT(4,d)*T(4,4)*T1(4,2) + 
     -  MT(2,d)*MT(4,s)*T(4,4)*T1(4,2) - 
     -  MT(3,s)*MT(4,d)*T(1,1)*T1(4,3) + 
     -  MT(3,d)*MT(4,s)*T(1,1)*T1(4,3) + 
     -  MT(1,s)*MT(4,d)*T(1,3)*T1(4,3) - 
     -  MT(1,d)*MT(4,s)*T(1,3)*T1(4,3) - 
     -  MT(1,s)*MT(3,d)*T(1,4)*T1(4,3) + 
     -  MT(1,d)*MT(3,s)*T(1,4)*T1(4,3) + 
     -  MT(3,s)*MT(4,d)*T(2,2)*T1(4,3) - 
     -  MT(3,d)*MT(4,s)*T(2,2)*T1(4,3) - 
     -  MT(2,s)*MT(4,d)*T(2,3)*T1(4,3) + 
     -  MT(2,d)*MT(4,s)*T(2,3)*T1(4,3) + 
     -  MT(2,s)*MT(3,d)*T(2,4)*T1(4,3) - 
     -  MT(2,d)*MT(3,s)*T(2,4)*T1(4,3) + 
     -  MT(1,s)*MT(4,d)*T(3,1)*T1(4,3) - 
     -  MT(1,d)*MT(4,s)*T(3,1)*T1(4,3) - 
     -  MT(2,s)*MT(4,d)*T(3,2)*T1(4,3) + 
     -  MT(2,d)*MT(4,s)*T(3,2)*T1(4,3) - 
     -  MT(3,s)*MT(4,d)*T(3,3)*T1(4,3) + 
     -  MT(3,d)*MT(4,s)*T(3,3)*T1(4,3) - 
     -  MT(1,s)*MT(3,d)*T(4,1)*T1(4,3) + 
     -  MT(1,d)*MT(3,s)*T(4,1)*T1(4,3) + 
     -  MT(2,s)*MT(3,d)*T(4,2)*T1(4,3) - 
     -  MT(2,d)*MT(3,s)*T(4,2)*T1(4,3) - 
     -  MT(3,s)*MT(4,d)*T(4,4)*T1(4,3) + 
     -  MT(3,d)*MT(4,s)*T(4,4)*T1(4,3)
           enddo
         enddo
       

         do s=1,4
           do d=1,4
          T2(s,d)=-T2(s,d)*gt
           enddo
         enddo
         
      wt2(1) = T2(1,1)
      wt2(2) = T2(1,2)
      wt2(3) = T2(1,3)
      wt2(4) = T2(1,4)
      wt2(5) = T2(2,1)
      wt2(6) = T2(2,2)
      wt2(7) = T2(2,3)
      wt2(8) = T2(2,4)
      wt2(9) = T2(3,1)
      wt2(10) = T2(3,2)
      wt2(11) = T2(3,3)
      wt2(12) = T2(3,4)
      wt2(13) = T2(4,1)
      wt2(14) = T2(4,2)
      wt2(15) = T2(4,3)
      wt2(16) = T2(4,4)
      wt2(17) = T2(5,1)
      wt2(18) = T2(6,1)

      return
      end