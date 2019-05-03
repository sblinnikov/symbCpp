! Ю.Н. ГРИГОРЬЕВ В.А. ВШИВКОВ
! ЧИСЛЕННЫЕ МЕТОДЫ "ЧАСТИЦЫ-В-ЯЧЕЙКАХ"
! Приложение Д. Подпрограмма численного интегрирования полной системы уравнений Максвелла

      subroutine emh(hx,hy,hz,ex,ey,ez,jx,jy,jz,tx,x0,y0,r0,r1,b0,wk,tau,h1,h2)
        parameter(imp=102,lmp=52)
        real*8 hx(imp,lmp),hy(imp,lmp),hz(imp,lmp), ! — массивы x,y,z-компонент магнитного поля,
     *    ex(imp,lmp),ey(imp,lmp),ez(imp,lmp), !  — массивы х,у,z-компонент электрического поля,
     *    jx(imp,lmp),jy(imp,lmp),jz(imp,lmp)  ! — массивы х,у,z-компонент плотности тока

!    tx — момент времени,
!    х0, у0 — начальное положение центра импульса,
!    г0 — среднеквадратичная полуширина импульса по оси y
!    r1 — среднеквадратичная полуширина импульса по оси x
!    b0 — амплитуда импульса,
!    wk — частота импульса,
!    tau — временной шаг,
!    h1 — шаг сетки по оси х,
!    h2 — шаг сетки по оси у.

        im1=imp-1
        lm1=lmp-1
        c1=tau/h1
        c2=tau/h2
c
c — Вычисление магнитных полей
c
        do 1 i=1,imp
          do 1 l=1,lm1
            hx(i,l)=hx(i,I)-c2*(ez(i,l+1)-ez(i,l))
1       continue
        do 2 i=1,iml
          do 2 l=1,lmp
            hy(i,l)=hy(i,l)+c1*(ez(i+1,l)-ez(i,l))
2       continue
        do 3 i=1,im1
          do 3 l=1,lm1
            hz(i,l)=hz(i,l)+c2*(ex(i,l+1)-ex(i,l))-c1*(ey(i+1,l)-ey(i,l))
3       continue
c
c — Вычисление электрических полей
c
        do 4 i=1,im1
          do 4 l=2,lm1
            ex(i,l)=ex(i,l)+c2*(hz(i,l)-hz(i,l-1))-tau*jx(i,l)
4       continue
        do 5 i=2,im1
          do 5 l=l,lm1
            ey(i,l)=ey(i,l)-c1*(hz(i,l)-hz(i-1,l))-tau*jy(i,l)
5       continue
        do 6 i=2,im1
          do 6 l=2,lm1
            ez(i,l)=ez(i,l)+c1*(hy(i,l)-hy(i-1,l))-c2*(hx(i,l)-hx(i,l-1))-tau*jz(i,l)
6       continue

c
c—Периодические граничные условия
c

        do 7 i=1,im1
          ex(i,1)=ex(i,lm1)
          ex(i,lmp)=ex(i,2)
7       continue
        do 8 i=2,im1
          ez(i,1)=ez(i,lm1)
          ez(i,lmp)=ez(i,2)
8       continue

c
c — Граничные условия, моделирующие импульс при х=0,
c — и граничные условия свободного выхода при х=хm.
c
        do 9 l=1,lm2 ! lm2 not defined?
          ex(1,l)=0.
          ex(imp,l)=(ex(imp,l)+c1*ex(im1,l))/(1.+c1)
9       continue
        do 10 l= 1,lm1
        x=-h1/2.
        y=(l-1.)*h2-y0
        r=(y/r0)**2+((x+x0-tx)/r1)**2
        b=b0*exp(-r/2.)
        s=wk*(tx-x)
        ey(1,l)=b*cos(s)
        ey(imp,l)=(ey(imp,l)+c1*ey(im1,l))/(1.+c1)
10      continue
        do 11 l=1,lmp
        x=-h1/2.
        y=(l-1.5)*h2-y0
        r=(y/r0)**2+((x+x0-tx)/r1)**2
        b=b0*exp(-r/2.)
        s=wk*(tx-x)
        ez(1,l)=b*sin(s)
        ez(imp,l)=(ez(imp,l)+c1*ez(im1,l))/(1.+c1)
11      continue
        return
      end subroutine emh
