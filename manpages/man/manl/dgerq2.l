.TH  DGERQ2 1 "November 2006" " LAPACK routine (version 3.1) " " LAPACK routine (version 3.1) " 
.SH NAME
DGERQ2 - an RQ factorization of a real m by n matrix A
.SH SYNOPSIS
.TP 19
SUBROUTINE DGERQ2(
M, N, A, LDA, TAU, WORK, INFO )
.TP 19
.ti +4
INTEGER
INFO, LDA, M, N
.TP 19
.ti +4
DOUBLE
PRECISION A( LDA, * ), TAU( * ), WORK( * )
.SH PURPOSE
DGERQ2 computes an RQ factorization of a real m by n matrix A:
A = R * Q.
.br

.SH ARGUMENTS
.TP 8
M       (input) INTEGER
The number of rows of the matrix A.  M >= 0.
.TP 8
N       (input) INTEGER
The number of columns of the matrix A.  N >= 0.
.TP 8
A       (input/output) DOUBLE PRECISION array, dimension (LDA,N)
On entry, the m by n matrix A.
On exit, if m <= n, the upper triangle of the subarray
A(1:m,n-m+1:n) contains the m by m upper triangular matrix R;
if m >= n, the elements on and above the (m-n)-th subdiagonal
contain the m by n upper trapezoidal matrix R; the remaining
elements, with the array TAU, represent the orthogonal matrix
Q as a product of elementary reflectors (see Further
Details).
.TP 8
LDA     (input) INTEGER
The leading dimension of the array A.  LDA >= max(1,M).
.TP 8
TAU     (output) DOUBLE PRECISION array, dimension (min(M,N))
The scalar factors of the elementary reflectors (see Further
Details).
.TP 8
WORK    (workspace) DOUBLE PRECISION array, dimension (M)
.TP 8
INFO    (output) INTEGER
= 0: successful exit
.br
< 0: if INFO = -i, the i-th argument had an illegal value
.SH FURTHER DETAILS
The matrix Q is represented as a product of elementary reflectors

   Q = H(1) H(2) . . . H(k), where k = min(m,n).
.br

Each H(i) has the form
.br

   H(i) = I - tau * v * v\(aq
.br

where tau is a real scalar, and v is a real vector with
.br
v(n-k+i+1:n) = 0 and v(n-k+i) = 1; v(1:n-k+i-1) is stored on exit in
A(m-k+i,1:n-k+i-1), and tau in TAU(i).
.br

