! Ю.Н. ГРИГОРЬЕВ В.А. ВШИВКОВ
! ЧИСЛЕННЫЕ МЕТОДЫ "ЧАСТИЦЫ-В-ЯЧЕЙКАХ"
! Приложение Д. Подпрограмма численного интегрирования полной системы уравнений Максвелла

      subroutine emh(hx,hy,hz,ex,ey,ez,jx,jy,jz,tx,x0,y0,r0,r1,b0,wk,tau,h1,h2)
        parameter(imp=102,lmp=52)
        real*8 hx(imp,lmp),hy(imp,lmp),hz(imp,lmp), ! — массивы x,y,z-компонент магнитного поля,
     *    ex(imp,lmp),ey(imp,lmp),ez(imp,lmp), !  — массивы х,у,z-компонент электрического поля,
     *     jx(imp,lmp),jy(imp,lmp),jz(imp,lmp) ! — массивы х,у,z-компонент плотности тока
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

      end subroutine emh
