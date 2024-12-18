/* Flot plugin for plotting error bars.

Copyright (c) 2007-2014 IOLA and Ole Laursen.
Licensed under the MIT license.

Error bars are used to show standard deviation and other statistical
properties in a plot.

* Created by Rui Pereira  -  rui (dot) pereira (at) gmail (dot) com

This plugin allows you to plot error-bars over points. Set "errorbars" inside
the points series to the axis name over which there will be error values in
your data array (*even* if you do not intend to plot them later, by setting
"show: null" on xerr/yerr).

The plugin supports these options:

    series: {
        points: {
            errorbars: "x" or "y" or "xy",
            xerr: {
                show: null/false or true,
                asymmetric: null/false or true,
                upperCap: null or "-" or function,
                lowerCap: null or "-" or function,
                color: null or color,
                radius: null or number
            },
            yerr: { same options as xerr }
        }
    }

Each data point array is expected to be of the type:

    "x"  [ x, y, xerr ]
    "y"  [ x, y, yerr ]
    "xy" [ x, y, xerr, yerr ]

Where xerr becomes xerr_lower,xerr_upper for the asymmetric error case, and
equivalently for yerr. Eg., a datapoint for the "xy" case with symmetric
error-bars on X and asymmetric on Y would be:

    [ x, y, xerr, yerr_lower, yerr_upper ]

By default no end caps are drawn. Setting upperCap and/or lowerCap to "-" will
draw a small cap perpendicular to the error bar. They can also be set to a
user-defined drawing function, with (ctx, x, y, radius) as parameters, as eg.

    function drawSemiCircle( ctx, x, y, radius ) {
        ctx.beginPath();
        ctx.arc( x, y, radius, 0, Math.PI, false );
        ctx.moveTo( x - radius, y );
        ctx.lineTo( x + radius, y );
        ctx.stroke();
    }

Color and radius both default to the same ones of the points series if not
set. The independent radius parameter on xerr/yerr is useful for the case when
we may want to add error-bars to a line, without showing the interconnecting
points (with radius: 0), and still showing end caps on the error-bars.
shadowSize and lineWidth are derived as well from the points series.

*/

