.TH  CGEEV 1 "November 2006" " LAPACK driver routine (version 3.1) " " LAPACK driver routine (version 3.1) " 
.SH NAME
CGEEV - for an N-by-N complex nonsymmetric matrix A, the eigenvalues and, optionally, the left and/or right eigenvectors
.SH SYNOPSIS
.TP 18
SUBROUTINE CGEEV(
JOBVL, JOBVR, N, A, LDA, W, VL, LDVL, VR, LDVR,
WORK, LWORK, RWORK, INFO )
.TP 18
.ti +4
CHARACTER
JOBVL, JOBVR
.TP 18
.ti +4
INTEGER
INFO, LDA, LDVL, LDVR, LWORK, N
.TP 18
.ti +4
REAL
RWORK( * )
.TP 18
.ti +4
COMPLEX
A( LDA, * ), VL( LDVL, * ), VR( LDVR, * ),
W( * ), WORK( * )
.SH PURPOSE
CGEEV computes for an N-by-N complex nonsymmetric matrix A, the
eigenvalues and, optionally, the left and/or right eigenvectors.

The right eigenvector v(j) of A satisfies
.br
                 A * v(j) = lambda(j) * v(j)
.br
where lambda(j) is its eigenvalue.
.br
The left eigenvector u(j) of A satisfies
.br
              u(j)**H * A = lambda(j) * u(j)**H
.br
where u(j)**H denotes the conjugate transpose of u(j).
.br

The computed eigenvectors are normalized to have Euclidean norm
equal to 1 and largest component real.
.br

.SH ARGUMENTS
.TP 8
JOBVL   (input) CHARACTER*1
= \(aqN\(aq: left eigenvectors of A are not computed;
.br
= \(aqV\(aq: left eigenvectors of are computed.
.TP 8
JOBVR   (input) CHARACTER*1
.br
= \(aqN\(aq: right eigenvectors of A are not computed;
.br
= \(aqV\(aq: right eigenvectors of A are computed.
.TP 8
N       (input) INTEGER
The order of the matrix A. N >= 0.
.TP 8
A       (input/output) COMPLEX array, dimension (LDA,N)
On entry, the N-by-N matrix A.
On exit, A has been overwritten.
.TP 8
LDA     (input) INTEGER
The leading dimension of the array A.  LDA >= max(1,N).
.TP 8
W       (output) COMPLEX array, dimension (N)
W contains the computed eigenvalues.
.TP 8
VL      (output) COMPLEX array, dimension (LDVL,N)
If JOBVL = \(aqV\(aq, the left eigenvectors u(j) are stored one
after another in the columns of VL, in the same order
as their eigenvalues.
If JOBVL = \(aqN\(aq, VL is not referenced.
u(j) = VL(:,j), the j-th column of VL.
.TP 8
LDVL    (input) INTEGER
The leading dimension of the array VL.  LDVL >= 1; if
JOBVL = \(aqV\(aq, LDVL >= N.
.TP 8
VR      (output) COMPLEX array, dimension (LDVR,N)
If JOBVR = \(aqV\(aq, the right eigenvectors v(j) are stored one
after another in the columns of VR, in the same order
as their eigenvalues.
If JOBVR = \(aqN\(aq, VR is not referenced.
v(j) = VR(:,j), the j-th column of VR.
.TP 8
LDVR    (input) INTEGER
The leading dimension of the array VR.  LDVR >= 1; if
JOBVR = \(aqV\(aq, LDVR >= N.
.TP 8
WORK    (workspace/output) COMPLEX array, dimension (MAX(1,LWORK))
On exit, if INFO = 0, WORK(1) returns the optimal LWORK.
.TP 8
LWORK   (input) INTEGER
The dimension of the array WORK.  LWORK >= max(1,2*N).
For good performance, LWORK must generally be larger.

If LWORK = -1, then a workspace query is assumed; the routine
only calculates the optimal size of the WORK array, returns
this value as the first entry of the WORK array, and no error
message related to LWORK is issued by XERBLA.
.TP 8
RWORK   (workspace) REAL array, dimension (2*N)
.TP 8
INFO    (output) INTEGER
= 0:  successful exit
.br
< 0:  if INFO = -i, the i-th argument had an illegal value.
.br
> 0:  if INFO = i, the QR algorithm failed to compute all the
eigenvalues, and no eigenvectors have been computed;
elements and i+1:N of W contain eigenvalues which have
converged.
