program PR_correction
      !code does parareal correction of 2d conduction code

      implicit none

      integer :: n_args
      !values_old : values from previous iteration, values is in third
      !column
      !values_new : values from this iteration, values is in third
      !column
      character(len = 1680) ::file_fine_values_old,file_coarse_values_old,file_coarse_values_new,file_PR_value_result
      !all variables for reading in file names
      integer :: i,j, nr
      character(len = 20) :: cnr,err_tol !number of rows
      double precision,dimension(:),allocatable::values_newG,values_oldG,values_oldF,values_PR

      n_args = command_argument_count() !number of arguments from command line 
      call get_command_argument(1, file_fine_values_old)
      call get_command_argument(2, file_coarse_values_new)
      call get_command_argument(3, file_coarse_values_old)
      call get_command_argument(4, file_PR_value_result)
      call get_command_argument(5, cnr)

      !Convert characters to integers- SD
      read(cnr,'(i10)') nr

      allocate(values_newG(nr),values_oldG(nr),values_oldF(nr),values_PR(nr))
      values_newG=0.
      values_oldG=0.
      values_oldF=0.
      values_PR=0.

      open(140,file= trim(file_fine_values_old),status='unknown')
      open(141,file= trim(file_coarse_values_old),status='unknown')
      open(142,file= trim(file_coarse_values_new),status='unknown')
      open(143,file= trim(file_PR_value_result),status='unknown')

      read(140,'(g14.6)',end=299)(values_oldF(i),i=1,nr)
299  write(6,*) "number of lines in fine_values_old", i-1


      read(141,'(g14.6)',end=300)(values_oldG(i),i=1,nr)
300  write(6,*) "number of lines in coarse_values_old", i-1

      read(142,'(g14.6)',end=301)(values_newG(i),i=1,nr)
301  write(6,*) "number of lines in coarse_values_new", i-1


     !Do the correction

     do i=1,nr
      values_PR(i) = values_oldF(i) + values_newG(i) - values_oldG(i)
     end do

     do j=1,nr
        write(143,'(g14.6)') values_PR(j)
     end do
     write(6,*) "Correction file written"

     deallocate(values_oldF, values_newG, values_oldG,values_PR)

end program PR_correction