(function ($) {
    var options = {
        series: {
            points: {
                errorbars: null, //should be 'x', 'y' or 'xy'
                xerr: {err: 'x', show: null, asymmetric: null, upperCap: null, lowerCap: null, color: null, radius: null},
                yerr: {err: 'y', show: null, asymmetric: null, upperCap: null, lowerCap: null, color: null, radius: null}
            }
        }
    };

    function processRawData(plot, series, data, datapoints) {
        if (!series.points.errorbars) {
            return;
        }

        // x,y values
        var format = [
            { x: true, number: true, required: true },
            { y: true, number: true, required: true }
        ];

        var errors = series.points.errorbars;
        // error bars - first X then Y
        if (errors === 'x' || errors === 'xy') {
            // lower / upper error
            if (series.points.xerr.asymmetric) {
                format.push({ x: true, number: true, required: true });
                format.push({ x: true, number: true, required: true });
            } else {
                format.push({ x: true, number: true, required: true });
            }
        }
        if (errors === 'y' || errors === 'xy') {
            // lower / upper error
            if (series.points.yerr.asymmetric) {
                format.push({ y: true, number: true, required: true });
                format.push({ y: true, number: true, required: true });
            } else {
                format.push({ y: true, number: true, required: true });
            }
        }
        datapoints.format = format;
    }

    function parseErrors(series, i) {
        var points = series.datapoints.points;

        // read errors from points array
        var exl = null,
            exu = null,
            eyl = null,
            eyu = null;
        var xer O8          ����-l����-l�,l�����,l   �,l    �,l����5Rp`P  �+�dO 2p`P"�   �O           �O(          �����-lD-l����t-l    �-l����U�p`P  �+��O Rp`P Rp`P Rp`P Rp`P"�   O           <OH          �����.l�����.l   �.l   z.l�-l�����-l   7.l    \.l   p.l   x.l����Erp`P  �+��O 2p`P 2p`P"�   �O           �O8          ����h/l����~/l/l����?/l   X/l    ]/l����Erp`P  �+�$ O 2p`P 2p`P"�   L O           \ O8          ����0l����0l�/l�����/l   �/l    �/l����Erp`P  �+�� O 2p`P 2p`P"�   � O           � O8          �����0l�����0lD0l����{0l   �0l    �0l����E
r0p`�P  �+�@!O 20
p	`�P 20
p	`�P"�   h!O           x!O8          ����*2l����D2l�1l�����1l   2l    2l����
eh �0p`��P�+��!O	 h �0p`
��P  	 h �0p`
��P  "�   "O            "OH          �����3l�����3l�2l����93l   �3l    �3l�����h  0p
`	����P  �+��"O! !h �0p`��
��P  ! !h �0p`��
��P  "�   �"O           �"Oh          ����>5l����f5l&4l����m4l   5l    $5l����
eh �0p`��P�+�H#O	 h �0p`
��P  	 h �0p`
��P  "�   p#O           �#OH          ����7l����&7l66l����s6l   �6l    �6l����U�p`P  �+��#O Rp`P Rp`P Rp`P Rp`P"�   $O           0$OH          �����8l����9l   �8l   �8l�7l����8l   ^8l    �8l   �8l   �8l����	U�
0	p`���P  �+��$O r0p`�
��P r0p`�
��P"�   �$O           �$OH          �����9l����:l09l����k9l   �9l    �9l����U�p`P  �+�H%O Rp`P Rp`P Rp`P Rp`P"�   p%O           �%OH          ����^;l����t;l   6;l   ;lJ:l����~:l   �:l    �:l   ;l   ;l����Erp`P  �+��%O 2p`P 2p`P"�   &O           (&O8          ����
<l���� <l�;l�����;l   �;l    �;l����U�p`P  �+��&O Rp`P Rp`P Rp`P Rp`P"�   �&O           �&OH          ����6>l����L>l   >l   �=l"=l����V=l   �=l    �=l   �=l   �=l����U�p`P  �+�P'O Rp`P Rp`P Rp`P Rp`P"�   x'O           �'OH          �����?l�����?l   �?l   �?l�>l�����>l   @?l    e?l   y?l   �?l����5b`P�+��'O B`P  "�   (O           (O0          ����P@l@l����>@l    G@l����Uh �0p`P�+��(O h b	0p`P   h b	0p`P   h b	0p`P   h b	0p`P  "�   �(O           �(O8          ����0Al����Al����~Al   LAlx@l�����@l   �@l   �@l     Al   Al����E�0p`P�+��)O B	0p`P   B	0p`P   B	0p`P   B	0p`P   B	0p`P   B	0p`P  "�   �)O           �)O@          �����Bl����lBl����TBl�����Bl   �Bl   �Bl�Al�����Al   �Al   Bl   (Bl    6Bl   DBl   IBl����� 0p
`	����P  �+��+O	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  "�   ,O           �,O�          �����Fl����ZHl����8Hl����Hl�����Gl�����Gl�����Gl�����Gl����lGl����Gl�����Fl����pFl����NFl����,Fl����|Hl   �Fl   4Gl�Cl����gDl    �Dl   �Dl   �Dl   �Dl   �Dl   �Dl   El   /El   >El   WEl   vEl	   �El
   �El   �El   �El   �El   �El   Fl   *Fl����U�p`P  �+��-O Rp`P Rp`P Rp`P Rp`P"�   �-O           �-OH          �����Il�����Il   �Il   �Il�Hl�����Hl   FIl    kIl   Il   �Il���� h x � � �p`  U�p`P  �+�\.O Rp`P Rp`P Rp`P Rp`P"�   �.O           �.OH          ����XLl����nLl   0Ll   LlDKl����xKl   �Kl    �Kl   �Kl   Ll����U�p`P  �+�/O Rp`P Rp`P Rp`P Rp`P"�   D/O           d/OH          ����LNl����bNl   $Nl   �Ml8Ml����lMl   �Ml    �Ml   �Ml   �Ml����Erp`P  �+��/O 2p`P 2p`P"�   �/O           �/O8          �����Nl���� Ol�Nl�����Nl   �Nl    �Nl����E�0p`��P�+�`0O b0p`
��P   b0p`
��P  "�   �0O           �0O@          �����Ol�����Ol(Ol����Ol   �Ol    �Ol����E�0p`P�+�01O B	0p`P   B	0p`P   B	0p`P   B	0p`P   B	0p`P   B	0p`P  "�   X1O           �1O@          �����Pl�����Pl�����Pl����dQl   :Ql   Ql$Pl����`Pl   oPl   �Pl   �Pl    �Pl   �Pl   �Pl����U�p`P  �+�2O Rp`P Rp`P Rp`P Rp`P"�   82O           X2OH          ����0Sl����FSl   Sl   �RlRl����NRl   �Rl    �Rl   �Rl   �Rl����Erp`P  �+��2O 2p`P 2p`P"�   �2O           �2O8          ����`Vl����vVl Vl����7Vl   PVl    UVl����Erp`P  �+�@3O 2p`P 2p`P"�   h3O           x3O8          �����Vl����Wl�Vl�����Vl   �Vl    �Vl����E�0p`P�+��3O B	0p`P   B	0p`P   B	0p`P   B	0p`P  "�   4O           84O@          �����Wl�����Wl����*Xl    Xl<Wl����xWl   �Wl   �Wl    �Wl   �Wl����%B`P�+��4O B`P   B`P  "�   �4O           �4O           �����Xl�����Xl�Xl�����Xl    �Xl   �Xl����E
r0p`�P  �+�85O R0
p	`�P R0
p	`�P R0
p	`�P"�   `5O           x5O8          �����Zl�����Zl����[l�Yl����\Zl   uZl   �Zl   �Zl    �Zl����5Rp`P  �+��5O 2p`P"�   �5O           �5O(          �����[l�[l�����[l    �[l����E
r0p`�P  �+�`6O R0
p	`�P R0
p	`�P R0
p	`�P"�   �6O           �6O8          ����
]l����$]l����>]l�[l�����\l   �\l   �\l   �\l    �\l����
E�0p
`	����P�+��8O	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  "�   �8O           X9O@          ����2al�����al����2bl�����bl�����bl����nbl�����bl����Jcl   cl����Ral�����bl����ral����bl�����al�����al�����al����al�����`l�]l����^l   O^l    q^l   �^l	   �^l
   _l   #_l   +_l����N_l   W_l   �_l   �_l   �_l�����_l   �_l����,`l   O`l   o`l   �`l   �`l�����`l   �`l   �`l����
U�0p
`	����P�+��;O	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  "�   �;O           �<OP          �����fl�����gl�����gl�����hl����6hl�����gl����hl�����hl   vhl����Vhl�����fl����zgl����Zgl����:gl����gl�����fl�����fl�cl�����cl   dl    3dl   vdl	   �dl   �dl   �dl�����dl   �dl   "el   4el   Sel
   _el�����el   �el   �el   fl   fl����9fl   Efl����afl   mfl����%B0p`P�+�p=O B	0p`P   B	0p`P  "�   �=O           �=O           �����il����ril
il����,il    Hil   Wil����5b0p`��P�+��=O B0p`
��P  "�    >O           (>O0          �����jl�il����ajl    fjl����%B0p`P�+�x>O B	0p`P   B	0p`P  "�   �>O           �>O           ����&kl����kl�jl�����jl    �jl   �jl����
U�0p
`	����P�+��@O	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  	 B0p`��
��P  "�   �@O           8AOP          ����<ol�����ol����pl����ql�����pl����Xpl����xpl����2ql   �pl�����pl����ol�����ol�����ol�����ol����|ol����\ol�����nl�kl����9ll   sll    �ll   �ll	   �ll   ml   %ml����Dml   Lml   �ml   �ml   �ml
   �ml����nl   7nl   Wnl   snl   nl�����n