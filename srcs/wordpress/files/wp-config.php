<?php
define( 'DB_NAME', 'wordpress' );

define( 'DB_USER', 'wp_user' );

define( 'DB_PASSWORD', 'wp_pass' );

define( 'DB_HOST', 'mysql' );

define( 'DB_CHARSET', 'utf8mb4' );

define( 'DB_COLLATE', '' );

define( 'AUTH_KEY',         'RKKtt:aa7K~Zd(G7IGo_m*C+_.[jnki>mZ~z)8id}9XVmxIX8xrv>4k|WX*Mp~Wh' );
define( 'SECURE_AUTH_KEY',  'u}>p(}$E1<DRAvnJqjws]sBOv)fMN8BM/ceHc1WmLS7|mH7^4l XmdWOIp;_#X0C' );
define( 'LOGGED_IN_KEY',    '?]L+10oEO=|rP0`si#E[X/]tW$!,Y,218F&*Nq-e|R7&B20D%.h6BI^Nl-fjwmNO' );
define( 'NONCE_KEY',        'Yl!Bk*zKL-c);xBWxo%gBJj?o?bP+;-[*ldB!VekCBnIIzKZnq e5f[ywuI@VoxM' );
define( 'AUTH_SALT',        'xmW^H}p.I5h({uU_I8rho;/Jp:ZLG*%#5Et?MJgUp?i8(LcBnv?z!e>^qz&mMQq.' );
define( 'SECURE_AUTH_SALT', 'E9iiJQAxAMH)z/<lCX$iy@HQ%m&MfF*^jkI4g~n{1 Yc{s$W*Of2|y@kHsDbwP_m' );
define( 'LOGGED_IN_SALT',   'N=tW29Ps8MvqEn46!Fg57KKU$(!k-G621m)Bdosim|n0Rr/,,OLh%d7!w;]h_Cs8' );
define( 'NONCE_SALT',       '?nf_4HZ~=#4=ytYdnM{J#u(S=)nLnW+cy#AC!^0/!-hE)m6bZpN8gZy[Qo@Ni*` ' );

$table_prefix = 'wp_';

define( 'WP_DEBUG', false );

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';
