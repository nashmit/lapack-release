.TH  ZLAQR1 1 "November 2006" " LAPACK auxiliary routine (version 3.1) " " LAPACK auxiliary routine (version 3.1) " 
.SH NAME

.SH SYNOPSIS
.TP 19
SUBROUTINE ZLAQR1(
N, H, LDH, S1, S2, V )
.TP 19
.ti +4
COMPLEX*16
S1, S2
.TP 19
.ti +4
INTEGER
LDH, N
.TP 19
.ti +4
COMPLEX*16
H( LDH, * ), V( * )
.TP 19
.ti +4
COMPLEX*16
ZERO
.TP 19
.ti +4
PARAMETER
( ZERO = ( 0.0d0, 0.0d0 ) )
.TP 19
.ti +4
DOUBLE
PRECISION RZERO
.TP 19
.ti +4
PARAMETER
( RZERO = 0.0d0 )
.TP 19
.ti +4
COMPLEX*16
CDUM
.TP 19
.ti +4
DOUBLE
PRECISION H21S, H31S, S
.TP 19
.ti +4
INTRINSIC
ABS, DBLE, DIMAG
.TP 19
.ti +4
DOUBLE
PRECISION CABS1
.TP 19
.ti +4
CABS1(
CDUM ) = ABS( DBLE( CDUM ) ) + ABS( DIMAG( CDUM ) )
.TP 19
.ti +4
IF(
N.EQ.2 ) THEN
.TP 19
.ti +4
S
= CABS1( H( 1, 1 )-S2 ) + CABS1( H( 2, 1 ) )
.TP 19
.ti +4
IF(
S.EQ.RZERO ) THEN
.TP 19
.ti +4
V(
1 ) = ZERO
.TP 19
.ti +4
V(
2 ) = ZERO
.TP 19
.ti +4
ELSE
.TP 19
.ti +4
H21S
= H( 2, 1 ) / S
.TP 19
.ti +4
V(
1 ) = H21S*H( 1, 2 ) + ( H( 1, 1 )-S1 )*
( ( H( 1, 1 )-S2 ) / S )
.TP 19
.ti +4
V(
2 ) = H21S*( H( 1, 1 )+H( 2, 2 )-S1-S2 )
.TP 19
.ti +4
END
IF
.TP 19
.ti +4
ELSE
.TP 19
.ti +4
S
= CABS1( H( 1, 1 )-S2 ) + CABS1( H( 2, 1 ) ) +
CABS1( H( 3, 1 ) )
.TP 19
.ti +4
IF(
S.EQ.ZERO ) THEN
.TP 19
.ti +4
V(
1 ) = ZERO
.TP 19
.ti +4
V(
2 ) = ZERO
.TP 19
.ti +4
V(
3 ) = ZERO
.TP 19
.ti +4
ELSE
.TP 19
.ti +4
H21S
= H( 2, 1 ) / S
.TP 19
.ti +4
H31S
= H( 3, 1 ) / S
.TP 19
.ti +4
V(
1 ) = ( H( 1, 1 )-S1 )*( ( H( 1, 1 )-S2 ) / S ) +
H( 1, 2 )*H21S + H( 1, 3 )*H31S
.TP 19
.ti +4
V(
2 ) = H21S*( H( 1, 1 )+H( 2, 2 )-S1-S2 ) + H( 2, 3 )*H31S
.TP 19
.ti +4
V(
3 ) = H31S*( H( 1, 1 )+H( 3, 3 )-S1-S2 ) + H21S*H( 3, 2 )
.TP 19
.ti +4
END
IF
.TP 19
.ti +4
END
IF
.TP 19
.ti +4
END
.SH PURPOSE
