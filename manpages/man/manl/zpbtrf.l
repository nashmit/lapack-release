.TH  ZPBTRF 1 "November 2006" " LAPACK routine (version 3.1) " " LAPACK routine (version 3.1) " 
.SH NAME
ZPBTRF - the Cholesky factorization of a complex Hermitian positive definite band matrix A
.SH SYNOPSIS
.TP 19
SUBROUTINE ZPBTRF(
UPLO, N, KD, AB, LDAB, INFO )
.TP 19
.ti +4
CHARACTER
UPLO
.TP 19
.ti +4
INTEGER
INFO, KD, LDAB, N
.TP 19
.ti +4
COMPLEX*16
AB( LDAB, * )
.SH PURPOSE
ZPBTRF computes the Cholesky factorization of a complex Hermitian
positive definite band matrix A.

The factorization has the form
.br
   A = U**H * U,  if UPLO = \(aqU\(aq, or
.br
   A = L  * L**H,  if UPLO = \(aqL\(aq,
.br
where U is an upper triangular matrix and L is lower triangular.

.SH ARGUMENTS
.TP 8
UPLO    (input) CHARACTER*1
= \(aqU\(aq:  Upper triangle of A is stored;
.br
= \(aqL\(aq:  Lower triangle of A is stored.
.TP 8
N       (input) INTEGER
The order of the matrix A.  N >= 0.
.TP 8
KD      (input) INTEGER
The number of superdiagonals of the matrix A if UPLO = \(aqU\(aq,
or the number of subdiagonals if UPLO = \(aqL\(aq.  KD >= 0.
.TP 8
AB      (input/output) COMPLEX*16 array, dimension (LDAB,N)
On entry, the upper or lower triangle of the Hermitian band
matrix A, stored in the first KD+1 rows of the array.  The
j-th column of A is stored in the j-th column of the array AB
as follows:
if UPLO = \(aqU\(aq, AB(kd+1+i-j,j) = A(i,j) for max(1,j-kd)<=i<=j;
if UPLO = \(aqL\(aq, AB(1+i-j,j)    = A(i,j) for j<=i<=min(n,j+kd).

On exit, if INFO = 0, the triangular factor U or L from the
Cholesky factorization A = U**H*U or A = L*L**H of the band
matrix A, in the same storage format as A.
.TP 8
LDAB    (input) INTEGER
The leading dimension of the array AB.  LDAB >= KD+1.
.TP 8
INFO    (output) INTEGER
= 0:  successful exit
.br
< 0:  if INFO = -i, the i-th argument had an illegal value
.br
> 0:  if INFO = i, the leading minor of order i is not
positive definite, and the factorization could not be
completed.
.SH FURTHER DETAILS
The band storage scheme is illustrated by the following example, when
N = 6, KD = 2, and UPLO = \(aqU\(aq:
.br

On entry:                       On exit:
.br

    *    *   a13  a24  a35  a46      *    *   u13  u24  u35  u46
    *   a12  a23  a34  a45  a56      *   u12  u23  u34  u45  u56
   a11  a22  a33  a44  a55  a66     u11  u22  u33  u44  u55  u66

Similarly, if UPLO = \(aqL\(aq the format of A is as follows:
.br

On entry:                       On exit:
.br

   a11  a22  a33  a44  a55  a66     l11  l22  l33  l44  l55  l66
   a21  a32  a43  a54  a65   *      l21  l32  l43  l54  l65   *
   a31  a42  a53  a64   *    *      l31  l42  l53  l64   *    *

Array elements marked * are not used by the routine.
.br

Contributed by
.br
Peter Mayes and Giuseppe Radicati, IBM ECSEC, Rome, March 23, 1989

